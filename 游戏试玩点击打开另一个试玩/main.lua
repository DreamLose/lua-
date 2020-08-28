--[[
	激活留存脚本，执行点击，激活，留存任务
--]]
require('TSLib')
require 'config'
require 'tsp'
require 'AppBaker'
require 'yzm'
require 'SubTaskClass'
local VPNManager = require 'VPNManager'
TASK_END = false 			--标记任务是否结束
TASK_RETRY_TIMES = 0 		--已经重试了几次
g_timeoutDetector = nil 	-- 超时检测
g_pictureInterfase = nil 	-- 找图找色接口
registerResult = nil        --app注册结果
registerErrorcode = 0 			-- 注册app错误码
g_taskData = nil  			--任务数据
g_appAccountInfo = nil 			-- 注册app账户信息
TASK_RESULT = false         --任务执行结果
local runScriptInTsp = false 		--在触动精灵跑时设置为true
local MAIN_LOOP_END = false 	--主循环是否结束
local currentAPPBidTab = nil
local newBid = nil
local endTaskCode = nil
local isToDownLoad = false  --是否去下载
local isClickKaiping = false  --是否点击的开屏广告
local isClickAppAdToStore = false   --是否点击app内的广告跳转
local clickKPRatio = 50    --点击开屏的比例
local isToAppstoreRatio = 50    --观看app内广告比例
local downLoadRatio = 80    --下载app比例

-- -- local needAppleIdAppMap = false -- 是否进行app和appleId的绑定
-- startBtn = {0x0350ff, "4|-1|0xffffff,20|6|0x004eff,24|13|0xffffff,29|17|0x004eff,86|1|0xffffff,86|6|0x004eff,153|2|0xffffff,155|4|0x004eff,154|14|0xffffff", 90, 172, 844, 643, 1142,'开始游戏'}
-- startBtnNew = {0x0350ff, "4|0|0xffffff,29|0|0xffffff,31|5|0x004eff,62|1|0xfcfdff,66|1|0x024fff,155|2|0xfefeff,155|5|0x0350ff,156|14|0xfeffff,160|14|0x004eff", 90, 175, 890, 646, 1113,'开始新'}
-- backBtn = {0x0350ff, "4|-1|0xffffff,20|6|0x004eff,24|13|0xffffff,29|17|0x004eff,86|1|0xffffff,86|6|0x004eff,153|2|0xffffff,155|4|0x004eff,154|14|0xffffff", 90, 172, 844, 643, 1142,'返回'}
-- backBtnNew = {0x16b821, "1|49|0x16b821,29|21|0x16b821,-28|28|0x16b821,-6|26|0xffffff,26|43|0xfcfefc,22|52|0x16b821,41|43|0xfdfefd,44|44|0x16b821", 90, 16, 0, 154, 144,'新'}
-- jinbi = {0xffc53c, "0|3|0xffa402,0|9|0xffee3c,2|15|0xffd700,2|19|0xfff883,0|24|0xfed100,1|29|0xffea28,9|29|0xffad00,16|29|0xffeb73,20|27|0xc56506", 90, 630, 22, 739, 110,'金币'}
-- fuhuonew ={ 0xf4bf5f, "143|18|0xf4a924,84|43|0xf7c264,-7|56|0xf4a924,-88|48|0xf4aa27,-84|47|0xffffff,-76|47|0xf4a924", 90, 184, 910, 635, 1087,'复活新'}
-- fuhuo = {0xfeb635, "0|5|0xfffefd,16|22|0xffffff,23|22|0xfeb025,99|25|0xfffefb,102|25|0xfeb533,104|25|0xffffff,242|34|0xffffff,247|34|0xfeb025,274|4|0xfeb025", 90, 160, 885, 638, 1086,'复活'}
-- wujiaox = {0xff6600, "0|-2|0xffffff,-8|7|0xff6600,-11|7|0xffffff,8|7|0xff6600,11|7|0xffffff,-5|17|0xff6600,0|17|0xffffff,0|14|0xff6600,5|17|0xff6600", 90, 319, 700, 512, 968,'五角星'}
-- cancle = {0x007aff, "-4|0|0xf9f9f9,6|7|0x208afe,6|13|0xf9f9f9,6|15|0x007aff,37|2|0x027bff,37|6|0xf9f9f9,37|11|0x007aff,55|27|0x007aff,52|28|0xf9f9f9", 90, 12, 16, 148, 123,'取消'}
-- neeoLog = {0x000000, "0|2|0xc6c6c6,17|0|0x000000,17|2|0xc6c6c6,17|4|0x000000,103|17|0x000000,102|20|0xc6c6c6,102|24|0x000000,121|16|0x000000,124|25|0x000000", 90, 258, 278, 506, 419,'重新登陆'}
-- downDone = {0x0080fc, "-1|0|0x0080fc,-2|0|0x0080fc,-3|0|0x0080fc,-4|0|0x0080fc,-4|5|0xffffff,-2|-1|0x0080fc,-3|2|0x0080fc,-3|4|0xffffff,-4|0|0x0080fc", 90, 654, 284, 733, 383,'下载完成,未安装'}
-- -- downDonePic={'downDone_6.png',547, 108, 739, 517,30000000}
-- xiaoxiao = {'xiaoxiaole.png',547, 108, 739, 517,30000000}
-- xiaoxiaoleGet = {0xf3fdfe, "0|-2|0x0050c3,0|5|0xf3fdfe,6|5|0x0050c3,-5|4|0xf3fdfe,-7|4|0x0050c3,0|9|0xf3fdfe,0|12|0x0050c3,7|9|0x0050c3,69|24|0x0050c3", 90, 591, 546, 747, 683,'消消乐获取'}
-- doneBtn = {0x007aff, "0|-3|0xfafafa,2|4|0x007aff,2|9|0xfafafa,2|11|0x007aff,16|18|0x007aff,16|26|0x007aff,48|2|0x007aff,46|4|0xfafafa,46|6|0x007aff", 90, 7, 12, 123, 140,'完成'}
-- comment = { 0x666666, "7|4|0xffffff,7|6|0x666666,6|14|0xffffff,14|14|0x666666,17|20|0xffffff,17|22|0x666666,11|31|0x696969,16|34|0x666666,21|30|0x666666", 90, 248, 890, 459, 1033,'评论'}
-- notDownDone = {0x0080fc, "-1|0|0xffffff,-1|-1|0x0381fc,-1|2|0xffffff,0|2|0x0080fc,-9|0|0x0080fc,-15|3|0x0080fc,0|5|0xffffff,0|27|0x0080fc,0|36|0xffffff", 90, 645, 239, 745, 402,'未下载完成'}
-- downLoading = {0x0281fc, "15|4|0x0080fc,15|7|0xffffff,15|45|0x0080fc,0|47|0xffffff,0|49|0x0381fc,-21|37|0x0080fc,-24|25|0x0281fc,-8|25|0xffffff,1|25|0x0080fc", 90, 635, 270, 749, 410,'正在下载'}
-- gengxinNull = {0x99ccfe, "0|4|0xffffff,0|7|0x99ccfe,5|9|0x99ccfe,10|15|0xffffff,14|15|0x99ccfe,53|33|0x99ccfe,56|33|0xffffff,56|29|0x99ccfe,60|34|0x99ccfe", 90, 611, 225, 744, 460,'更新不可点击'}
-- shuaishi = {'shuaishi_6.png',11, 118, 484, 563,30000000}
-- mosheng = {'mosheng_6.png',11, 118, 484, 563,30000000}
-- buyu = {'buyu_6.png',11, 118, 484, 563,30000000}
-- shediao = {'shediao_6.png',28,415,741,942,30000000}

