-- TASK_RETRY_TIMES = 0
--[[
-------------------------------------------- 添加/删除VPN配置 -----------------------------------------------
	添加配置 1、打开设置/通用/VPN，2、点添加VPN配置 3、 选择类型  4、配置信息保存 5、连接
	删除配置 1. 打开设置/通用/VPN， 2，注销账号
--]]
local VPNSubTask = class(ASOSubTask)

function VPNSubTask:init( )
	g_timeoutDetector:init(120)
end

function VPNSubTask:reTryTask(errorCode, snapFilePath)
	if (self.firstStep and self:needRetryTask() ) then
		closeApp(frontAppBid())                 	--关闭前台应用
		closeApp(g_config.applePreferences)
		closeApp(g_config.appStore)                 --关闭appstore
		TASK_RETRY_TIMES = TASK_RETRY_TIMES + 1
		self.firstStep:init()
		self.firstStep:execute()
	else
		snapFilePath = getSnapshotFileName(errorCode)
		if snapFilePath then
			snapshot(g_config.log_path ..  snapFilePath)
		end
		self:triggerCallback(errorCode, snapFilePath)
	end
end

function VPNSubTask:popWindProcess( )
	local jhBid = 'com.apple.purplebuddy'
	if jhBid == frontAppBid() then
		writeASOLog('需要激活')
		g_pictureInterfase.activeDevice()
		if jhBid == frontAppBid() then
			return 4010
		end
	elseif g_pictureInterfase.clickCancelBtn() then
		writeASOLog('点取消')
	elseif c_tu(m.haoBtn) then
		writeASOLog('点hao 按钮')
	elseif c_pic(m.allowBtn) or c_tu(m.continueBtn) then
	else
		writeASOLog('点蓝色提示')
		g_pictureInterfase.clickBlueTipsBtn()
	end
	return 0
end
--[[
	打开vpn设置界面
--]]
local OpenVPNSetting = class(VPNSubTask)

function OpenVPNSetting:ctor( ... )
	self.tryOpenTime = nil
	self.openedByUrl = false
	self.vpnPopCount = 0
end

function OpenVPNSetting:execute( )
	writeASOLog('OpenVPNSetting:execute')
	closeApp(g_config.applePreferences)
	local openMode = 1  -- 打开方式： 1、 url， 2、设置->通用->vpn
	local function openApplePreferences( )
		if self.tryOpenTime and (os.time() - self.tryOpenTime) > 60  then
			closeApp(g_config.applePreferences)
			delay(2)
		end
		if not self.tryOpenTime or self.openedByUrl then
			writeASOLog('openApplePreferences, openMode = 1')
			openMode = 1
			openURL("prefs:root=General&path=VPN")	--打开vpn设置界面
			delay(1)
		else
			writeASOLog('openApplePreferences, openMode = 2')
			openMode = 2
			runApp(g_config.applePreferences)
			delay(1)
		end

		self.tryOpenTime = os.time()

		for i=1, 10 do
			if 1 == isFrontApp(g_config.applePreferences) then
				return
			else
				delay(1)
			end
		end
	end

	while not TASK_END do
		while g_pictureInterfase.hasPopWind() do
			writeASOLog('OpenVPNSetting hasPopWind')
			if g_pictureInterfase.findConnectVPNFail() then
				self.vpnPopCount = self.vpnPopCount + 1
				if self.vpnPopCount >= 18 then
					self:triggerCallback(1045)
					return
				end
			end
			local errorCode = self:popWindProcess()
			if errorCode > 0 then
				self:triggerCallback(errorCode)
				return
			end
			if self:isTimeout(1==isFrontApp(g_config.applePreferences) and 1031 or 1003 ) then
				return
			end
		end

		writeASOLog('打开VPN设置界面')
		if g_pictureInterfase.findVPNTitle() then
			if 1 == openMode then
				self.openedByUrl = true
			end
			self:executeNextStep()
			return
		elseif self:isTimeout(1==isFrontApp(g_config.applePreferences) and 1031 or 1003)  then
			return
		elseif not self.tryOpenTime or 1 ~= isFrontApp(g_config.applePreferences) then
			openApplePreferences()
		elseif os.time() - self.tryOpenTime > 60 then
			closeApp(g_config.applePreferences)
			delay(1)
		elseif g_pictureInterfase.findSetting() then
			-- 点general
			if g_pictureInterfase.clickGeneralBtn() then
				writeASOLog('点 通用')
			else
				g_pictureInterfase.moveToAppStoreIcon()
				delay(1)
			end
		elseif g_pictureInterfase.findGeneralTitle() then
			-- 点VPN
			if g_pictureInterfase.clickVPNSettingItem() then
				writeASOLog('点 VPN')
			else
				g_pictureInterfase.moveToAppStoreIcon()
				delay(1)
			end
		elseif g_pictureInterfase.backtoSetting() then
		else
			writeASOLog('啥也没找到。。。')
			delay(0.5)
		end
	end
