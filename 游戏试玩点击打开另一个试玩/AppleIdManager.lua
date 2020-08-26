--[[
--------------------------------------------Account login/logout-----------------------------------------------
	LoginStep(s) 1、检查网络连接，2、打开设置界面； 3、 注销原有账号；  4、登录新账号
	LogoutStep(s) 1. 打开设置界面， 2，注销账号
--]]
--[[
	检测网络连接
--]]

local CheckNetStatus = class(ASOSubTask)

function CheckNetStatus:ctor(endTaskCall)
	self.retry_interval = 5
end

function CheckNetStatus:init(timeLimit)
	g_timeoutDetector:init(timeLimit or 360)
end

function CheckNetStatus:execute()
	writeASOLog('CheckNetStatus: execute')
	toast('检测网络连接',1)
	while not TASK_END do
		if getNetTime()>0 then
			self:executeNextStep()
			return true
		else
			writeASOLog('网络错误~等待网络正常')
			toast('网络错误~等待网络正常',1)
			delay(self.retry_interval)
			self.retry_interval = self.retry_interval + 5
		end
		if self:isTimeout(1002) then
			return false
		end
	end
end

function CheckNetStatus:isTimeout(errorCode)
	if (g_timeoutDetector:isTimeout() ) then
		writeASOLog('检测网络连接超时')
		self:triggerCallback(errorCode)
		return true
	end
	return false
end
--[[
	打开设置界面
--]]
local OpenITunesAndAppSetting = class(ASOSubTask)

function OpenITunesAndAppSetting:ctor(endTaskCall)
	self.openedByUrl = false
	self.tryOpenTime = nil
	self.vpnPopCount = 0
end

function OpenITunesAndAppSetting:init()
	self.openedByUrl = false
	self.tryOpenTime = nil
	g_timeoutDetector:init(180)
end

function OpenITunesAndAppSetting:execute()
	writeASOLog('OpenITunesAndAppSetting: execute')
	toast('打开登录设置',1)
	closeApp(g_config.applePreferences)
	closeApp(g_config.appStore)
	delay(1)
	local ITunesAndAppTimes = 0
	while not TASK_END do
		while g_pictureInterfase.hasPopWind() do
			if g_pictureInterfase.findConnectVPNFail() then
				self.vpnPopCount = self.vpnPopCount + 1
				if self.vpnPopCount >= 18 then
					self:triggerCallback(1045)
					return
				end
			end
			if g_pictureInterfase.findLoginITunesWin() then
				writeASOLog('登录iTunes， 点cancel',1)
				g_pictureInterfase.clickCancelBtn()
			elseif g_pictureInterfase.findPasswordInput() and g_pictureInterfase.clickCancelLoginBtn() then
				writeASOLog('自动弹出登录界面，点取消',1)
				g_pictureInterfase.clickCancelLoginBtn()
			else
				writeASOLog('other pop wind',1)
				if self:otherPopWind() > 0 then
					return
				end
				delay(1)
			end
			
			if self:isTimeout(1==isFrontApp(g_config.applePreferences) and 1017 or 1003) then
				writeASOLog('打开设置界面超时')
				toast('打开设置界面超时',1)
				return
			end
		end

		self: xieyiProcess()
		
		if g_pictureInterfase.findITunesAndApp() then
			ITunesAndAppTimes = ITunesAndAppTimes + 1
			if ITunesAndAppTimes>=3 then
				writeASOLog('打开设置界面，执行下一步')
				toast('打开设置界面，执行下一步',1)
				self: executeNextStep()
				return
			else
				delay(1)
			end
		elseif self:isTimeout(1==isFrontApp(g_config.applePreferences) and 1017 or 1003) then
			writeASOLog('打开设置界面超时')
			toast('打开设置界面超时',1)
			return
		elseif not self.tryOpenTime or (os.time() - self.tryOpenTime) > 60 then
			self.tryOpenTime = os.time()
			self:openPreferences()
		elseif g_pictureInterfase.findSetting() then
			if not g_pictureInterfase.clickAppStoreIcon() then
				g_pictureInterfase.moveToAppStoreIcon()
			end
			delay(1)
		else
			writeASOLog('正在打开登录界面',1)
			delay(0.5)
		end
	end
end