-- douyin = {'douyin_6.png',11, 118, 484, 563,30000000}
-- pinduoduo = {'pinduoduo.png',11, 118, 484, 563,30000000}
-- daju = {'daju_6.png',11, 118, 484, 563,30000000}
-- suning = {'suning_6.png',11, 118, 484, 563,30000000}
-- jinbitu = {'jinbi_6.png',627,14,740,180,30000000}
-- shediaoTitle = {0x000000, "0|-2|0xf7f7f7,8|3|0x000000,8|11|0x000000,10|11|0xffffff,15|11|0x000000,193|4|0x000000,193|8|0xffffff,193|11|0x000000,191|28|0x000000", 90, 239, 42, 520, 118,'射雕title'}
-- fankui = {0x50525a, "0|5|0xffffff,0|7|0x50525a,2|13|0xffffff,2|18|0x52545c,22|7|0x56575f,20|10|0x5a5c64,32|16|0x53555d,35|16|0xffffff,35|20|0x55565e", 90, 649, 48, 746, 111,'反馈'}
-- guanbi = {0x222222, "0|-7|0xffffff,-7|-7|0x222222,-7|0|0xffffff,-7|6|0x222222,2|6|0xffffff,6|6|0x222222,6|0|0xffffff,11|-12|0x222222,12|12|0x222222", 90, 5, 33, 737, 118,'关闭'}
-- fankuiNew = {0x50525a, "-7|4|0xffffff,-10|4|0x52545c,1|14|0xfefefe,1|17|0x50525a,31|14|0x51535b,34|16|0xffffff,37|17|0x63646b,37|19|0xfefefe,37|21|0x56575f", 90, 638, 44, 747, 124,'反馈新'}

-- --  消消乐找图
-- guodong = {0xde4c1c, "0|8|0xffffff,0|15|0xde4c1c,65|50|0xde4c1c,69|69|0xde4d1c,101|13|0xde4c1c,101|21|0xededed,101|36|0xfca613,533|-29|0xdf511e,539|17|0xde4c1c", 90, 69, 157, 668, 478,'果冻消消乐'}
-- fristGuan = {0x27e013, "17|2|0x0bc910,17|10|0x101010,14|27|0x111111,8|27|0x0ac215,21|27|0x1c1c1c,25|27|0x04b022,25|38|0x02a829,45|26|0x00a42e,51|26|0xffffff", 90, 113, 844, 550, 1294,'第一关'}
-- playBtn = {0x5ce432, "23|-19|0xffffff,29|-13|0x7ef040,38|-13|0xffffff,52|-8|0xffffff,60|-8|0x78ef3e,76|-8|0xffffff,96|4|0x59e030,109|4|0xffffff,109|-4|0x6cea35", 90, 206, 706, 554, 1011,'play'}
-- nextBtn = {0x72ed3b, "11|1|0xffffff,37|2|0x77ee3d,49|2|0xffffff,70|3|0xffffff,79|3|0x7cf03f,126|2|0xffffff,131|-2|0x85f142,201|-5|0xffffff,208|-5|0x81f041", 90, 145, 801, 619, 1057,'next'}
-- setting = {0xffc243, "9|0|0xffffff,18|2|0xffc449,23|9|0xffffff,30|14|0xffc448,30|25|0xffffff,30|33|0xffc449,-17|34|0xffc448,-7|39|0xffffff,11|27|0xffc448", 90, 566, 5, 749, 185,'设置'}
-- downBtn = {0x00becc, "96|-14|0xffffff,96|-10|0x00becc,96|-5|0xffffff,144|-14|0xffffff,144|-9|0x00becc,162|-1|0xffffff,163|3|0x00becc,164|6|0xffffff,282|-8|0x00becc", 90, 28, 1141, 730, 1320,'下载观看'}
-- downBtnNew = {0xf23f3f, "0|5|0xffffff,-10|15|0xf23e3e,-10|18|0xffffff,-10|23|0xf13c3c,9|15|0xf03a3a,9|18|0xffffff,9|23|0xf03838,0|28|0xffffff,0|32|0xf03838", 90, 642, 984, 742, 1270,'下载'}
-- downBtn1 = {0x007aff, "0|3|0xffffff,0|7|0x007aff,35|8|0xffffff,38|8|0x007aff,42|10|0xfcfdff,84|12|0x007aff,84|14|0xffffff,88|26|0xd3e8ff,88|29|0x007aff", 90, 548, 1122, 728, 1302,'下载观看'}
-- downBtn2 = {0x007aff, "3|2|0xffffff,6|7|0x007aff,6|10|0xffffff,55|2|0xffffff,55|7|0x007aff,74|14|0xffffff,74|19|0x007aff,76|21|0xffffff,124|9|0x007aff", 90, 486, 1106, 732, 1317,'下载观看'}
-- daoju = {0xeb3f31, "7|0|0xffe2c9,12|1|0xf73021,23|2|0xfffded,26|2|0xf83a2b,35|11|0xfdefce,35|21|0xef3023,34|25|0xac0706,23|27|0xa90302,23|34|0x39bca7", 90, 92, 1045, 682, 1276,'道具'}
-- fristGuan1 = {0x11cf0e, "4|-3|0x121212,9|-5|0x101010,9|-9|0x0bc711,9|7|0x101010,13|10|0x06b81e,12|14|0x111111,12|20|0x04af24,3|15|0x121212,0|15|0x09c017", 90, 97, 885, 452, 1304,'第一关new'}
-- downNewBtn = { 0xf2c32c, "5|0|0x000000,14|5|0xffcd2f,13|8|0x000000,47|6|0x050401,52|6|0xffcd2f,56|6|0x040301,144|3|0x171304,144|5|0xf4c42c,144|9|0x080601", 90, 130, 730, 729, 1112,'残忍放弃'}
-- hongbao = { 0xebcd9a, "0|4|0x3a3b3b,0|9|0xebcd9a,0|14|0x3a3b3b,34|4|0x3a3b3b,34|10|0xebcd9a,34|14|0x3a3b3b,15|37|0x3a3b3b,15|45|0xe4c896,15|48|0x3a3b3b", 90, 203, 595, 530, 875,'红包'}
-- tixian = { 0xd85a41, "0|3|0xf9d8a2,7|3|0xd85940,12|3|0xfadda6,42|4|0xfadea6,65|7|0xfadda5,65|14|0xd85940,65|20|0xfadea6,178|19|0xfbe0a8,178|23|0xd85940", 90, 133, 577, 677, 872,'提现'}
-- guanka = {0x13d10e, "-5|0|0xffffff,24|-23|0x17d50e,24|-27|0xf5f6f0,55|-12|0x02aa27,62|-12|0xffffff,45|19|0x01a52b,45|25|0x1bca47,45|28|0x057f16,45|35|0xffffff", 90, 32, 258, 748, 1258,'关口'}
-- bluebtn = {0x4a90e2, "5|11|0x4a90e2,61|-4|0x4a90e2,110|-7|0x4a90e2,153|24|0x4a90e2,189|56|0x4a90e2,214|67|0x4a90e2", 90, 48, 388, 728, 1148,'蓝色提示'}
-- bluebtnNew = {0x118bff, "45|-12|0x118bff,243|-3|0x118bff,412|-9|0x118bff,445|-18|0x118bff,443|15|0x118bff", 90, 47, 1122, 714, 1298,'蓝色按钮'}
-- connectStoreFail = {0x999999, "-3|0|0xffffff,32|0|0x999999,32|13|0xffffff,32|17|0x999999,284|4|0x999999,284|9|0xffffff,284|14|0x999999,474|10|0x999999,479|13|0xffffff", 90, 57, 437, 695, 801,'无法连接到appstore'}
-- meunBtn = {0x007aff, "4|0|0xf9f9f9,7|0|0x007aff,1|11|0x007aff,5|11|0xf9f9f9,7|11|0x007aff,1|21|0x007aff,5|22|0xf9f9f9,7|22|0x007aff,39|22|0x007aff", 90, 534, 20, 747, 136,'商店菜单'}
-- guankaikuan = {0xf79608, "-62|124|0x93c643,-46|124|0xfff0a2,574|179|0xfff0a2,581|179|0x588b1d,314|713|0xffeea9,306|727|0x569115,508|612|0xffeea8,539|611|0x6fa424,482|655|0xffeea8", 90, 68, 280, 688, 1210,'关卡框'}