end
--[[
	删除vpn配置
--]]
local DelVPNConfig = class(VPNSubTask)

function DelVPNConfig:execute( )
	writeASOLog('DelVPNConfig:execute')
	local bDisconnected = false
	local bRemoveByPlugin = false
	while not TASK_END do
		while g_pictureInterfase.hasPopWind() do
			if g_pictureInterfase.findDelVPNConfirm() and g_pictureInterfase.clickDelVPNBlueBtn() then
				writeASOLog('点蓝色删除')
			else
				local errorCode = self:popWindProcess()
				if errorCode > 0 then
					self:triggerCallback(errorCode)
					return
				end
			end
			if self:isTimeout(1031) then
				return
			end
		end

		if g_pictureInterfase.findVPNTitle() and not g_pictureInterfase.findTargetVPNConfig() then
			if not self.nextStep then
				if not bRemoveByPlugin then
					bRemoveByPlugin = true
					deleteVPNConfig(g_config.VPNDesc)
				end
			else
				self:executeNextStep()
			end
			return true
		elseif self:isTimeout(1031) then
			return
		elseif not bDisconnected then
			local vpnFlag = getVPNStatus()
			if '未连接' == vpnFlag.status then
				bDisconnected = true
			else
				setVPNEnable(false)
				delay(1)
			end
		elseif not bRemoveByPlugin and g_pictureInterfase.findTargetVPNConfig() then
			bRemoveByPlugin = true
			deleteVPNConfig(g_config.VPNDesc)
	        delay(1)
		elseif g_pictureInterfase.clickTargetVPNEditBtn() then
			writeASOLog('点 i 按钮')
		elseif g_pictureInterfase.clickDelVPN() then
			writeASOLog('点删除VPN')
		else
			delay(0.5)
		end
	end
end

local OpenAddVPNPage = class(VPNSubTask)

function OpenAddVPNPage:execute( )
	writeASOLog('OpenAddVPNPage:execute')
	while not TASK_END do
		while g_pictureInterfase.hasPopWind() do
			local errorCode = self:popWindProcess()
			if errorCode > 0 then
				self:triggerCallback(errorCode)
				return
			end
			if self:isTimeout(1031) then
				return
			end
		end
		if g_pictureInterfase.findAddConfigTitle() then
			self:executeNextStep()
			return
		elseif self:isTimeout(1031) then
			return
		elseif g_pictureInterfase.clickAddVPNCofig() then
			writeASOLog('点添加vpn配置')
		else
			delay(0.5)
		end
	end
end

local SelectVPNType = class(VPNSubTask)

function SelectVPNType:execute()
	writeASOLog('SelectVPNType:execute')
	local bSelected = false
	while not TASK_END do
		while g_pictureInterfase.hasPopWind() do
			local errorCode = self:popWindProcess()
			if errorCode > 0 then
				self:triggerCallback(errorCode)
				return
			end
			if self:isTimeout(1031) then
				return
			end
		end

		if g_pictureInterfase.findTargetVPNType() then
			self:executeNextStep()
			return
		elseif self:isTimeout(1031) then
			return
		elseif g_pictureInterfase.clickVPNType() then
			writeASOLog('点类型')
			bSelected = false
		elseif bSelected and g_pictureInterfase.clickBackAddVPNConfig() then
			writeASOLog('返回添加配置')
		elseif g_pictureInterfase.clickVPNL2TP() then
			writeASOLog('选择L2TP类型')
			bSelected = true
		else
			delay(0.2)
		end
	end
