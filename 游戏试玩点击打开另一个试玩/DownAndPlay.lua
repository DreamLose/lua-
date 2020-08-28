local g_pictureInterfase = require("iPhone6")
downDone = {0x0080fc, "-1|0|0x0080fc,-2|0|0x0080fc,-3|0|0x0080fc,-4|0|0x0080fc,-4|5|0xffffff,-2|-1|0x0080fc,-3|2|0x0080fc,-3|4|0xffffff,-4|0|0x0080fc", 90, 654, 284, 733, 383,'下载完成,未安装'}
notDownDone = {0x0080fc, "-1|0|0xffffff,-1|-1|0x0381fc,-1|2|0xffffff,0|2|0x0080fc,-9|0|0x0080fc,-15|3|0x0080fc,0|5|0xffffff,0|27|0x0080fc,0|36|0xffffff", 90, 645, 239, 745, 402,'未下载完成'}
needLoginOld = { 0x000000, "0|2|0xf8f7f6,9|2|0x000000,16|4|0x000000,16|8|0x000000,73|24|0x000000,78|24|0xf8f8f7,78|27|0x000000,122|16|0x000000,125|26|0x000000", 90, 95, 234, 659, 679,'需要登录'}
needLogNew = {0x000000, "0|3|0xedeaeb,3|3|0x000000,14|1|0x000000,17|3|0xf2f0f0,18|5|0x000000,71|3|0x000000,71|6|0xf8f7f5,71|9|0x000000,263|23|0x000000", 90, 120, 243, 631, 536,'登陆itunes store'}
neeoLog = {0x000000, "0|2|0xc6c6c6,17|0|0x000000,17|2|0xc6c6c6,17|4|0x000000,103|17|0x000000,102|20|0xc6c6c6,102|24|0x000000,121|16|0x000000,124|25|0x000000", 90, 258, 278, 506, 419,'重新登陆'}
forbidenTip = {'appleID_forbiden_6.png', 160, 426, 559, 882, 30000000}
douyin = {'douyin_6.png',11, 118, 484, 563,30000000}
pinduoduo = {'pinduoduo.png',11, 118, 484, 563,30000000}
daju = {'daju_6.png',11, 118, 484, 563,30000000}
suning = {'suning_6.png',11, 118, 484, 563,30000000}
gengxinNull = {0x99ccfe, "0|4|0xffffff,0|7|0x99ccfe,5|9|0x99ccfe,10|15|0xffffff,14|15|0x99ccfe,53|33|0x99ccfe,56|33|0xffffff,56|29|0x99ccfe,60|34|0x99ccfe", 90, 611, 225, 744, 460,'更新不可点击'}
lushiGet = {0xf1f964, "0|-2|0x2b1510,1|8|0xf1f964,4|5|0xf1f964,7|5|0x2b1510,-4|5|0xf1f964,-6|5|0x2b1510,0|-5|0xf1f964,-1|-4|0x2b1510,41|-5|0xf1f964", 90, 615, 570, 742, 675,'炉石传说'}
xiechengGet = { 0x030a14, "0|-1|0xd7f4ff,0|6|0x030a14,4|5|0x030a14,6|5|0xd7f4ff,-5|5|0x030a14,-6|5|0xd7f4ff,-1|10|0xd7f4ff,-1|9|0x030a14,4|9|0xd7f4ff", 90, 615, 558, 739, 648,'携程获取'}
canNotDown = { 0x000000, "0|7|0xd7e2e0,0|10|0x000000,69|0|0x000000,69|10|0xd3dcda,69|13|0x000000,131|4|0x000000,131|10|0xcae4e1,131|17|0x000000,167|29|0x000000", 90, 109, 500, 693, 860,'无法下载项目'}
canNotDownNew = {0x000000, "21|0|0x000000,24|0|0xf9e1e1,36|2|0x000000,36|6|0xf9dfdf,116|1|0x000000,117|3|0xf9dfdd,175|8|0x000000,175|13|0xf9e0dd,189|29|0x000000", 90, 73, 496, 689, 808,'无法下载'}
xieyiCh = {0x000000, "407|-2|0x2f2f2e,407|1|0xf7f9f4,407|4|0x000000,432|13|0xf5f9f2,432|16|0x000000,241|-5|0x000000,245|-5|0xf5f9f7,245|-3|0x000000,374|-2|0x000000", 90, 102, 465, 684, 865,'协议更改'}

agreeBtn = {0x007aff, "0|4|0xf6f6f7,0|7|0x007aff,0|10|0xf5f5f7,5|28|0xf5f5f7,8|28|0x007aff,35|10|0x007aff,36|23|0x007aff,48|26|0x007aff,50|27|0xf6f6f8", 90, 580, 37, 749, 129,'同意'}
agreeBtn1 = {0x1283ff, "0|2|0xf8f8f8,0|5|0x007aff,4|20|0x007aff,5|26|0xf8f8f8,9|26|0x007aff,35|-3|0x077dff,35|-5|0xf7f7f7,49|25|0x007aff,49|27|0xf8f8f8", 90, 105, 482, 693, 844,'同意1'}
canNotDownTu = {'conNotDown_6.png',81,457,693,992,30000000}
canNotDownEnTu = {'conNotDownEn_6.png',92,415,721,929,30000000}
local function addNewAppToFakeTweak(bundleID)
	local YWFakeTweakPath = '/Library/MobileSubstrate/DynamicLibraries/YWFakeTweak.plist'
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
local function pressHomeBtn( )
	pressHomeKey(0)
	mSleep(144)
	pressHomeKey(1)
