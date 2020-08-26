-------------------------------------------- search purchase download -----------------------------------------------
--[[
	SearchSteps: 打开AppStore, 搜索应用[输入关键词，切换到推荐排行榜和探索页面操作几下]， 进入app界面内， 购买应用，下载应用, 打开应用
--]]
--[[
	验证付款信息
--]]
local OpenAccountSetting = class(ASOSubTask)

function OpenAccountSetting:isTimeout()
	return g_timeoutDetector:isTimeout()
end
-- 等待账户设置页面
function OpenAccountSetting:execute()
	writeASOLog('OpenAccountSetting:execute')	
	while true do
		while g_pictureInterfase.hasPopWind() do
			if g_pictureInterfase.findLoginITunesWin() then				
				writeASOLog('登陆iTunes store')
				if g_pictureInterfase.clickPasswordInput() then
					delay(1)
				end
				writeASOLog('输入密码')
				input(g_taskData.password)
				g_pictureInterfase.clickLoginITunesWin()
			elseif g_pictureInterfase.clickRequestTimeout() then
				writeASOLog('请求超时')
			else
				g_pictureInterfase.otherPopWind(g_taskData.password)
			end
			if self:isTimeout() then
				self:triggerCallback(1028)
				return
			end
		end

		if g_pictureInterfase.findAccountSetting() then
			self:executeNextStep()
			return
		elseif g_pictureInterfase.findSearchResult() then
			delay(2)
			if g_pictureInterfase.findSearchResult() then
				writeASOLog('没有打开设置，回到搜索结果')
				return
			end
		else
			delay(0.5)
		end

		if self:isTimeout() then
			self:triggerCallback(1028)
			return
		end
	end
end

local ConfirmPayInfo = class(ASOSubTask)

function ConfirmPayInfo:isTimeout()
	return g_timeoutDetector:isTimeout()
end
-- 设置界面处理点无，点完成，如果出现信息不完整则报错
function ConfirmPayInfo:execute()
	writeASOLog('ConfirmPayInfo:execute')	
	local bProcessed = false
	local bClickDone = false
	while(true) do
		while g_pictureInterfase.hasPopWind() do
			if g_pictureInterfase.findTableNoFull() then
				self:triggerCallback(1028)
				if c_tu(m.haoBtn) then
					writeASOLog('点好')
				else
					writeASOLog('点击蓝色按钮')
					c_pic(m.蓝色提示,'蓝色提示')
				end
				delay(2)
				g_pictureInterfase.clickLeftUpCancel()
				return
			else
				g_pictureInterfase.otherPopWind(g_taskData.password)
			end
			
			if self:isTimeout() then
				self:triggerCallback(1028)
				return
			end
		end

		if not g_pictureInterfase.findAccountSetting() then
			return
		elseif bClickDone and g_pictureInterfase.findTableNoFullAlert() then
		   	self:triggerCallback(1028)
		   	return
		elseif not bProcessed and c_tu(m.whitout) then
			writeASOLog('点无')
			bProcessed = true
			delay(1)
			if c_tu(m.completeBtnRightUp) then
				writeASOLog('点完成按钮')
				bClickDone = true
				delay(1)
			end
		elseif bProcessed and c_tu(m.completeBtnRightUp) then
			writeASOLog('点完成按钮')
			bClickDone = true
		elseif f_tu(m.billAddress) then
			g_pictureInterfase.clickLeftUpCancel()
		end
		if self:isTimeout() then
			self:triggerCallback(1028)
			return
		end
	end
end

local function confirmPayInfoProcess( endTaskCall )
	if c_tu(m.continueBtn) then
		local step1 = OpenAccountSetting.new(endTaskCall)
		local step2 = ConfirmPayInfo.new(endTaskCall)

		step1.nextStep = step2
		step2.nextStep = nil

		step1:init()
		return step1:execute()
	else
		if endTaskCall then
			endTaskCall(1028)
		end
	end
	if c_tu(m.commonCancel) then
		writeASOLog('点取消')
	else
		writeASOLog('点击蓝色按钮')
		c_pic(m.蓝色提示,'蓝色提示')
	end
end

local AppStoreSubTask = class(ASOSubTask)