end

local InputVPNInfo = class(VPNSubTask)

function InputVPNInfo:execute( )
	writeASOLog('InputVPNInfo:execute')
	local bInputed = false
	while not TASK_END do
		while g_pictureInterfase.hasPopWind() do
			local errorCode = self:popWindProcess()
			if errorCode > 0 then
				self:triggerCallback(errorCode)
				return
			end
			if self:isTimeout(1031) then
				return
			end
		end

		if g_pictureInterfase.findVPNTitle() and g_pictureInterfase.findTargetVPNConfig() then
			self:executeNextStep()
			return
		elseif self:isTimeout(1031) then
			return
		elseif g_pictureInterfase.clickAddVPNCofig() then
			writeASOLog('点添加vpn配置')
			delay(0.5)
			if self.preStep then
				self.preStep:init()
				self.preStep:execute()
			else
				self:reTryTask(1031)
			end
			return
		elseif not bInputed and g_pictureInterfase.clickVPNDesc() then
			local vpn_config = g_taskData.VPNConfig
			delay(0.1)
			-- 描述
			input(g_config.VPNDesc)
			delay(0.2)
			g_pictureInterfase.clickReturnKey()
			-- 服务器
			delay(0.1)
			input(vpn_config.server)
			delay(0.2)
			g_pictureInterfase.clickReturnKey()
			-- 账号
			g_pictureInterfase.clickVpnAccountInput()
			delay(0.1)
			input(vpn_config.account)
			delay(0.2)
			g_pictureInterfase.clickReturnKey()
			-- 密码
			delay(0.1)
			input(vpn_config.password)
			delay(0.2)
			g_pictureInterfase.clickReturnKey()
			-- 密钥
			delay(0.1)
			input(vpn_config.key)
			delay(0.2)
			-- local snapFile = g_config.log_path .. DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_vpnInfo.png'
			-- snapshot(snapFile)
			-- uploadError(snapFile)
			g_pictureInterfase.clickReturnKey()
			delay(0.5)
			bInputed = true
		elseif g_pictureInterfase.clickCompleteRightTop() then
			writeASOLog('点右上角完成按钮')
		else
			delay(0.2)
		end
	end
end

local AddVPNConfig = class(VPNSubTask)

function AddVPNConfig:execute( )
	writeASOLog('AddVPNConfig:execute')
	local step1 = OpenAddVPNPage.new(self.endTaskCall)
	local step2 = SelectVPNType.new(self.endTaskCall)
	local step3 = InputVPNInfo.new(self.endTaskCall)

	step1.nextStep = step2
	step2.nextStep = step3
	step3.nextStep = nil

	step1.firstStep = self.firstStep
	step2.firstStep = self.firstStep
	step3.firstStep = self.firstStep

	step3.preStep = step2

	step1:init()
	step1:execute()
	if not TASK_END then
		self:executeNextStep()
	end
end

local ConnectVPN = class(VPNSubTask)

function ConnectVPN:ctor( ... )
	self.bClickedConnectBtn = false
end