-- needLoginOld = { 0x000000, "0|2|0xf8f7f6,9|2|0x000000,16|4|0x000000,16|8|0x000000,73|24|0x000000,78|24|0xf8f8f7,78|27|0x000000,122|16|0x000000,125|26|0x000000", 90, 95, 234, 659, 679,'需要登录'}
-- needLogNew = {0x000000, "0|3|0xedeaeb,3|3|0x000000,14|1|0x000000,17|3|0xf2f0f0,18|5|0x000000,71|3|0x000000,71|6|0xf8f7f5,71|9|0x000000,263|23|0x000000", 90, 120, 243, 631, 536,'登陆itunes store'}
-- backBtnNew = {0x000000, "2|2|0xf9f9f9,4|6|0x000000,-4|7|0xf1f1f1,-6|7|0x000000,0|11|0xf9f9f9,0|15|0x000000,2|13|0xf9f9f9,4|14|0x111111,11|12|0x000000", 90, 5, 0, 77, 45,'返回'}
-- forbidenTip = {'appleID_forbiden_6.png', 160, 426, 559, 882, 30000000}
-------------------------------------------- ASOScriptInit -----------------------------------------------


local ASOTaskTimeoutDetector = class(TimeoutDetector)

function ASOTaskTimeoutDetector:init(timeLimit, taskStartTime)
	if taskStartTime then
		local time_left = g_config.taskTimeLimit - (os.time() -  taskStartTime)
		TimeoutDetector.init(self, math.min(time_left, timeLimit) )
	else
		TimeoutDetector.init(self, timeLimit)
	end
end
function initPictureInterFace()
	if 'iPhone6' == DEVICE_INFO.type then
		g_pictureInterfase = require("iPhone6")
	end
	setmetatable(g_pictureInterfase, {__index = function (t, funcname)
		t[funcname] = require(funcname)
		return t[funcname] -- return the function
		end})
end

local function deviceIDToNum( s )
	local num = 0
	for w in string.gmatch(s,"%w") do
		if 'a' == w then
			num = num * 2
		elseif 'b' == w then
			num = num * 2 + 1
		elseif 'b' == w then
			num = num * 2
		elseif 'c' == w then
			num = num * 2 + 1
		elseif 'd' == w then
			num = num * 2
		elseif 'e' == w then
			num = num * 2 + 1
		elseif 'f' == w then
			num = num * 2
		else
			local t = tonumber(w)
			if t then
				num = num * 2 + t % 2
			end
		end
	end
	return num
end

local function isBigScreenPhone( phoneType )
	if not phoneType then
		return false
	end
	if 'iPhone7,1' == phoneType or 'iPhone8,2' == phoneType or 'iPhone9,2' == phoneType or phoneType == 'iPhone10,2' then -- plus
		return 1
	elseif 'iPhone10,3' == phoneType or 'iPhone11,2' == phoneType then -- iPhoneX
		return 2
	elseif 'iPhone11,8' == phoneType then -- iphoneXR
	  	return 3
	elseif 'iPhone11,6' == phoneType then --iPhoneXSMax
	  	return 4
	end
	return false
end
local function ASOScriptInit()
	local bRet = false
	repeat
		-- 初始化设备
		if not initDeviceInfo() then
			break
		end
		initErrorMsg()
		initLogFile(DEVICE_INFO.deviceID, DEVICE_INFO.type)
		MAIN_LOOP_END = false
		TASK_END = false
		TASK_RESULT = false
		TASK_RETRY_TIMES = 0
		-- needAppleIdAppMap = false
		-- registerResult = nil

		g_timeoutDetector = ASOTaskTimeoutDetector.new()
		initPictureInterFace()

		isFileBig(LOG_FILE_PATH)
		-- isFileBig('/User/Media/YouWei/log/nwprocess.log')
		isFileBig('/User/Media/YouWei/log/ywso.log')
		unlockMyDevice()
		writeASOLog('解锁屏幕')
		setAssistiveTouchEnable(false)	-- 关闭虚拟键
		math.randomseed(deviceIDToNum(DEVICE_INFO.deviceID) + tostring(os.time()):reverse():sub(1, 7) )
		if not initYwso() then
			writeASOLog('插件更新失败')
			break
		end
		luaExitIfCall(false)
		setAirplaneMode(false)
		bRet = true
	until (true)
	return bRet
end
local taskManager = nil --taskManager: 任务管理器实例，前向声明，以便子任务中可以访问
local function pressHomeBtn( )
	pressHomeKey(0)
	mSleep(144)
	pressHomeKey(1)
end
-------------------------------------------- 执行任务函数 ---------------------------------------
-- function playApp(bundleId, AppId, taskType, accountInfo, isBigScreen)
-- 	writeASOLog('playApp')
-- 	local safariBid = 'com.apple.mobilesafari'
-- 	local function doOpenAppURL( )
-- 		local endTime = os.time() + 30
-- 		writeASOLog('doOpenAppURL')
-- 		closeApp(g_config.appStore)
-- 		closeApp(safariBid)
-- 		os.execute('rm -rf '..appDataPath(safariBid)..'/Library/WebKit/WebsiteData/LocalStorage')
-- 		clearCookies()
-- 		delay(0.5)
-- 		openURL(g_taskData.keyword)
-- 		mSleep(5000)
-- 		while os.time() < endTime do
-- 			if safariBid == frontAppBid() and f_pic(g_config.openURLSuccess[g_taskData.appId]) then
-- 				return 0
-- 			end
-- 		end
-- 		return 
-- 	end
-- 	for i=1,3 do
-- 		errorCode = doOpenAppURL()
-- 		if 0 == errorCode or 4010 == errorCode then
-- 			break
-- 		elseif 4007 == errorCode then
-- 			local dataPath = appDataPath(bundleId)
-- 			if 733689509 == AppId then
-- 				delFile(string.format('%s/Library/Preferences/com.shuqicenter.reader.plist', dataPath)) 
--             elseif 542568832 == AppId then
--                 delFile(string.format('%s/Documents/SZReaderUserModel', dataPath))
-- 			else
-- 				os.execute(string.format('rm -rf %s/Library/Caches/com.crashlytics.data', dataPath))
-- 			end
-- 		end
-- 		closeApp(bundleId)
-- 		delay(5)
-- 	end
-- 	local needRegister = true
-- 	local newAccount = g_pictureInterfase.tryPlay(AppId, bundleId, taskType, accountInfo, isBigScreen, needRegister, nil, g_taskData.advertId)
-- 	if jhBid == frontAppBid() then
-- 		g_pictureInterfase.activeDevice()
-- 	end
-- 	pressHomeBtn()
-- 	delay(2)
-- 	closeApp(bundleId)
-- 	return 0, newAccount
	