function AppStoreSubTask:popWindProcess()
	local errorCode = 0
	if g_pictureInterfase.findLoginITunesWin() then				
        writeASOLog('登陆iTunes store')
        if g_pictureInterfase.clickPasswordInput() then
        	delay(1)
		end
		writeASOLog('输入密码')
		input(g_taskData.password)
		g_pictureInterfase.clickLoginITunesWin(otherType)
	elseif g_pictureInterfase.clickCancelBtnBottom() then
		writeASOLog('点击底部取消按钮')
	else
		errorCode = self:otherPopWind()
	end
	return errorCode
end

function AppStoreSubTask:xieyiProcess()
	writeASOLog('AppStoreSubTask:xieyiProcess')
	if g_pictureInterfase.findAccountSetting() then
		local confirm_pay = ConfirmPayInfo.new(self.endTaskCall)
		confirm_pay:init()
		confirm_pay:execute()
	else
		local errorCode = g_pictureInterfase.xieyiProcess()
		if errorCode and errorCode > 0 then
			self:triggerCallback(errorCode)
		end
	end
end

local OpenAppStore = class(AppStoreSubTask)

function OpenAppStore:execute()
	writeASOLog('OpenAppStore: execute')
	toast('打开AppStore',1)
	closeApp(g_config.appStore)
	delay(0.5)
	while not TASK_END do
		while g_pictureInterfase.hasPopWind() do
			if self:popWindProcess() > 0 then
				return
			end
			
			if self:isTimeout(1005) then
				return
			end
			delay(1)
		end
		self: xieyiProcess()
		if active(g_config.appStore)then                     --判断STORE是否在前台 在前台为false
			writeASOLog('打开AppStore 等待1秒')
			delay(1)
			-- os.execute("notify_post ywmsg_get_appstore_account")
		elseif g_pictureInterfase.findSearchBtnBottomBlue() and g_pictureInterfase.findSearchTop() then	--找到顶部的搜索框
			writeASOLog('找到 顶部搜索框')
			toast('找到顶部搜索框')
			self:executeNextStep()
			return
		elseif self:isTimeout(1005) then
			return
		elseif g_pictureInterfase.clickSearchBtnBottomGrey() then   --找到 底部搜索 点击搜索
			writeASOLog('点击底部搜索_灰按钮')
			delay(1)
		else
			delay(1)
		end
	end
end
--[[
	搜索应用,该子任务又分为输入关键字点搜索按钮、切换到其他（排行榜，推荐，探索）页面滑动等随机操作两个子任务，反复执行几遍
--]]
local InputKeyword = class(AppStoreSubTask)

function InputKeyword:execute()
	writeASOLog('InputKeyword: execute')
	local timeoutError = 1018
	while not TASK_END do
		while g_pictureInterfase.hasPopWind() do
			if self:popWindProcess() > 0 then
				return
			end
			
			if self:isTimeout(1018) then
				return
			end
			delay(1)
		end
		self: xieyiProcess()

		if g_config.appStore ~= frontAppBid() then
			runApp(g_config.appStore)
			delay(1)
		elseif g_pictureInterfase.findHanwen() then
			self:triggerCallback(1032)
			closeApp(frontAppBid())                 	--关闭前台应用
			closeApp(g_config.appStore)                 --关闭appstore
			return
		elseif self:isTimeout(timeoutError) then
			return
		elseif g_pictureInterfase.clickSearchTop() then
			delay(1)
			input(g_taskData.keyword)
			delay(0.1)
			if not g_pictureInterfase.clickBlank() then          --找到并点击 键盘空格键
				keyDown("Spacebar")
				keyUp("Spacebar")
			end
			input('\b')                         --删除空格键
			if g_pictureInterfase.clickSearchBtn() then
				writeASOLog('点击搜索按钮')
				delay(2)
			else
				g_pictureInterfase.clickClearSearchBarBtn()
				delay(0.5)
				input(g_taskData.keyword)
				delay(0.1)
				if not g_pictureInterfase.clickBlank() then          --找到并点击 键盘空格键
					keyDown("Spacebar")
					keyUp("Spacebar")
				end
				input('\b')                         --删除空格键
				g_pictureInterfase.clickSearchBtn()
				delay(1)
			end
		elseif g_pictureInterfase.findSearchBtnBottomBlue() and g_pictureInterfase.findSearchResult() then
			local firstAppId = tonumber( readFileString("/var/mobile/Library/Preferences/.firstappid") ) or tonumber(readFileString( appDataPath(g_config.appStore) .. '/Documents/.firstappid'))
			if g_taskData.appId ~= firstAppId then
				writeASOLog('读取到的appid: ' .. (firstAppId or 'nil') .. ', 后台获取的appid: ' .. g_taskData.appId)
				self:triggerCallback(1004)
				closeApp(frontAppBid())                 	--关闭前台应用
				closeApp(g_config.appStore)                 --关闭appstore
				return
	        end
	        
			if not self.appUninstalled and g_pictureInterfase.findOpenOrUpdate() and self.firstStep then
				ipaUninstall(g_taskData.appBundleId) --卸载应用
				self.appUninstalled = true
				delay(0.2)
				self.firstStep:init()
				self.firstStep:execute()
			else
				self.appUninstalled = true
				self: executeNextStep()
			end
			return
        elseif g_pictureInterfase.findQude() then
            self:triggerCallback(1032)
            return
		elseif g_pictureInterfase.findCantAppStore() then
			self: reTryTask(1006)
			return
		elseif g_pictureInterfase.clickSearchBtn() then
			writeASOLog('点击搜索按钮')
			delay(1)
		elseif g_pictureInterfase.hasSearchBlueRect() then
			timeoutError = 1032
		else
			delay(0.5)
		end
			
	end