function ConnectVPN:execute()
	writeASOLog('ConnectVPN:execute')
	local failTimes = 0
	local verifyFailTimes = 0
	local connnectVPNPop = nil
	local vpnVerifyFailSnap = DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_vpnVerifyFail.png'
	local bSelected = false
	while not TASK_END do
		while g_pictureInterfase.hasPopWind() do
			if g_pictureInterfase.findVpnVerifyFail() then
				snapshot(g_config.log_path ..  vpnVerifyFailSnap)
				verifyFailTimes = verifyFailTimes + 1
				if verifyFailTimes >= 20 then
					self:reTryTask(1031)
					return
				end
				local errorCode = self:popWindProcess()
				if errorCode > 0 then
					self:triggerCallback(errorCode)
					return
				end
			elseif g_pictureInterfase.clickInputVPNPassword() then
				failTimes = failTimes + 1
				if failTimes >= 20 then
					self:reTryTask(1031)
					return
				end
				input(g_taskData.VPNConfig.password)
				if c_tu(m.haoBtn) then
					writeASOLog('点hao 按钮')
				elseif g_pictureInterfase.clickBlueTipsBtn() then
					writeASOLog('点蓝色提示按钮')
				else
					writeASOLog('没有点到按钮')
				end
			elseif g_pictureInterfase.findConnectVPNFail() then
				do
					connnectVPNPop = g_config.log_path .. DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_connectVPNPop.png'
					snapshot(connnectVPNPop)
				end
				failTimes = failTimes + 1
				if failTimes >= 20 then
					self:reTryTask(1031)
					return
				end
				if g_pictureInterfase.clickCancelBtn() then
					writeASOLog('点取消')
				elseif c_tu(m.haoBtn) then
					writeASOLog('点hao 按钮')
				elseif g_pictureInterfase.clickBlueTipsBtn() then
					writeASOLog('点蓝色提示按钮')
				else
					writeASOLog('没有点到按钮')
				end
			else
				do
					connnectVPNPop = g_config.log_path .. DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_connectVPNPop.png'
					snapshot(connnectVPNPop)
				end
				local errorCode = self:popWindProcess()
				if errorCode > 0 then
					self:triggerCallback(errorCode)
					return
				end
			end
			local timeoutSnap = verifyFailTimes > 0 and vpnVerifyFailSnap or connnectVPNPop
			if self:isTimeout(verifyFailTimes > 0 and 1030 or 1031, timeoutSnap) then
				if connnectVPNPop then
					snapshot(connnectVPNPop)
					-- uploadError(connnectVPNPop)
				end
				return
			end
		end

		if bSelected then
			if not g_pictureInterfase.findSelectedTargetVPNConfig() then
				g_pictureInterfase.clickTargetVPNConfig()
				delay(2)
			end
			local vpnFlag = getVPNStatus()
			writeASOLog(vpnFlag)
			self.bClickedConnectBtn = true
			if '已连接' == vpnFlag.status then
				break
			elseif '未连接' == vpnFlag.status then
				setVPNEnable(true)
				self.bClickedConnectBtn = true
			end
			delay(0.5)
			-- if g_pictureInterfase.findConnectedState() then
			-- 	self:executeNextStep()
			-- 	return
			-- elseif g_pictureInterfase.clickConnectVPNBtn() then
			-- 	writeASOLog('点连接vpn按钮')
			-- 	self.bClickedConnectBtn = true
			-- 	delay(2)
			-- end
		elseif g_pictureInterfase.clickTargetVPNConfig() then
			writeASOLog('点目标VPN配置')
			bSelected = true
		elseif g_config.applePreferences ~= frontAppBid() then
			self:reTryTask(1031)
			return
		end

		local timeoutSnap = verifyFailTimes > 0 and vpnVerifyFailSnap or nil
		if self:isTimeout(verifyFailTimes > 0 and 1030 or 1031, timeoutSnap) then
			if connnectVPNPop then
				snapshot(connnectVPNPop)
				-- uploadError(connnectVPNPop)
			end
			return
		else
			delay(0.5)
		end
	end
end

function ConnectVPN:forceDisconnect( )
	do
		return false
	end 
	local vpnConfig = g_taskData.VPNConfig
	vpnConfig.passwordMd5 = vpnConfig.passwordMd5 or vpnConfig.password:md5()
	local reqURL = string.format('http://x.sryun.com/api/vip.php?arg=ti&username=%s&psw=%s', vpnConfig.account, vpnConfig.passwordMd5)
	local res, code = szocket_http.request(reqURL)
	writeASOLog('update_area1 res：' .. tostring(res))
	res = cjson.decode(res)
	if res and 'ok' == res.result then
		g_taskData.VPNForceDisconed = 1
		self.bClickedConnectBtn = false
		return true
	end
	return false
end