-- end
function playApp(bundleId, appId, taskType, accountInfo, isBigScreen)
	writeASOLog('playApp')
	local jhBid = 'com.apple.purplebuddy'
	local function tryStartApp( )
		
		AppBaker:clearDB(bundleId)
		AppBaker:clearPasteboard()
		
		local flag = runApp(bundleId)
		if flag ~= 0 and frontAppBid() ~= jhBid then
			writeASOLog('playApp failed flag: ' .. tostring(flag) .. ', frontAppBid: ' .. tostring(frontAppBid()) )
			return 4006
		end
		delay(10)
		if jhBid == frontAppBid() then
			g_pictureInterfase.activeDevice()
		end
		if bundleId ~= frontAppBid() then
			writeASOLog('playApp failed, frontAppBid: ' .. tostring(frontAppBid()) )
			return jhBid == frontAppBid() and 4010 or 4007
		else
			writeASOLog('打开app成功，开始试玩')
		end
		return 0
	end

	local errorCode = 0
	for i=1,3 do
		errorCode = tryStartApp()
		if 0 == errorCode or 4010 == errorCode then
			break
		elseif 4007 == errorCode then
			local dataPath = appDataPath(bundleId)
			if 733689509 == AppId then
				delFile(string.format('%s/Library/Preferences/com.shuqicenter.reader.plist', dataPath)) 
            elseif 542568832 == AppId then
                delFile(string.format('%s/Documents/SZReaderUserModel', dataPath))
			else
				os.execute(string.format('rm -rf %s/Library/Caches/com.crashlytics.data', dataPath))
			end
		end
		closeApp(bundleId)
		delay(5)
	end
	if errorCode > 0 then
		closeApp(bundleId)
		return errorCode
	end
	setVolumeLevel(0.0)
	local playFile = g_config.testPlayScript[appId] and (DEVICE_INFO.type .. '_' .. appId) or (DEVICE_INFO.type .. '_testPlayDefault')
	local playFuncTab = require (playFile)

	-- 开始试玩
	toast('打开app成功，开始点击广告')
	for i=1,3 do
		if isClickKaiping then
			endTaskCode,newBid = playFuncTab.clickKaipingGuanggao(bundleId)
		else
			endTaskCode,newBid = playFuncTab.clickGuanggao(bundleId,isClickAppAdToStore)
		end
		
		if endTaskCode ~= 5005 then
			break
		end
		closeApp(bundleId)
		delay(5)
		runApp(bundleId)
		mSleep(5000)
	end
	-- local resu =  nil
	if isToDownLoad and endTaskCode ~= 5005 and endTaskCode ~= 5010 then
		toast('开始下载广告app')
		writeASOLog('开始下载广告app')
		require ('DownAndPlay')
		endTaskCode,newBid = downloadAppAndPlay(bundleId,endTaskCode,newBid,currentAPPBidTab)
		if endTaskCode then
			closeApp(newBid)
			delay(2)
		end
		AppBaker:clearDB(newBid)
		AppBaker:clearPasteboard()
		ipaUninstall(newBid)
	end
	-- local newAccount = g_pictureInterfase.tryPlay(AppId, bundleId, taskType, accountInfo, isBigScreen, needRegister, nil, g_taskData.advertId)
	if jhBid == frontAppBid() then
		g_pictureInterfase.activeDevice()
	end
	pressHomeBtn()
	delay(2)
	closeApp(bundleId)

	return endTaskCode,nil
end


local function doClickAppTask( taskData, endTaskCall)
	local errorCode, accountInfo = taskManager:tryPlayApp()
end
local function doActiveAppTask( taskData, endTaskCall, bDwonloaded )
	writeASOLog('doActiveAppTask')
	local errorCode, accountInfo = taskManager:tryPlayApp()
	-- g_appAccountInfo = accountInfo
	-- if not TASK_END and taskData.VPNConfig then
	-- 	-- taskManager.ip = getDeviceNetIp()
	-- 	taskManager:removeVPN()
	-- end
	if TASK_END then
		writeASOLog('task ended')
		return TASK_RESULT
	elseif 0 == errorCode then
		endTaskCall(4000)

		return TASK_RESULT
	elseif bDwonloaded or 4006 ~= errorCode then
		endTaskCall(errorCode)
		return TASK_RESULT

	else
		AppBaker:removeBakedActiveApp( taskData.appBundleId, taskData.appId )
		ipaUninstall(taskData.appBundleId)
		endTaskCall(4006)
		
	end
end



--[[
	打开刚刚下载的应该，然后关闭appstore，上报成功
--]]
local OpenApp = class(ASOSubTask)

function OpenApp:popWindProcess()
	local errorCode = 0
	if g_pictureInterfase.clickCancelBtnBottom() then
		writeASOLog('点击底部取消按钮')
	else
		errorCode = self:otherPopWind()
	end
	return errorCode
end

function OpenApp:xieyiProcess()
	local errorCode = g_pictureInterfase.xieyiProcess()
	if errorCode and errorCode > 0 then
		self:triggerCallback(errorCode)
	end
end

function OpenApp:execute()
	writeASOLog('OpenApp: execute')
	toast('打开应用',1)
	
	while g_pictureInterfase.hasPopWind() do
		if self:popWindProcess() > 0 then
			return
		end
		
		if self:isTimeout() then
			break
		end
		delay(0.5)
	end
	self:xieyiProcess()
	if TASK_END then
		return
	end
	if g_config.appStore ~= frontAppBid() then
		runApp(g_config.appStore)
		delay(2)
	end
	local taskInfo = g_taskData
	--备份沙盒
	AppBaker:bakupActiveApp(taskInfo.appBundleId, taskInfo.appId, taskInfo.appVersion)
	local timeLimit = taskInfo.startTime + g_config.taskTimeLimit - 600 --预留十分钟做任务
	if os.time() > timeLimit then
		self:triggerCallback(4033)

	else
		doActiveAppTask(taskInfo, self.endTaskCall, true)
	end

	writeASOLog('关闭 app: '..taskInfo.appBundleId)
	closeApp(frontAppBid())
	closeApp(taskInfo.appBundleId)
	closeApp(g_config.appStore)
end


function OpenApp:isTimeout()
	return g_timeoutDetector:isTimeout()
end

--[[
	执行任务:串联执行上述子任务
--]]
local function doAsoTask(endTaskCall)
	writeASOLog('doAsoTask')
	require 'AppStoreManager'
	if downloadFromAppStore(endTaskCall) then
		local step6 = OpenApp.new(endTaskCall)
		step6:init()
		step6:execute()
	end
	return not TASK_END
end
--[[
	class TaskManager，控制任务执行:请求任务，执行任务，上报执行结果
--]]
local TaskManager = class()

function TaskManager:ctor()

	self.bInited = false
	-- 苹果账号登陆状态 
	self.bLogin = false
	-- 任务数据
	self.taskData = nil
	self.appleId = nil
	self.password = nil
end