end

OpenAppURL = class(AppStoreSubTask)

function OpenAppURL:execute( )
	writeASOLog('OpenAppURL:execute')
	if not self.nextStep and (1473821983 == g_taskData.appId or 1475056193 == g_taskData.appId) and g_taskData.appLink then
		kanqiuH5Process(g_taskData.fakeInfo.ProductType, g_taskData.fakeInfo.deviceVersion, g_taskData.bigScreen)
	end
	local safariBid = 'com.apple.mobilesafari'
	local function doOpenAppURL( )
		writeASOLog('doOpenAppURL')
		closeApp(g_config.appStore)
		closeApp(safariBid)
		os.execute('rm -rf '..appDataPath(safariBid)..'/Library/WebKit/WebsiteData/LocalStorage')
		clearCookies()
		delay(0.5)
		if self.nextStep then
			openURL('https://itunes.apple.com/cn/app/id' ..g_taskData.appId .. '?mt=8')
		else
			openURL(g_taskData.keyword)
		end
	end

	local startTime = 0
	local timeoutError = 1018
	if 1 == g_taskData.integralWallInfo.clickType then
		timeoutError = 1043
	elseif 2 == g_taskData.integralWallInfo.clickType then
		timeoutError =  1044
	end
	closeApp(g_config.appStore)
	closeApp(safariBid)
	if 5 == g_taskData.taskType then
		doOpenAppURL()
		startTime = os.time()
		while true do
			if safariBid == frontAppBid() and g_pictureInterfase.clickOpenInAppStore() then
				delay(0.2)
			elseif g_config.appStore == frontAppBid() then
				return 0
			elseif f_pic(g_config.openURLSuccess[g_taskData.appId]) then
				if 561859697 == g_taskData.appId then 
					delay(math.random(10, 20))
					c_pic(g_config.openURLSuccess[g_taskData.appId])
				elseif 1473821983 == g_taskData.appId then
					click(376, 1228)
					delay(1)
					return 0
				else
					return 0
				end
			elseif os.time() - startTime > 60 then
				snapshotAndUpload(getSnapshotFileName(1043))
				return timeoutError
			else
				delay(0.5)
			end
		end
	end

	while not TASK_END do
		while g_pictureInterfase.hasPopWind() do
			if safariBid == frontAppBid() and g_pictureInterfase.clickOpenInAppStore() then
			elseif self:popWindProcess() > 0 then
				return
			end
			if self:isTimeout(timeoutError) then
				return
			end
			delay(0.5)
		end
		if safariBid ~= frontAppBid() or not g_pictureInterfase.clickOpenInAppStore() then
			self: xieyiProcess()
		end
		if g_config.appStore == frontAppBid() then
			if not self.nextStep then
				return 0
			end
			if g_pictureInterfase.findSearchResult() then
				self:executeNextStep()
				return
            elseif g_pictureInterfase.findQude() then
                self:triggerCallback(1032)
                return
			elseif g_pictureInterfase.hasSearchBlueRect() then
				if not g_taskData.bLogin then
					self:executeNextStep()
					return
				else
					timeoutError = 1032
				end
			end
		elseif os.time() - startTime > 60 then
			doOpenAppURL()
			startTime = os.time()
		elseif safariBid == frontAppBid() then
			if f_pic(g_config.openURLSuccess[g_taskData.appId]) then
				dialog('找到了')
				if 561859697 == g_taskData.appId then
					delay(math.random(10, 20))
					c_pic(g_config.openURLSuccess[g_taskData.appId])
				elseif 1275442509 == g_taskData.appId then
					
				else
					self:executeNextStep()
					return
				end
			elseif 1473821983 == g_taskData.appId and f_pic(g_config.openURLSuccess[g_taskData.appId]) then
				click(376, 1228)
			elseif not g_pictureInterfase.hasPopWind() then
				writeASOLog('找不到趣头条点击图111111')
				click(500, 445)
			else
				writeASOLog('找不到趣头条点击图')
			end
		else
			writeASOLog('神奇！！！')
		end
		
		if self:isTimeout(timeoutError) then
			return
		end
		delay(0.5)
	end