end
function downloadAppAndPlay(bundleId,clickCode,newBid,currentAPPBidTab)
	writeASOLog('downloadAppAndPlay: execute')
	delay(1)
	clearAppstoreCache()
	local downLoadBegan = false
	local newTime = os.time() + 3600
	local findCount = 0
	while not TASK_END do
		if  g_pictureInterfase.findOpenOrUpdate() then
			toast('下载完成')
			writeASOLog('下载完成,开始打开新的app')
			if f_pic(lushiGet) or f_pic(xiechengGet) then
				if clickCode == 5007 then
					return 5009,newBid
				end
				return 5013,newBid
				end
			break
		elseif f_pic(downDone) and not f_pic(notDownDone) then
			if findCount > 10 then
				pressHomeBtn()
				writeASOLog('下载等待安装,开始打开新的app')
				break
			end
			-- 回到桌面
			findCount = findCount + 1
			delay(10)
		elseif g_pictureInterfase.findDownLoadingApp() or f_pic(notDownDone) then
			toast('正在下载..')
			delay(8)
			if not downLoadBegan then
				clearAppstoreCache()
				downLoadBegan = true
			end
		elseif g_pictureInterfase.clickCloud() then
			downLoadBegan = true
		elseif g_pictureInterfase.clickGetBtn() then
			writeASOLog('点击获取按钮')
			delay(1)
		elseif g_pictureInterfase.clickInstallBtn() then
			downLoadBegan = true
			writeASOLog('点击安装按钮')
			delay(2)
		elseif g_pictureInterfase.findDownNull() then
			clearAppstoreCache() 
		elseif f_pic(neeoLog) or f_pic(needLoginOld) or f_pic(needLogNew) then
			click(math.random(146,350),math.random(570,630))
			mSleep(2000)
			if f_tu(douyin) then
				newBid = "com.ss.iphone.ugc.Aweme"
				toast('卸载抖音')
			elseif f_tu(pinduoduo) then
				newBid = "com.xunmeng.pinduoduo"
				toast('拼多多')
			elseif f_tu(daju) then
				newBid = "com.mntech.pocketsniper"
			elseif f_tu(suning) then
				newBid = "SuningEMall"
			else 
				snapshot("weizhi.png", 20, 151, 235, 360);
				return clickCode,newBid
			end
			if newBid then
				ipaUninstall(newBid)
			end
		elseif f_tu(forbidenTip) then
			writeASOLog('账号禁用')
			click(374,740)
			if clickCode == 5007 then
				return 5014,newBid
			end
			return 5015,newBid
		elseif f_pic(gengxinNull) or f_pic(lushiGet) or f_pic(xiechengGet) then
			if clickCode == 5007 then
				return 5009,newBid
			end
			return 5013,newBid
		elseif f_pic(xieyiCh) then
			toast('协议更改')
			mSleep(2000)
			click(512,786)
			mSleep(2000)
		elseif c_pic(agreeBtn1) or c_pic(agreeBtn) then
			mSleep(2000)
		elseif f_pic(canNotDown) or f_pic(canNotDownNew) or f_tu(canNotDownTu) or f_tu(canNotDownEnTu) then
			toast('无法下载app:bid = '..newBid)
			mSleep(2000)
			click(230,760)
			mSleep(2000)
			if clickCode == 5007 then
				return 5014,newBid
			end
			return 5015,newBid
		else
			delay(0.5)
		end
		if newTime < os.time() then
			if clickCode == 5007 then
				return 5009,newBid
			end
			return 5013,newBid

		end
	end
	local function getNewBid( ... )
		if newBid then
			return newBid
		end
		-- 获取当前安装的app
		local appTab = getUserApp() --该函数只支持苹果 iOS 系统
		writeASOLog("下载完成后手机安装的所有app")
		writeASOLog(appTab)
		for i,v in ipairs(appTab) do
			local isNew = true
			for index,item in ipairs(currentAPPBidTab) do
				if v == item then
					isNew = false
					break
				end
			end
			if isNew then
				return v
			end
		end
		
	end
	for i=1,3 do
		newBid = getNewBid()
		if newBid then
			break
		end
		delay(20)
	end

	if not newBid then
		if clickCode == 5007 then
			return 5009,newBid
		end
		return 5013,newBid
	end

	-- 写入plist
	toast('新的bid:' .. newBid)
	writeASOLog('新的bid:' .. newBid)
	addNewAppToFakeTweak(newBid)
	toast("写入新的Bid结束,开始试玩新的app")
	local playTime = os.time() + 3600
	while playTime > os.time() do
		if isInstalledApp(newBid) and 0 == runApp(newBid)  then
			local currentTime = os.time()
			while os.time() < currentTime + 60 do
				if 1 ~= isFrontApp(newBid) then
					runApp(newBid)
					mSleep(5000)
				else
					mSleep(5000)
				end

			end
			if clickCode == 5007 then
				return 5008,newBid
			end
			return 5012,newBid
		elseif f_pic(canNotDown) or f_pic(canNotDownNew) or f_tu(canNotDownTu) or f_tu(canNotDownEnTu) then
			toast('无法下载app:bid = '..newBid)
			mSleep(2000)
			click(230,760)
			mSleep(2000)
			if clickCode == 5007 then
				return 5009,newBid
			end
			return 5013,newBid
		end
		toast('正在测试打开app失败:bid = '..newBid)
		delay(10)

	end

	if clickCode == 5007 then
		return 5009,newBid
	end
	return 5013,newBid

end