function OpenITunesAndAppSetting:openPreferences()
	closeApp(g_config.applePreferences)
	delay(1)
	writeASOLog('打开iTunes')
	toast('打开登录界面',1)
	if self.openedByUrl then
		runApp(g_config.applePreferences)
	else
		self.openedByUrl = true
		openURL("prefs:root=STORE")	--打开登录界面
	end
	delay(1)
end
--[[
	注销原有账号
--]]
local LogoutOriginalAppId = class(ASOSubTask)

function LogoutOriginalAppId:init()
	g_timeoutDetector:init(180)
end

function LogoutOriginalAppId:execute()
	writeASOLog('LogoutOriginalAppId: execute')
	local bClicked = false
	while not TASK_END do
		while g_pictureInterfase.hasPopWind() do
			if g_pictureInterfase.clickLogoutBtn() then
				writeASOLog('点注销按钮')
				bClicked = true
			elseif g_pictureInterfase.clickCancelBtn() then
				writeASOLog('点取消按钮')
			elseif g_pictureInterfase.findPasswordInput() and g_pictureInterfase.clickCancelLoginBtn() then
				writeASOLog('自动弹出登录界面，点取消')
			else
				if self:otherPopWind() > 0 then
					return
				end
				delay(1)
			end
			
			if self:isTimeout(1017) then
				return
			end
		end
		self: xieyiProcess()

		if not g_pictureInterfase.findITunesAndApp() then
			delay(2)
			if not g_pictureInterfase.hasPopWind() and not g_pictureInterfase.findITunesAndApp() then
				-- local snapshotFile = g_config.log_path .. DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_reLogin.png'
				-- snapshot(snapshotFile)
				-- delay(2)
				-- uploadError(snapshotFile)
				writeASOLog('重新打开iTunes and appStore 界面')
				self:reTryTask(1017)
				return
			end
		elseif g_pictureInterfase.findLoginBtnBlue() then
			writeASOLog('LogoutOriginalAppId完成，执行下一步')
			self : executeNextStep()
			break
		elseif self:isTimeout(1017) then
			return
		elseif g_pictureInterfase.findLoginBtnGrey() then
			writeASOLog('正在等待注销账号完成')
			delay(2)

		elseif not bClicked and g_pictureInterfase.clickAppleId() then
			toast('注销账号',1)
			writeASOLog('点击账号进行注销')
			delay(2)
		else
			delay(2)
		end
	end
end
--[[
	登录苹果账号
--]]
local LoginAppleAccount = class(ASOSubTask)

function LoginAppleAccount:ctor( ... )
	self.stepName = 'LoginAppleAccount'
end

function LoginAppleAccount:init()
	g_timeoutDetector:init(300, g_taskData.startTime)
end

function LoginAppleAccount:execute()
	writeASOLog('LoginAppleAccount:execute')
	toast('输入账号密码，点登录',1)
	local login_ok = 0
	local wrongPassword = 0
	while not TASK_END do
		while g_pictureInterfase.hasPopWind() do
			if g_pictureInterfase.findLogoutBtn() and g_pictureInterfase.clickCancelBtn() then
				writeASOLog('登录成功自动弹出注销界面，点取消')
			elseif g_pictureInterfase.findPasswordInput() and g_pictureInterfase.clickCancelLoginBtn() then
				writeASOLog('自动弹出登录界面，点取消')
			elseif g_pictureInterfase.findWrongAppleIdZone() then
				self:triggerCallback(1032)
				return
			elseif self:otherPopWind() > 0 then
				return
			end
			delay(1)
			
			if self:isTimeout(1017) then
				return
			end
		end
		self: xieyiProcess()
		if not g_pictureInterfase.findITunesAndApp() then
			delay(2)
			if not g_pictureInterfase.hasPopWind() and not g_pictureInterfase.findITunesAndApp() then
				writeASOLog('重新打开iTunes and appStore 界面')
				self:reTryTask(1017)
				return
			end
		elseif g_pictureInterfase.findAppleId() then
			g_timeoutDetector:init(60) --重启超时计算
			login_ok = login_ok + 1
			if login_ok >= 3 then
				writeASOLog('登录成功')
				closeApp(g_config.appStore)
				self:executeNextStep()
				return
			else
				c_tu(m.openSwitch)
				delay(0.5)
			end
		elseif self:isTimeout(1017) then
			return
		elseif g_pictureInterfase.clickLoginBtnBlue() then
			delay(1)
			input("\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b")
			input(g_taskData.appleId)                  
			writeASOLog('输入账号')
			if g_pictureInterfase.clickPasswordInput() then
				input('1')
				if g_pictureInterfase.findPasswordInput() then
					input('\b')
					g_pictureInterfase.clickReturnKey()
				else
					input('\b')
				end
				input(g_taskData.password)
				writeASOLog('输入密码')
			end
			if g_pictureInterfase.clickLoginBtn() then
				writeASOLog('点击登录按钮')
			end 
			delay(1)
		elseif g_pictureInterfase.findLoginBtnGrey() then
			writeASOLog('正在登录')
			delay(1)
		else
			delay(0.5)
		end
	end