end
--[[
	随机决定是否进入应用程序界面
--]]
local OpenPurchaseUI = class(AppStoreSubTask)

function OpenPurchaseUI:execute()
	writeASOLog('OpenPurchaseUI: execute')
	local bClicked = false
	while not TASK_END do
		while g_pictureInterfase.hasPopWind() do
			if self:popWindProcess() > 0 then
				return
			end
			
			if self:isTimeout(1016) then
				return
			end
			delay(1)
		end
		self: xieyiProcess()
		if g_config.appStore ~= frontAppBid() then
			runApp(g_config.appStore)
			delay(1)
		elseif self:isTimeout(1016) then
			return
		elseif g_pictureInterfase.clickSearchBtnBottomGrey() then
			writeASOLog('点击底部搜索_灰按钮')
		elseif not bClicked then
			bClicked = true
			--	active(AppStore)
			local typeNum = math.random(1,100)
			writeASOLog('是否进入购买页面的随机数: '..typeNum)
			if typeNum%5 ~= 0 then
				writeASOLog('进入购买页面')
				g_pictureInterfase.clickSearchedApp()
				delay(2)
			else
				self:executeNextStep()
				return
			end
		elseif g_pictureInterfase.findSearchResult() then
			self:executeNextStep()
			return
		elseif g_pictureInterfase.findDownNull() then
			self:reTryTask(1016)
			return
		else
			delay(0.5)
		end
	end
end

--[[
	简短验证分支
--]]
local BriefValidateSubTask = class(AppStoreSubTask)

function BriefValidateSubTask:init()
	g_timeoutDetector:init(300, g_taskData.startTime)
end

function BriefValidateSubTask:isTimeout()
	return g_timeoutDetector:isTimeout()
end

function BriefValidateSubTask:executeNextStep()
	if self.nextStep then
		self.nextStep:init()
		return self.nextStep:execute()
	else
		return
	end
end

local ClickContinueBtn = class(BriefValidateSubTask)

function ClickContinueBtn:execute()
	writeASOLog('ClickContinueBtn:execute')
	rmBriefGIFs()
	if c_tu(m.continueBtn) then
		local startTime = os.time()
		while(true) do
			if g_pictureInterfase.findNeedValidation() then
				return self:executeNextStep()
			elseif g_pictureInterfase.findCantAppStore() then
				return
			end
			if self:isTimeout() then
				return
			end
		end
	else
		if c_tu(m.commonCancel) then
			writeASOLog('点取消')
		else
			writeASOLog('点击蓝色按钮')
			c_pic(m.蓝色提示,'蓝色提示')
		end
		return
	end
end

local ASOOcrCheckCode = class(BriefValidateSubTask)

function ASOOcrCheckCode:ctor()
	self.inputErrorTimes = 0
end