function TaskManager:run()
	if not self:_init() then
		writeASOLog('初始化失败')
		return
	end
	writeASOLog('脚本初始化成功，准备执行任务')
	writeASOLog('------------------------------- run task begin -------------------------------')
	repeat
		isToDownLoad = false
		isClickKaiping = false
		isClickAppAdToStore = false
		self.bLogin = false
		local taskStartTime = os.time()
		fakeCFNetworkVersion()
		removeFakeDeviceInfo()
		VPNManager.removeVPN()

		self.taskData = self:_getTaskData()
		if not self.taskData then
			toast('没有数据')
			writeASOLog('没有任务数据,从新获取')
		else

			g_taskData = self.taskData
			self.taskData.memoryThreshold = self.taskData.memoryThreshold or 500
			if self.taskData.taskTimeout and self.taskData.taskTimeout > 0 then
				g_config.taskTimeLimit = (self.taskData.taskTimeout - 5) * 60
			end
			self.taskData.startTime = taskStartTime
			-- if not self.taskData.appLink and 'http' == string.sub(self.taskData.keyword, 1, 4) then
			-- 	self.taskData.appLink = true
			-- 	self.taskData.integralWallInfo.clickType = 1
			-- end
			closeApp(self.taskData.appBundleId)
-- 			local isToDownLoad = false  --是否去下载
-- local isClickKaiping = false  --是否点击的开屏广告
-- local isClickAppAdToStore = false   --是否点击app内的广告跳转

			-- 是否点击开屏广告
			if math.random(1,100) < clickKPRatio then
				isClickKaiping = true
			end
			if not isClickKaiping then
				-- 点击app内的广告,是否跳转 appStore
				if math.random(1,100) < isToAppstoreRatio then
					isClickAppAdToStore = true
				end
			end
			if (isClickKaiping or isClickAppAdToStore) and math.random(1,100) < downLoadRatio then
				toast('去下载')
				isToDownLoad = true
				newBid = nil
				self:_getAppld()
			end

			if isToDownLoad then
				toast('去登陆')
				self.appleId =  self.taskData.appleId or self.appleId
				self.password =  self.taskData.password or self.password
				if self.bLogin or self:_login() then
				else
					toast('登录AppleId 失败',1)
					break
				end
			end
			if isInstalledApp(self.taskData.appBundleId) then 
				-- 删除沙盒 
				if false and AppBaker:removeSandbox(self.taskData.appBundleId, self.taskData.appId) then
				  	doActiveAppTask(self.taskData, makeCall(self._endTask, self), false)
					if TASK_END then
						return TASK_RESULT
					end
				elseif not AppBaker:isBakedActiveApp(self.taskData.appBundleId, self.taskData.appVersion) then  --安装了app,没有备份沙盒
					writeASOLog('安装了app,没有备份沙盒')
					local appDataPath = appDataPath(self.taskData.appBundleId)

					AppBaker:bakupActiveApp(self.taskData.appBundleId, self.taskData.appId, self.taskData.appVersion)
					-- 恢复沙盒
					if AppBaker:restoreBakedActiveApp(self.taskData.appBundleId, self.taskData.appId, self.taskData.appVersion) then

						doActiveAppTask(self.taskData, makeCall(self._endTask, self), false)
						if TASK_END then
							return TASK_RESULT
						end
					end
				elseif AppBaker:restoreBakedActiveApp(self.taskData.appBundleId, self.taskData.appId, self.taskData.appVersion) then --恢复沙盒
					writeASOLog('安装了app,并且过备份沙盒')
					doActiveAppTask(self.taskData, makeCall(self._endTask, self), false)
					if TASK_END then
						return TASK_RESULT
					end
				else
					AppBaker:removeBakedActiveApp( self.taskData.appBundleId, self.taskData.appId )
				end
			end
			-- 需要去appstore下载
			toast('去下载')
			self:_getAppld()
			if getMemoryAvailable() < self.taskData.memoryThreshold then -- 需要下载app且可用空间小于阈值
				local nHour = tonumber(os.date('%H', os.time()))
				if 1 == self.taskData.taskType and (nHour >= 6 and nHour < 9)then
					self:_endTask(4011)
					break
				end
			end
			ipaUninstall(self.taskData.appBundleId)  --卸载应用app
			self.appleId =  self.taskData.appleId or self.appleId
			self.password =  self.taskData.password or self.password
			self:storeAppIdToMS(tostring(self.taskData.appId) )
			-- needAppleIdAppMap = true
			toast('去登陆')
			if self.bLogin or self:_login() then
				self:_doTask()
			else
				toast('登录AppleId 失败',1)
				break
			end
			-- if self.taskData.appLink then
			-- 	dialog('1')
			-- 	local timeLimit = self.taskData.startTime + g_config.taskTimeLimit
			-- 	-- self:connectVPN()
			-- 	if TASK_END then
			-- 		return
			-- 	end
			-- 	local fakeInfoManager = getFakeInfoManagerObj()
			-- 	local nClickedTimes = 0
			-- 	repeat
			-- 		local fakeInfo = {}
			-- 		fakeInfo.deviceVersion = fakeInfoManager:randomIosVersion(self.taskData.appId)
			-- 		fakeDeviceInfo(fakeInfo)
			-- 		local errorCode = doClickAppTask(self.taskData, makeCall(self._endTask, self) )
					
			-- 	until (nClickedTimes>=30 or os.time() > timeLimit)
			-- end
			-- g_config.registerRatioServer = self.taskData.registerRatio
			
			
		end
	until (false)
	
	self:_logout()
	toast('end TaskManager : run ',1)
	writeASOLog('------------------------------- run task end -------------------------------')
	writeASOLog('', true)
	return TASK_RESULT
end
function TaskManager:_getAppld()
	writeASOLog('_getAppld begin')
	if runScriptInTsp then
		-- 
		local jsonStr = '{"stauts":"1000","_appleid":"sxy6665566@163.com","_applepassword":"New2020!"}'
		
		-- local jsonStr = '{"deviceAlias":"0931b","appId":878962716,"appleId":"sxy6665566@163.com","nickName":"万舒方","appName":"澎湃新闻-专注时政与思想的资讯阅读平台","appBundleId":"cn.thepaper.paper","appVersion":"7.4.2","appSize":75.9,"password":"New2020!","keyword":"澎湃新闻","taskType":3,"integralWallInfo":{"playTime":0,"delayTime":0,"keepApp":1,"taskId":193940,"preTaskId":193901,"advertId":1079,"channelId":20008,"iphoneEnable":0,"needQuery":1,"clickType":0,"registerRatio":0},"VPNConfig":{"id":304,"server":"yhtip.com","account":"yoy272","password":"Youwei2017","key":"1"},"localIP":"36.149.100.28","memoryThreshold":1000,"uninstallList":[{"advertId":1167,"appId":990531994,"idfaList":["90477A38-78C3-4A17-8C54-89C16180127A"]},{"advertId":100028,"appId":561859697,"idfaList":["002EF40C-0E6D-4CDC-BF26-847577757504"]},{"advertId":1167,"appId":990531994,"idfaList":["10687556-97E0-4300-9B08-5E87DD9C28F1"]},{"advertId":100080,"appId":1059274584,"idfaList":["8042561B-7736-4FDF-ABF5-9EC8CAD89EE6"]},{"advertId":100028,"appId":561859697,"idfaList":["C035BE7D-B11A-44F1-8268-21C09F0BC5F8"]},{"advertId":1284,"appId":990531994,"idfaList":["B06C6328-3BEF-41C0-B674-359FB9F2035A"]},{"advertId":1261,"appId":461703208,"idfaList":["4EC430ED-FCCF-4C8A-BBAD-74F96194D4DE"]}],"command":6,"resultCode":0}'
		-- local jsonStr = '{"appId":1211160027,"appleId":"q4202024023579bv@163.com","appName":"现金秒贷-快速借款,选嘉银","appBundleId":"com.appstore.speeddai","password":"Aa112003","keyword":"秒贷","taskType":3,"integralWallInfo":{"playtime":180,"keepApp":1,"taskId":1408},"command":6,"resultCode":0}'
		writeASOLog('_getTaskData = '..jsonStr)
		severData = cjson.decode(jsonStr)
		self.taskData.appleId = severData._appleid
		self.taskData.password = severData._applepassword
	  	return severData
	end
	local getTaskParam={}
	-- 获取任务数据。 
	getTaskParam['deviceId'] = DEVICE_INFO.deviceID
	local severData = doHttpGet(g_config.getAppleIdApi,getTaskParam)
	severData = cjson.decode(severData)
	if severData then
		if '1000' == severData.stauts then
			writeASOLog('_getTaskData 返回正确')
			self.taskData.appleId = string.trim(severData._appleid)
			self.taskData.password = string.trim(severData._applepassword)
			return severData
		else 
			writeASOLog('_getTaskData 返回错误状态：' .. severData.stauts or ('nil'))
			return nil
		end
	else
		writeASOLog('返回数据为空')
		return nil
	end
	-- body