end

--[[
	密码设置
--]]
local AppleIdPasswordSetting = class(ASOSubTask)

function AppleIdPasswordSetting:ctor( ... )
	self.stepName = 'AppleIdPasswordSetting'
end

function AppleIdPasswordSetting:init( )
	g_timeoutDetector:init(120, g_taskData.startTime)
end

function AppleIdPasswordSetting:execute()
	writeASOLog('AppleIdPasswordSetting:execute')
	toast('检查密码设置',1)
	while not TASK_END do
		while g_pictureInterfase.hasPopWind() do
			if g_pictureInterfase.findWrongAppleIdZone() then
				self:triggerCallback(1032)
				return
			elseif self:otherPopWind() > 0 then
				return
			end
			delay(1)

			if self:isTimeout(1017) then
				return
			end
		end
		self:xieyiProcess()
		if 1 ~= isFrontApp(g_config.applePreferences) then
			openURL("prefs:root=STORE")
			delay(2)
		elseif g_pictureInterfase.findNeedPwd() and not g_pictureInterfase.clickNeedPwdBtn() then
			click(56, 80)
			return
		elseif g_pictureInterfase.clickPasswordSetting() or g_pictureInterfase.clickNeedPwdIn15Min() then
		else
			delay(0.5)
		end
		if self:isTimeout(1017) then
			return
		end
	end
end

function AppleIdPasswordSetting:reTryTask(errorCode, snapFilePath)
	if self.firstStep and not self.bRetryed then
		self.bRetryed = true
		closeApp(frontAppBid())                 	--关闭前台应用
		closeApp(g_config.applePreferences)
		self.firstStep:init()
		self.firstStep:execute()
	end
end


--[[
	class AccountManager
--]]
local AccountManager = {} --class()

function AccountManager : checkAppIdLogin(endTaskCall)
	local step1 = CheckNetStatus.new(endTaskCall)
	local step2 = OpenITunesAndAppSetting.new(endTaskCall)
	local step3 = LoginAppleAccount.new(endTaskCall)
	local step4 = AppleIdPasswordSetting.new(endTaskCall)
	step1.nextStep = step2
	step2.nextStep = step3
	step3.nextStep = step4
	step4.nextStep = nil
	step2.firstStep = step2
	step3.firstStep = step2
	step4.firstStep = step4
	step1:init()
	step1:execute()
	return not TASK_END
end
function AccountManager:login(endTaskCall)
	writeASOLog('AccountManager: login')
	local step1 = CheckNetStatus.new(endTaskCall)
	local step2 = OpenITunesAndAppSetting.new(endTaskCall)
	local step3 = LogoutOriginalAppId.new(endTaskCall)
	local step4 = LoginAppleAccount.new(endTaskCall)
	local step5 = AppleIdPasswordSetting.new(endTaskCall)
	step1.nextStep = step2
	step2.nextStep = step3
	step3.nextStep = step4
	step4.nextStep = step5
	step5.nextStep = nil
	step2.firstStep = step2
	step3.firstStep = step2
	step4.firstStep = step2
	step5.firstStep = step5
	step1:init()
	step1:execute()
	return not TASK_END
end

function AccountManager:logout()
	writeASOLog('AccountManager: logout()')
	local step1 = OpenITunesAndAppSetting.new()
	local step2 = LogoutOriginalAppId.new()
	step1.nextStep = step2
	step2.nextStep = nil
	step1:init()
	step1:execute()
	writeASOLog('AccountManager: logout end')
	return not TASK_END
end

return AccountManager