function ASOOcrCheckCode:doOcrCheckCode()
	writeASOLog('ASOOcrCheckCode')
	-- local snapPath = g_config.log_path .. DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_identifyCode.png'
	-- writeASOLog('截图验证码')
	-- local t = g_pictureInterfase.getIdentifyingCodeScope()
	-- snapshot(snapPath, t[4], t[5], t[6], t[7])
	-- delay(1)
	-- writeASOLog('upload snapshot')
	-- uploadError(snapPath)

	local errorCode, bal, text, bid = ocrSupCheckCode()
	writeASOLog('打码函数返回')
	if bal and bal>0 and text and bid then
		local checkCodeInfo = {
			platform = getCheckCodePlatform(),
			commitTime = os.time(),
			returnCode = text,
			result = 1,
		}
		writeASOLog('return check code' .. text)
		if not tonumber(text) then
			g_pictureInterfase.clickNewCheckcode()
			checkCodeInfo.result = 0
			return errorCode, bid, checkCodeInfo
		elseif string.len(text) < 3 then
			g_pictureInterfase.clickNewCheckcode()
			checkCodeInfo.result = 0
			return errorCode, bid, checkCodeInfo
		end

		if g_pictureInterfase.clickIdentifyingCodeIput() then
			input(text)
			self.inputErrorTimes = self.inputErrorTimes + 1
			delay(1)
			if not c_tu(m.nextPage) then
				delay(5)
				c_tu(m.nextPage)
			end
		end
		return errorCode, bid, checkCodeInfo
	elseif bal and bal <= 0 then
		writeASOLog('打码平台余额不足 bal = ' .. bal)
		errorCode = 1027
	else
		g_pictureInterfase.clickNewCheckcode()
	end
	return errorCode, bid
end

function ASOOcrCheckCode:doOcrSupErrorCall( bid, checkCodeInfo )
	if bid then
		ocrSupErrorCall(bid)
	end
	if checkCodeInfo then
		checkCodeInfo.result = 0
	end
end

function ASOOcrCheckCode:execute()
	writeASOLog('ASOOcrCheckCode:execute')
	local tryTimes = 0
	local checkTimes = 0
	local tryInterval = 1
	local errorCode = 0
	local bid = nil
	local verifyCodeStats = {}
	local checkCodeInfo = nil
	while (true) do
		while g_pictureInterfase.hasPopWind() do
			if g_pictureInterfase.findLoginITunesWin() then				
				writeASOLog('登陆iTunes store')
				if g_pictureInterfase.clickPasswordInput() then
					delay(1)
				end
				writeASOLog('输入密码')
				input(g_taskData.password)
				g_pictureInterfase.clickLoginITunesWin(otherType)
			elseif g_pictureInterfase.clickCancelBtnBottom() then
				writeASOLog('点击底部取消按钮')
			else
				if self:otherPopWind() > 0 then
					self:doOcrSupErrorCall(bid, checkCodeInfo)
					return verifyCodeStats
				end
			end
		end
		if checkTimes > 0 and not  g_pictureInterfase.findNeedValidation() then
			delay(2)
			if not g_pictureInterfase.findNeedValidation() then
				break
			end
		elseif g_pictureInterfase.findNeedValidation() and g_pictureInterfase.findIdentifyingCode() and g_pictureInterfase.findIdentifyingCodeIput() then
			self:doOcrSupErrorCall(bid, checkCodeInfo)
			if self.inputErrorTimes >=4 then
				errorCode = 1034
				break
			end

			if tryTimes >= 10 or checkTimes >=5 then
				break
			elseif tryTimes > 0 then
				delay(math.max(tryInterval, 2) )
			end

			tryTimes = tryTimes + 1
			errorCode, bid, checkCodeInfo = self: doOcrCheckCode()
			if checkCodeInfo then
				table.insert(verifyCodeStats, checkCodeInfo)
			end
			if bid then
				self:init() --重新设置超时计时器
				checkTimes = checkTimes + 1
				tryInterval = tryInterval + 5
			end
			
			if errorCode > 0 then
				break
			end
		end
		
		if self:isTimeout() then
			self:doOcrSupErrorCall(bid, checkCodeInfo)
			break
		end
		delay(0.5)
	end
	return verifyCodeStats, errorCode
end

local function briefValidationProcess(endTaskCall)
	local step1 = ClickContinueBtn.new()
	local step2 = ASOOcrCheckCode.new(endTaskCall)
	
	step1.nextStep = step2
	step2.nextStep = nil
	
	step1:init()
	return step1:execute()
end
--[[
	购买应用，点获取，安装按钮，知道出现开始下载
--]]
local PurchaseApp = class(AppStoreSubTask)

function PurchaseApp:ctor(...)
	self.stepName = 'PurchaseApp'
end

function PurchaseApp:init()
	g_timeoutDetector:init(300, g_taskData.startTime)
end