function ConnectVPN:reTryTask(errorCode, snapFilePath)
	if 1030 == errorCode and 0 ~= g_taskData.bVPNForceDiscon then
		if not self:forceDisconnect() then
			errorCode = 1042
			snapFilePath = getSnapshotFileName(errorCode)
			if snapFilePath then
				snapshot(g_config.log_path ..  snapFilePath)
			end
			self:triggerCallback(errorCode, snapFilePath)
			return
		end
	end
	if (g_config.applePreferences ~= frontAppBid() or not self.bClickedConnectBtn) and self.firstStep and self:needRetryTask() then
		TASK_RETRY_TIMES = TASK_RETRY_TIMES + 1
		closeApp(frontAppBid())                 	--关闭前台应用
		closeApp(g_config.applePreferences)
		closeApp(g_config.appStore)                 --关闭appstore
		self.firstStep:init()
		self.firstStep:execute()
		return
	elseif 1031 == errorCode and self.firstStep and '8.hunbo8.cc' == g_taskData.VPNConfig.server then
		g_taskData.VPNConfig.server = '88.hunbo8.cc'
		TASK_RETRY_TIMES = TASK_RETRY_TIMES + 1
		closeApp(frontAppBid())                 	--关闭前台应用
		closeApp(g_config.applePreferences)
		closeApp(g_config.appStore)                 --关闭appstore
		self.firstStep:init()
		self.firstStep:execute()
		return
	end
	if not snapFilePath then
		snapFilePath = getSnapshotFileName(errorCode)
		if snapFilePath then
			snapshot(g_config.log_path ..  snapFilePath)
			delay(2)
		end
	end
	self:triggerCallback(errorCode, snapFilePath)
end

local CreateVpnConnect = class(VPNSubTask)

function CreateVpnConnect:execute( )
	writeASOLog('CreateVpnConnect:execute')
	local vpn_config = g_taskData.VPNConfig
	writeASOLog(vpn_config)
	local vpnInfo = {
		dispName = g_config.VPNDesc,
		server = vpn_config.server,
		authorization = vpn_config.account,
		password = vpn_config.password,
		secret = vpn_config.key,
	}
	if not createVPNConfig(vpnInfo) then
		writeASOLog('not createVPNConfig'..vpnInfo)
    	self:reTryTask(1031)
    	return
    end

	while not TASK_END do
		while g_pictureInterfase.hasPopWind() do
			local errorCode = self:popWindProcess()
			if errorCode > 0 then
				self:triggerCallback(errorCode)
				return
			end
			if self:isTimeout(1031) then
				return
			end
		end
		if g_pictureInterfase.findVPNTitle() and g_pictureInterfase.findTargetVPNConfig() then
			self:executeNextStep()
			return
		elseif self:isTimeout(1031) then
			return
		else
			delay(0.2)
		end
	end
end

function CreateVpnConnect:reTryTask(errorCode, snapFilePath)
	if (self.firstStep and self:needRetryTask() ) then
		TASK_RETRY_TIMES = TASK_RETRY_TIMES + 1
		if self.preStep then
			local oldStep = AddVPNConfig.new(endTaskCall)
			oldStep.nextStep = self.nextStep
			oldStep.firstStep = self.firstStep
			self.preStep.nextStep = oldStep
		end

		closeApp(frontAppBid())                 	--关闭前台应用
		closeApp(g_config.applePreferences)
		closeApp(g_config.appStore)                 --关闭appstore
		self.firstStep:init()
		self.firstStep:execute()
	else
		snapFilePath = getSnapshotFileName(errorCode)
		if snapFilePath then
			snapshot(g_config.log_path ..  snapFilePath)
		end
		self:triggerCallback(errorCode, snapFilePath)
	end
end

local DisConnectVPN = class(VPNSubTask)

function DisConnectVPN:init()
	writeASOLog('DisConnectVPN--init')
	g_timeoutDetector:init(30)
end

function DisConnectVPN:execute( )
	writeASOLog('DisConnectVPN:execute')
	setVPNEnable(false)
	delay(1)
	while not TASK_END do
		if self:isTimeout(1031) then
			return false
		else
			local vpnFlag = getVPNStatus()
			writeASOLog(vpnFlag)
			if '未连接' == vpnFlag.status then
				self:executeNextStep()
				return true
			else
				setVPNEnable(false)
				delay(1)
			end
		end
	end
end

local VPNManager = {}