end
function TaskManager:_getTaskData()
	writeASOLog('_getTaskData begin')
	--[[
		test taskData
	--]]

	if runScriptInTsp then
		-- local jsonStr = '{"deviceAlias":"0931b","appId":1523426423,"appleId":"sxy6665566@163.com","nickName":"万舒方","appName":"乌合之众","appBundleId":"com.bsqs.joinus","appVersion":"1.2","appSize":75.9,"password":"New2020!","keyword":"乌合之众","taskType":3,"integralWallInfo":{"playTime":0,"delayTime":0,"keepApp":1,"taskId":193940,"preTaskId":193901,"advertId":1079,"channelId":20008,"iphoneEnable":0,"needQuery":1,"clickType":1,"registerRatio":0},"localIP":"36.149.100.28","memoryThreshold":1000,"command":6,"resultCode":0}'
		local jsonStr = '{"deviceAlias":"0931b","appId":1526248376,"appleId":"sxy6665566@163.com","nickName":"万舒方","appName":"Cute Bird Jelly","appBundleId":"com.bsqs.CuteBirdJelly","appVersion":"1.1","appSize":75.9,"password":"New2020!","keyword":"Cute Bird Jelly","taskType":3,"integralWallInfo":{"playTime":0,"delayTime":0,"keepApp":1,"taskId":193940,"preTaskId":193901,"advertId":1079,"channelId":20008,"iphoneEnable":0,"needQuery":1,"clickType":1,"registerRatio":0},"localIP":"36.149.100.28","memoryThreshold":1000,"command":6,"resultCode":0}'
		
		-- local jsonStr = '{"deviceAlias":"0931b","appId":878962716,"appleId":"sxy6665566@163.com","nickName":"万舒方","appName":"澎湃新闻-专注时政与思想的资讯阅读平台","appBundleId":"cn.thepaper.paper","appVersion":"7.4.2","appSize":75.9,"password":"New2020!","keyword":"澎湃新闻","taskType":3,"integralWallInfo":{"playTime":0,"delayTime":0,"keepApp":1,"taskId":193940,"preTaskId":193901,"advertId":1079,"channelId":20008,"iphoneEnable":0,"needQuery":1,"clickType":0,"registerRatio":0},"VPNConfig":{"id":304,"server":"yhtip.com","account":"yoy272","password":"Youwei2017","key":"1"},"localIP":"36.149.100.28","memoryThreshold":1000,"uninstallList":[{"advertId":1167,"appId":990531994,"idfaList":["90477A38-78C3-4A17-8C54-89C16180127A"]},{"advertId":100028,"appId":561859697,"idfaList":["002EF40C-0E6D-4CDC-BF26-847577757504"]},{"advertId":1167,"appId":990531994,"idfaList":["10687556-97E0-4300-9B08-5E87DD9C28F1"]},{"advertId":100080,"appId":1059274584,"idfaList":["8042561B-7736-4FDF-ABF5-9EC8CAD89EE6"]},{"advertId":100028,"appId":561859697,"idfaList":["C035BE7D-B11A-44F1-8268-21C09F0BC5F8"]},{"advertId":1284,"appId":990531994,"idfaList":["B06C6328-3BEF-41C0-B674-359FB9F2035A"]},{"advertId":1261,"appId":461703208,"idfaList":["4EC430ED-FCCF-4C8A-BBAD-74F96194D4DE"]}],"command":6,"resultCode":0}'
		-- local jsonStr = '{"appId":1211160027,"appleId":"q4202024023579bv@163.com","appName":"现金秒贷-快速借款,选嘉银","appBundleId":"com.appstore.speeddai","password":"Aa112003","keyword":"秒贷","taskType":3,"integralWallInfo":{"playtime":180,"keepApp":1,"taskId":1408},"command":6,"resultCode":0}'
		writeASOLog('_getTaskData = '..jsonStr)
		severData = cjson.decode(jsonStr)
	  	return severData
	end
	local getTaskParam={}
	-- 获取任务数据。 
	getTaskParam['deviceId'] = DEVICE_INFO.deviceID
	local severData = doHttpGet(g_config.getTaskApi,getTaskParam)
	severData = cjson.decode(severData)
	if severData then
		if '1000' == severData.stauts then
			writeASOLog('_getTaskData 返回正确')
			-- 处理数据 vpn
			local vpnInfo = {}
			vpnInfo['server'] = severData._vpnurl
			vpnInfo['account'] = severData._vpnaccount
			vpnInfo['password'] = severData._vpnpwd
			vpnInfo['key'] = severData._vpnkey
			severData.VPNConfig = vpnInfo
			-- 改机信息
			local fakeInfo = {}
			fakeInfo['identifierForVendor'] = severData._idfa
			-- fakeInfo['ProductType'] = severData._device
			fakeInfo['deviceUDID'] = severData._udid
			if (type(severData._os) ~= "null" and severData._os ~= '' and type(severData._os) ~= "nil") then
			    fakeInfo['deviceVersion'] = severData._os
			end
			severData.fakeInfo = fakeInfo 
			-- app信息 "appName":"抖音短视频","appBundleId":"com.ss.iphone.ugc.Aweme","appVersion":"11.6.0"
			severData.appId = tonumber(severData._appid)
			severData.appName = severData._appname
			severData.appBundleId = severData._bundleid
			severData.appVersion = severData._app_version
			if (type(severData._word) == "null" or severData._word == '' or type(severData._word) == "nil") then
				severData.keyword = severData._appname
			else 
				severData.keyword = severData._word
			end

			-- 任务类型
			severData.taskType = tonumber(severData._tasktype)
			-- "memoryThreshold":1000,
			severData.memoryThreshold = 1000

			severData.advertId = severData._adid
			severData._datafrom = severData._datafrom
			severData.registerRatio = tonumber(severData._registerRatio)
			if (type(severData._bRetain) == "null" or severData._bRetain == '' or type(severData._bRetain) == "nil") then
			   severData._bRetain = "0"
			end
			
			
			return severData
		else 
			writeASOLog('_getTaskData 返回错误状态：' .. severData.stauts or ('nil'))
			return nil
		end
	else
		writeASOLog('返回数据为空')
		return nil
	end
end