-- function PurchaseApp:uploadValidationInfo(verifyCodeStats, yzmError)
-- 	if not verifyCodeStats or #verifyCodeStats <= 0 then
-- 		return false
-- 	end
-- 	writeASOLog('PurchaseApp:uploadValidationInfo')
-- 	return uploadVerifyCodeStats(verifyCodeStats, yzmError)
-- end

function PurchaseApp:execute()
	writeASOLog('PurchaseApp: execute')
	delay(1)
	local findCloudTimes = 0
	while not TASK_END do
		while g_pictureInterfase.hasPopWind() do
			if g_pictureInterfase.findBriefValidation() then
				writeASOLog('需要一个简短验证')
				-- self:triggerCallback(1027)
				-- return
				local verifyCodeStats, errorCode = briefValidationProcess(self.endTaskCall)
				-- self:uploadValidationInfo(verifyCodeStats)
				if errorCode and errorCode > 0 then
					if 1035 == errorCode then
						self:reTryTask(1035)
					else
						self:triggerCallback(errorCode)
					end
					return
				end
				if verifyCodeStats then
					for i, v in ipairs(verifyCodeStats) do
						if v.result > 0 then
							YU_DA_MA = true
							break
						end
					end
				end
				if self.firstStep then
					self.firstStep:init()
					self.firstStep:execute()
				end
				return
			elseif g_pictureInterfase.findConfirmPayInfo() then
				writeASOLog('需要验证付款信息')
				confirmPayInfoProcess(self.endTaskCall)
				if TASK_END then
					return
				else
					if f_tu(m.billAddress) then
						g_pictureInterfase.clickLeftUpCancel()
					end
					self:init()
				end
			elseif g_pictureInterfase.findLoginInAppStore() and isDeviceForPayTask(g_taskData.studioId ) then
				if waitForLoginAppleId() > 0 then
					self:triggerCallback(1017)
				end
			elseif self: popWindProcess() > 0 then
				return
			end
			
			if self:isTimeout(1019) then
				return
			end
			delay(1)
		end
		self: xieyiProcess()

		if not g_taskData.appLink and g_pictureInterfase.clickSearchBtnBottomGrey() then
			writeASOLog('click the grey search btn')
			delay(1)
		end

		if g_config.appStore ~= frontAppBid() then
			writeASOLog('frontAppBid is not  ' .. g_config.appStore )
			runApp(g_config.appStore)
			delay(1)
		elseif g_pictureInterfase.findDownLoadingApp() then
			if not self.downLoadBegan then
				if clearAppstoreCache() then
					self:reTryTask(1009)
				else
					self:triggerCallback(1033)
				end
				return
			end
			self: executeNextStep()
			return
		elseif self:isTimeout(1019) then
			return
		elseif g_pictureInterfase.findOpenOrUpdate() then
			if not self.downLoadBegan then
				ipaUninstall(g_taskData.appBundleId) --卸载应用
				delay(5) 
			else
				self: executeNextStep()
				return
			end
		elseif g_pictureInterfase.findCloud() then
			findCloudTimes = findCloudTimes + 1
			if findCloudTimes >= 3 then
				if not self.downLoadBegan and g_taskData.mustPurchase and 3 == g_taskData.taskType then
					self:triggerCallback(1020)
					return
				end
				g_pictureInterfase.clickCloud()
				self.downLoadBegan = true
			else
				delay(0.5)
			end
		elseif g_pictureInterfase.clickGetBtn() then
			writeASOLog('点击获取按钮')
			delay(1)
		elseif g_pictureInterfase.clickInstallBtn() then
			self.downLoadBegan = true
			writeASOLog('点击安装按钮')
			delay(2)
		elseif g_pictureInterfase.findDownNull() then
			self:reTryTask(1019)
			return
		else
			delay(0.5)
		end
	end
end

--[[
	下载应用程序，等待下载安装完成，直至出现打开按钮
--]]
local DownloadApp = class(AppStoreSubTask)

function DownloadApp:init()
	if g_taskData.downloadTime then
		g_timeoutDetector:init(g_taskData.downloadTime, g_taskData.startTime - 120)
	else
		g_timeoutDetector:init(1800, g_taskData.startTime - 120) -- 设置为所剩时间
	end
end