function VPNManager.connectVPN(endTaskCall)
	local step1 = OpenVPNSetting.new(endTaskCall)
	local step2 = DelVPNConfig.new(endTaskCall)
	local step3 = CreateVpnConnect.new(endTaskCall)
	local step4 = ConnectVPN.new(endTaskCall)

	step1.nextStep = step2
	step2.nextStep = step3
	step3.nextStep = step4
	step4.nextStep = nil

	step1.firstStep = step1
	step2.firstStep = step1
	step3.firstStep = step1
	step4.firstStep = step1
	
	
	step1:init()
	step1:execute()
	closeApp(g_config.applePreferences)
end

function VPNManager.removeVPN( bRetry )
	writeASOLog('VPNManager.removeVPN')
	if not VPNManager.disConnectVPN() then
		deleteVPNConfig(g_config.VPNDesc)
		delay(1)
	end
	local step1 = OpenVPNSetting.new()
	local step2 = DelVPNConfig.new()

	step1.nextStep = step2
	step2.nextStep = nil

	if bRetry then
		step1.firstStep = step1
		step2.firstStep = step1
	end

	step1:init()
	local bRet = step1:execute()
	closeApp(g_config.applePreferences)
	return bRet
 end

function VPNManager.reconnectVPN(endTaskCall)
	writeASOLog('taskReConnectVPN')
	if g_taskData.VPNConfig then
		local vpnAccount = g_taskData.VPNConfig.account
		if 'r8820' == string.sub(vpnAccount, 1, 3) then --and 'yhtip.com' == g_taskData.VPNConfig.server 
			local bRet, str, errCode = os.execute('ping 1.1.1.1')
			if bRet then
				return
			else
				writeASOLog('ping 1.1.1.1 error: ' .. tostring(str) .. ', ' .. tostring(errCode) )
			end
		end
		TASK_RETRY_TIMES = 0
		local step1 = OpenVPNSetting.new(endTaskCall)
		local step2 = DisConnectVPN.new(endTaskCall)
		local step3 = ConnectVPN.new(endTaskCall)

		step1.nextStep = step2
		step2.nextStep = step3
		step3.nextStep = nil

		step1:init()
		step1:execute()
		closeApp(g_config.applePreferences)
	end
end

function VPNManager.disConnectVPN( endTaskCall )
	writeASOLog('DisConnectVPN--start')
	local step1 = DisConnectVPN.new(endTaskCall)
	writeASOLog('DisConnectVPN--end')
	step1:init()
	return step1:execute()
end

function VPNManager.checkVPNStatus( endTaskCall )
	local step1 = OpenVPNSetting.new(endTaskCall)
	local step2 = ConnectVPN.new(endTaskCall)

	step1.nextStep = step2
	step2.nextStep = nil

	step2.firstStep = step1

	step1:init()
	step1:execute()
	closeApp(g_config.applePreferences)
end
-- return 0：维护， 1：正常，2：未获取
function VPNManager.getVPNStatus( quId, areaId)
	writeASOLog('getVPNStatus---')
	-- 返回正常
	do
		return 1 
	end
	do
		local vpnConfig = g_taskData.VPNConfig
		vpnConfig.passwordMd5 = vpnConfig.passwordMd5 or vpnConfig.password:md5()
		local reqURL = string.format('http://x.sryun.com/api/vip.php?arg=get_srv_status&username=%s&psw=%s', vpnConfig.account, vpnConfig.passwordMd5)
		local res = szocket_http.request(reqURL)
		writeASOLog('VPNManager.getVPNStatus res = ' .. tostring(res))
		local res = cjson.decode(res)
		if res and 'ok' == res.result then
			return res.responseBody.status
		end
	end
	
	if not areaId then
		return '2'
	end
	local reqURL = 'http://x.sryun.com/tools/jsonp.php?arg=area&groupid=5&qu=' .. quId
	local res = szocket_http.request(reqURL)
	local res = cjson.decode(res)
	local list = res and res.list
	if list then
		local srvid = tostring( tonumber(string.sub(areaId, 2)) )
		-- dialog('VPNManager.getVPNStatus srvid = ' .. srvid)
		for i,v in ipairs(list) do
			if v.srvid == srvid then
				return v.status
			end
		end
	end
	return '2'
end

function reconnectVPN()
	VPNManager.reconnectVPN()
end

return VPNManager