function TaskManager:tryPlayApp( accountInfo )
	writeASOLog('TaskManager:tryPlayApp')
	toast('开始试玩,连接vpn')
	self:connectVPN()
	if self.taskData.VPNConfig then
		VPNManager.checkVPNStatus(makeCall(self._endTask, self))
	end
	if not self:_clickReported() then
		-- 点击上报出错
		self:_endTask(4044)
		return
	end
	-- 保存当前安装的app
	currentAPPBidTab= getUserApp() --该函数只支持苹果 iOS 系统
	writeASOLog("当前手机安装的所有app")
	writeASOLog(currentAPPBidTab)
	if self.taskData.VPNConfig then
		VPNManager.checkVPNStatus(makeCall(self._endTask, self))
	end
	fakeDeviceInfo(self.taskData.fakeInfo)
    writeASOLog('改机完成')
    toast('改机完成')
	self:addAppToFakeTweak(self.taskData.appBundleId)
    writeASOLog('写入bundleId完成')
	return playApp(self.taskData.appBundleId, self.taskData.appId, self.taskData.taskType, accountInfo, self.taskData.bigScreen)
end
function TaskManager:storeAppIdToMS(appId_string)
	writeASOLog('存到秒搜的appID: '..appId_string)
    --秒搜插件调用代码
    os.execute("mkdir /ZTY")
    writeFileString("/ZTY/tp001",appId_string,"w")
    os.execute("chmod  7777  /ZTY")
    os.execute("chmod  7777  /ZTY/tp001")
    writeASOLog('秒搜 appId存储完毕')
end
function TaskManager:addAppToFakeTweak( bundleID ,addBid)
	local YWFakeTweakPath = '/Library/MobileSubstrate/DynamicLibraries/YWFakeTweak.plist'
	if not addBid then -- not isFileExist(YWFakeTweakPath) then
		local plist = [[<?xml version="1.0" encoding="UTF-8"?>
							<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
							<plist version="1.0">
							<dict>
								<key>Filter</key>
								<dict>
									<key>Bundles</key>
									<array>
										<string>]] .. bundleID ..[[</string>
									</array>
								</dict>
							</dict>
							</plist>]]
		writeFileString(YWFakeTweakPath,plist)
		return true
	end
	require 'ts'
	if not bundleID then
		return false
	end
	local plist = (require 'sz').plist
	local plistInfo = plist.read(YWFakeTweakPath)
	
	table.insert(plistInfo.Filter.Bundles,bundleID)
	plist.write(YWFakeTweakPath, plistInfo)
	return true
end
function TaskManager:_clickReported() 
	writeASOLog('TaskManager:_clickReported')
	local fakeInfo = {}
	if self.taskData.fakeInfo then
		fakeInfo = self.taskData.fakeInfo
	end
    local fakeInfoManager = getFakeInfoManagerObj()
	local productType = fakeInfo.productType or fakeInfoManager:randomProductType(g_taskData.appId)
	-- fakeInfo.identifierForVendor = 'F0C31B7B-F693-4C0C-BEE4-67ED1E4F28EA'
	if not fakeInfo.identifierForVendor then
		fakeInfo.identifierForVendor = fakeInfoManager:randomDeviceIDFA()
	end
	if not fakeInfo.ProductType then
		fakeInfo.ProductType = productType
	end
	self.taskData.bigScreen = isBigScreenPhone(fakeInfo.ProductType)
	if not fakeInfo.deviceVersion then
		fakeInfo.deviceVersion = fakeInfoManager:randomIosVersion(g_taskData.appId, nil, productType)
	end
	if g_config.appId ~= 1525825614 then
		if fakeInfo.deviceVersion then
			fakeInfo.CFNetworkVersion = g_config.CFNetworkVersions[fakeInfo.deviceVersion] and g_config.CFNetworkVersions[fakeInfo.deviceVersion][1]
		end
		if not fakeInfo.deviceUUID then
			fakeInfo.deviceUUID = fakeInfoManager:randomDeviceUUID()
		end
		if not fakeInfo.deviceUDID then
			fakeInfo.deviceUDID = fakeInfoManager:randomDeviceUDID()
		end
		if not fakeInfo.deviceIDFV then
			fakeInfo.deviceIDFV = fakeInfoManager:randomDeviceIDFV()
		end
		if not fakeInfo.UTDID then
			fakeInfo.UTDID = fakeInfoManager:randomDeviceUTDID()
		end
		if not fakeInfo.ScreenBrightness then
			fakeInfo.ScreenBrightness = fakeInfoManager:randomScreenBrightness()
		end
		fakeInfo.wifiAddress = fakeInfo.wifiAddress or string.lower(fakeInfoManager:randomWifiAddress() )
		fakeInfo.CarrierName = fakeInfoManager:randomCarrierName()
		fakeInfo.wifiIP = fakeInfoManager:randomLocalIp()
		fakeInfo.wifiName = fakeInfoManager:randomWifiName()
	end
	self.taskData.fakeInfo = fakeInfo
	return true
	-- if runScriptInTsp then
	-- 	return true
	-- end
	-- local param = {}
	-- param['_action'] = 'clickreport'
	-- param['_idfa'] = fakeInfo.identifierForVendor
	-- param['_ip'] = self.taskData.netIp
	-- param['_adid'] = self.taskData.advertId
	-- param['_datafrom'] = self.taskData._datafrom
	-- param['_word'] = ''
	-- param['_os'] = fakeInfo.deviceVersion
	-- param['_device'] = fakeInfo.ProductType
	-- param['_udid'] = fakeInfo.deviceUDID
	-- param['_taskid'] = self.taskData._taskid
	-- local result = doHttpGet(g_config.httpAddress,param)
	-- result = cjson.decode(result)
	-- writeASOLog('result === '..result.stauts)
	-- if result then
	-- 	if 10000 == result.stauts then
	-- 		writeASOLog('点击上报 clickreport------ 返回正确')
	-- 		return true
	-- 	else
	-- 		writeASOLog('点击上报 clickreport------ 返回错误：' .. result.stauts)
	-- 		return false
	-- 	end
	-- else
	-- 	return false
	-- end
	

end
function TaskManager:_endTask( errorCode, snapshotFile )
	if registerErrorcode and registerErrorcode > 0 then
		errorCode = registerErrorcode
		snapshotFile = getSnapshotFileName(errorCode)
	end
	local needRemoveApp = 1016 == errorCode
	if needRemoveApp and g_pictureInterfase.findCantDownload() then
		writeASOLog('下载超时 弹框 无法下载')
		errorCode = 1036
	end
	if not snapshotFile and snapshotScreen(errorCode) then
		snapshotFile = getSnapshotFileName(errorCode)
	end
	local bTaskSuccess = (4000 == errorCode or 5006 < errorCode)
	if not bTaskSuccess and isBlackScreen() then
		errorCode = 4015
	end
	local errorMsg = ERROR_MSG[errorCode] or ''
	local str = ''
	if isClickKaiping then
		str = '点击开屏广告'
	elseif isClickAppAdToStore then
		str = '跳转到appStore'
	else
		str = 'app内只看视频'
	end
	if isToDownLoad then
		str = str .. ',app应该下载激活'
	end

	writeASOLog('TaskManager:_endTask('.. str ..') - (errorCode: ' .. errorCode .. ', errorMsg: ' .. errorMsg .. ')')
	if not runScriptInTsp then
		if errorCode == 1098 or errorCode == 1024 or errorCode == 1021 or errorCode == 5014 or errorCode == 5015 then
			local appParm = {}
			appParm['appleId'] = self.taskData.appleId
			local appresult = doHttpGet(g_config.disableAppid,appParm)
		end

		local param = {}
		param['_uuid'] = self.taskData._uuid
		param['_ip'] = self.taskData.netIp

		-- param['_action'] = 'activeapp'
		-- param['_idfa'] = self.taskData.fakeInfo.identifierForVendor
		-- param['_ip'] = self.taskData.netIp
		-- param['_adid'] = self.taskData.advertId
		-- param['_datafrom'] = self.taskData._datafrom
		-- param['_word'] = ''
		-- param['_os'] = self.taskData.fakeInfo.deviceVersion
		-- param['_device'] = self.taskData.fakeInfo.ProductType
		-- param['_udid'] = self.taskData.fakeInfo.deviceUDID
		-- param['_taskid'] = self.taskData._taskid
		if bTaskSuccess then
			param['_result'] = 1
			TASK_RESULT = true
		else
			param['_result'] = 2
		end
		param['_msg'] = errorMsg
		local result = doHttpGet(g_config.httpAddress,param)
		result = cjson.decode(result)
		writeASOLog('result === '..result.stauts)
		if result then
			if 10000 == result.stauts then
				writeASOLog('激活 _endTask------ 返回正确')
			else
				writeASOLog('激活 _endTask------ 返回错误：' .. result.stauts)
				
			end
		else 
			writeASOLog('上传任务结果重试失败: ')
		end
	end
	
	AppBaker:clearDB(self.taskData.appBundleId)
	AppBaker:clearPasteboard()
	removeFakeDeviceInfo()
	self:removeVPN()
	TASK_END = true