function DownloadApp:execute()
	writeASOLog('DownloadApp: execute')
	toast('下载应用',1)
	delay(2)
	local findCloudTimes = 0
	local retryDownload = 0
	while not TASK_END do
		while g_pictureInterfase.hasPopWind() do
			if g_pictureInterfase.findCantDownload() then
				retryDownload = retryDownload + 1
				if retryDownload > 5 then
					snapshotScreen(1036)
					g_pictureInterfase.clickBlueTipsBtn()
					self:triggerCallback(1036, getSnapshotFileName(1036))
					return
				else
					click(485, 777)
				end
				-- g_pictureInterfase.clickBlueTipsBtn()
				-- ipaUninstall(g_taskData.appBundleId)
				-- if removeAppByHands(g_taskData.appId) then
				-- 	self:reTryTask(1036, getSnapshotFileName(1036))
				-- else
				-- 	self:reTryTask(1036, getSnapshotFileName(1036))
				-- end
				-- return
			end

			if self:popWindProcess() > 0 then
				return
			end
			
			if self:isTimeout(1016) then
				return
			end
			delay(0.5)
		end
		self: xieyiProcess()

		if not g_taskData.appLink and g_pictureInterfase.clickSearchBtnBottomGrey() then
			writeASOLog('click the grey search btn')
		end

		if g_config.appStore ~= frontAppBid() then
			runApp(g_config.appStore)
			delay(1)
		elseif g_pictureInterfase.findCloud() then
			findCloudTimes = findCloudTimes + 1
			if (findCloudTimes >= 3) then
				if g_taskData.mustPurchase and AppBaker:isAppIpaBaked(g_taskData.appBundleId, g_taskData.appVersion) then
					-- local delayTime = math.random(30, 60)
					-- delay(delayTime)
					AppBaker:installBakedIpa(g_taskData.appBundleId, g_taskData.appVersion)
					self:executeNextStep()
					return
				else
					g_pictureInterfase.clickCloud()
				end
			else
				delay(0.5)
			end
		elseif g_pictureInterfase.findDownNull() then
			self:reTryTask(1016)
			return
		elseif g_pictureInterfase.findOpenOrUpdate() then
			self: executeNextStep()
			return
		elseif g_pictureInterfase.findGetBtn() or g_pictureInterfase.findInstallBtn() then
			self: reTryTask(1009)
			return
		elseif self:isTimeout(1016) then
			return
		else 
			if g_taskData.mustPurchase and AppBaker:isAppIpaBaked(g_taskData.appBundleId, g_taskData.appVersion) and g_pictureInterfase.cancelDownloading() then
				writeASOLog('取消下载')
				delay(5)
				if not g_pictureInterfase.findCloud() and not g_pictureInterfase.findOpenOrUpdate() then
					clearAppstoreCache()
					self:reTryTask(1016)
					-- self:executeNextStep()
					return
				end
			-- elseif not g_pictureInterfase.findSearchResult() then
			-- 	clearAppstoreCache()
			-- 	self:reTryTask(1016)
			-- 	return
			end
			writeASOLog('正在下载')
			delay(1)
		end
	end
end

function DownloadApp:isTimeout()
	if g_timeoutDetector:isTimeout() then
		writeASOLog('DownloadApp: isTimeOut')
		clearAppstoreCache()
		if g_pictureInterfase.cancelDownloading() then
			writeASOLog('超时取消下载')
			delay(2)
		end
		self:triggerCallback(1016)
		return true
	else
		return false
	end
end

--[[
	执行任务:串联执行上述子任务
--]]
function downloadFromAppStore(endTaskCall)
	writeASOLog('doAsoTask')
	local step1 = nil
	local step2 = nil
	local step3 = nil
	
	local step4 = PurchaseApp.new(endTaskCall)
	local step5 = DownloadApp.new(endTaskCall)
	-- local step6 = OpenApp.new(endTaskCall)

	if g_taskData.appLink then
		step1 = OpenAppURL.new(endTaskCall)
		step1.nextStep = step4
		step1.firstStep = step1
	else
		step1 = OpenAppStore.new(endTaskCall)
		step2 = InputKeyword.new(endTaskCall)
		step1.nextStep = step2
		step2.nextStep = step4

		step1.firstStep = step1
		step2.firstStep = step1
	end

	step4.nextStep = step5
	step5.nextStep = nil
	
	step4.firstStep = step1
	step5.firstStep = step1
	
	step5.preStep = step4
	
	step1:init()
	step1:execute()
	return not TASK_END
end