end
function TaskManager:_init()
	toast('init',1)
	if not self.bInited then
		self.appleId = ''
		self.password = ''
		self.bInited = ASOScriptInit()
	end
	return self.bInited
end

function TaskManager:getAccountManager( )
	if not self.AccountManager then
		self.AccountManager = require ('AppleIdManager')
	end
	return self.AccountManager
end
function TaskManager:_login()
	writeASOLog('TaskManager:_login()')
	toast('登录账号',1)
	if not self.bLogin then
		TASK_RETRY_TIMES = 0
		
		self:getAccountManager():login(makeCall(self._endTask, self) )
		self.bLogin = not TASK_END
		writeASOLog(self.bLogin and '登录成功' or '登录失败')
		toast(self.bLogin and '登录成功' or '登录失败', 1)
		delay(2)
	end
	g_config.bLogin = self.bLogin
	return self.bLogin
end
function TaskManager:_logout()
	writeASOLog('TaskManager:_logout()')
	toast('退出账号',1)
	delay(1)
	TASK_END = false
	if self.bLogin then
		self:getAccountManager():logout()
		closeApp(g_config.applePreferences)
		self.bLogin = false
	else 
		writeASOLog('has not login')
		toast('has not login',1)
		delay(2)
	end
	g_config.bLogin = self.bLogin
end
function TaskManager:_doTask()
	writeASOLog('开始执行任务')
	toast('执行任务',1)
	delay(2)
	TASK_END = false
	-- YU_DA_MA = false
	TASK_RETRY_TIMES = 0
	closeApp(g_config.appStore)
	doAsoTask(makeCall(self._endTask, self) )
end
function TaskManager:checkNetStatus( )
	local step1 = CheckNetStatus.new()
	step1:init(20)
	return step1:execute()
end

-- ip排重
function TaskManager:isIpOk( )
	writeASOLog('isIpOk----start')
	local deviceNetIp = getDeviceNetIp()
	if deviceNetIp then
		self.taskData.netIp = deviceNetIp
		writeASOLog('isIpOk 返回正确')
		return true
	else
		writeASOLog('isIpOk 返回错误')
		return false
	end

	-- local ipAskParam ={}
	-- ipAskParam['command'] = 13
	-- ipAskParam['protocolVer'] = 1
	-- ipAskParam['requestSource'] = 2
	-- ipAskParam['deviceId'] = DEVICE_INFO.deviceID
	-- ipAskParam['scriptId'] = g_config.scriptId
	-- ipAskParam['taskId'] = self.taskData.integralWallInfo.taskId
	-- ipAskParam['taskType'] = self.taskData.taskType
	-- ipAskParam['appId'] = self.taskData.appId
	-- ipAskParam['VPNId'] = self.taskData.VPNConfig.id

	-- --writeASOLog('iP : ' .. tostring(getDeviceNetIp()) )
	-- local severData = doHttpPost(ipAskParam)
	-- if severData then
	-- 	if 0 == severData.resultCode then
	-- 		writeASOLog('isIpOk 返回正确')
	-- 		return true
	-- 	else
	-- 		writeASOLog('isIpOk 返回错误：' .. severData.resultMessage)
	-- 		return false
	-- 	end
	-- else
	-- 	return false
	-- end
end
function TaskManager:connectVPN( )

	local function fakeDeviceGPS()
		
		self.pos = fakeMyPosition()
		return self.pos
	end
	local YWVPNPath = '/Library/MobileSubstrate/DynamicLibraries/YWVPN.plist'
	if not isFileExist(YWVPNPath) then
		local plist = [[<?xml version="1.0" encoding="UTF-8"?>
							<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
							<plist version="1.0">
							<dict>
								<key>Filter</key>
								<dict>
									<key>Bundles</key>
									<array>
										<string>com.apple.mobilesafari</string>
										<string>com.apple.Preferences</string>
									</array>
								</dict>
							</dict>
							</plist>]]
		writeFileString(YWVPNPath,plist)
	end

	if self.taskData.VPNConfig then
		TASK_RETRY_TIMES = 0
		VPNManager.connectVPN(makeCall(self._endTask, self))
		local netUnavailableTime = 0
		local ipFailTimes = 0
		local fakeGPSFailTimes = 0
		local timeLimit = self.taskData.startTime + g_config.taskTimeLimit - 600 --预留三分钟做任务
		local vpnStatus = nil
		while not TASK_END do
			if not self:checkNetStatus() then
				netUnavailableTime = netUnavailableTime + 1
				if nil == vpnStatus then
					VPNManager.disConnectVPN()
					vpnStatus = VPNManager.getVPNStatus(g_taskData.VPNConfig.quId, g_taskData.VPNConfig.srvid)
					if '0' == vpnStatus then
						self:_endTask(1042)
						return
					end
				end
			elseif not self:isIpOk() then
				ipFailTimes = ipFailTimes + 1
			elseif not fakeDeviceGPS() then
				fakeGPSFailTimes = fakeGPSFailTimes + 1
			else
				break
			end
			if (netUnavailableTime + ipFailTimes + fakeGPSFailTimes) >= 50 or os.time() > timeLimit then
				VPNManager.disConnectVPN()
				if ipFailTimes <=0 and fakeGPSFailTimes <= 0 then
					self:_endTask(1042)
				else
					self:_endTask(ipFailTimes >= fakeGPSFailTimes and 1037 or 1041)
				end
				return
			end
			VPNManager.reconnectVPN(makeCall(self._endTask, self) )
		end
	else

		-- 伪装地理位置
		fakeMyPosition()
	end
end

function TaskManager:removeVPN( )
	if self.taskData.VPNConfig then
		TASK_RETRY_TIMES = 0
		cancelFakeMyPosition()
		if not VPNManager.removeVPN() then
			-- delFile('/Library/MobileSubstrate/DynamicLibraries/YWVPN.plist')
			VPNManager.removeVPN()
		end
	end
	-- delFile('/Library/MobileSubstrate/DynamicLibraries/YWVPN.plist')
	closeApp(g_config.applePreferences)
	closeApp(g_config.appStore)
end


function startTask()
	-- taskManager = TaskManager.new()
	-- 	taskManager:run()
	local status, err = xpcall(function()
		taskManager = TaskManager.new()
		taskManager:run()
	end,
	function( )
		writeASOLog(debug.traceback())
	end
	)

	if not status then
		writeASOLog('进入status')
		-- VPNManager.removeVPN(true)

	end
end


