local g_pictureInterfase = require("iPhone6")

feiji = {'feiji_6.png',36, 2, 714, 1114,30000000}
homeBtn = {'homeBtn_6.png',36, 2, 714, 1114,30000000}
cancle = {0x007aff, "-4|0|0xf9f9f9,6|7|0x208afe,6|13|0xf9f9f9,6|15|0x007aff,37|2|0x027bff,37|6|0xf9f9f9,37|11|0x007aff,55|27|0x007aff,52|28|0xf9f9f9", 90, 12, 16, 148, 123,'取消'}
neeoLog = {0x000000, "0|2|0xc6c6c6,17|0|0x000000,17|2|0xc6c6c6,17|4|0x000000,103|17|0x000000,102|20|0xc6c6c6,102|24|0x000000,121|16|0x000000,124|25|0x000000", 90, 258, 278, 506, 419,'重新登陆'}
downDone = {0x0080fc, "-1|0|0x0080fc,-2|0|0x0080fc,-3|0|0x0080fc,-4|0|0x0080fc,-4|5|0xffffff,-2|-1|0x0080fc,-3|2|0x0080fc,-3|4|0xffffff,-4|0|0x0080fc", 90, 654, 284, 733, 383,'下载完成,未安装'}

notDownDone = {0x0080fc, "-1|0|0xffffff,-1|-1|0x0381fc,-1|2|0xffffff,0|2|0x0080fc,-9|0|0x0080fc,-15|3|0x0080fc,0|5|0xffffff,0|27|0x0080fc,0|36|0xffffff", 90, 645, 239, 745, 402,'未下载完成'}
downLoading = {0x0281fc, "15|4|0x0080fc,15|7|0xffffff,15|45|0x0080fc,0|47|0xffffff,0|49|0x0381fc,-21|37|0x0080fc,-24|25|0x0281fc,-8|25|0xffffff,1|25|0x0080fc", 90, 635, 270, 749, 410,'正在下载'}
gengxinNull = {0x99ccfe, "0|4|0xffffff,0|7|0x99ccfe,5|9|0x99ccfe,10|15|0xffffff,14|15|0x99ccfe,53|33|0x99ccfe,56|33|0xffffff,56|29|0x99ccfe,60|34|0x99ccfe", 90, 611, 225, 744, 460,'更新不可点击'}

douyin = {'douyin_6.png',11, 118, 484, 563,30000000}
pinduoduo = {'pinduoduo.png',11, 118, 484, 563,30000000}
daju = {'daju_6.png',11, 118, 484, 563,30000000}
suning = {'suning_6.png',11, 118, 484, 563,30000000}

connectStoreFail = {0x999999, "-3|0|0xffffff,32|0|0x999999,32|13|0xffffff,32|17|0x999999,284|4|0x999999,284|9|0xffffff,284|14|0x999999,474|10|0x999999,479|13|0xffffff", 90, 57, 437, 695, 801,'无法连接到appstore'}
meunBtn = {0x007aff, "4|0|0xf9f9f9,7|0|0x007aff,1|11|0x007aff,5|11|0xf9f9f9,7|11|0x007aff,1|21|0x007aff,5|22|0xf9f9f9,7|22|0x007aff,39|22|0x007aff", 90, 534, 20, 747, 136,'商店菜单'}

needLoginOld = { 0x000000, "0|2|0xf8f7f6,9|2|0x000000,16|4|0x000000,16|8|0x000000,73|24|0x000000,78|24|0xf8f8f7,78|27|0x000000,122|16|0x000000,125|26|0x000000", 90, 95, 234, 659, 679,'需要登录'}
needLogNew = {0x000000, "0|3|0xedeaeb,3|3|0x000000,14|1|0x000000,17|3|0xf2f0f0,18|5|0x000000,71|3|0x000000,71|6|0xf8f7f5,71|9|0x000000,263|23|0x000000", 90, 120, 243, 631, 536,'登陆itunes store'}

blueDown = {0x1a73e8, "27|-2|0x1a73e8,95|-24|0x1a73e8,135|9|0x1a73e8,77|29|0x1a73e8,125|25|0x1a73e8", 90, 23, 1136, 749, 1330,'蓝色下载'}
redDown = {0xf23f3f, "0|2|0xffffff,-7|14|0xf23d3d,-9|17|0xffffff,-9|20|0xf13d3d,2|27|0xffffff,2|30|0xf03838,12|16|0xffffff,15|16|0xf03838,22|13|0xf03838", 90, 644, 359, 748, 754,'红色下载'}
fangqi = {0xffcd2f, "84|10|0xffcd2f,138|-7|0x000000,196|-7|0x0e0b02,200|-7|0xffcd2f,249|4|0x000000,249|8|0xffcd2f,252|12|0x000000,338|17|0xffcd2f,382|23|0xffcd2f", 90, 132, 733, 630, 963,'残忍放弃'}
fangqiNew = { 0xf2c32c, "5|0|0x000000,14|5|0xffcd2f,13|8|0x000000,47|6|0x050401,52|6|0xffcd2f,56|6|0x040301,144|3|0x171304,144|5|0xf4c42c,144|9|0x080601", 90, 130, 730, 729, 1112,'残忍放弃'}
gotoAppStore = {0x303030, "0|5|0xf5f5f5,0|17|0x303030,-6|39|0x303030,-14|39|0xf5f5f5,-18|41|0x303030,-20|86|0x303030,-11|92|0xf5f5f5,-5|92|0x303030,-3|239|0x303030", 90, 20, 233, 149, 1109,'前往app领取'}

backBtnNew = {0x000000, "2|2|0xf9f9f9,4|6|0x000000,-4|7|0xf1f1f1,-6|7|0x000000,0|11|0xf9f9f9,0|15|0x000000,2|13|0xf9f9f9,4|14|0x111111,11|12|0x000000", 90, 5, 0, 77, 45,'返回'}
lushiGet = {0xf1f964, "0|-2|0x2b1510,1|8|0xf1f964,4|5|0xf1f964,7|5|0x2b1510,-4|5|0xf1f964,-6|5|0x2b1510,0|-5|0xf1f964,-1|-4|0x2b1510,41|-5|0xf1f964", 90, 615, 570, 742, 675,'炉石传说'}
xiechengGet = { 0x030a14, "0|-1|0xd7f4ff,0|6|0x030a14,4|5|0x030a14,6|5|0xd7f4ff,-5|5|0x030a14,-6|5|0xd7f4ff,-1|10|0xd7f4ff,-1|9|0x030a14,4|9|0xd7f4ff", 90, 615, 558, 739, 648,'携程获取'}
goStoreDown = { 0x313131, "4|0|0xf5f5f5,9|-1|0x303030,12|0|0xf5f5f5,12|2|0x323232,52|13|0x313131,53|15|0xf5f5f5,57|15|0x303030,140|2|0x313131,143|21|0x383838", 90, 102, 1224, 735, 1330,'前往app下载'}


local InterfaceFunc = {}

function InterfaceFunc: clickGuanggao(bid,isClickAppAdToStore)
	toast('点击激励广告')
	local endTime = os.time() + 300
	local isClickad = false
	local indexN = 0
	local newBid = nil
	while endTime > os.time() do
		if g_pictureInterfase.findCloud() or g_pictureInterfase.findGetBtn() or g_pictureInterfase.findInstallBtn() then
			return 5011
		elseif g_pictureInterfase.findOpenOrUpdate() then
			if f_tu(douyin) then
				newBid = "com.ss.iphone.ugc.Aweme"
			elseif f_tu(pinduoduo) then
				newBid = "com.xunmeng.pinduoduo"
				toast('拼多多')
			elseif f_tu(daju) then
				newBid = "com.mntech.pocketsniper"
			elseif f_tu(suning) then
				newBid = "SuningEMall"
			else 
				snapshot("weizhi_" .. indexN ..".png", 20, 151, 235, 360);
				indexN = indexN + 1
				return 5011
			end
			return 5011,newBid
		elseif f_pic(downLoading) or f_pic(notDownDone) then
			return 5011
		elseif f_pic(lushiGet) or f_pic(xiechengGet) then
			return 5011
		elseif f_pic(cancle) or f_pic(meunBtn) or f_pic(backBtnNew) then
			isClickad = false
			delay(3)
			toast('正在跳转appstore')
		elseif c_tu(homeBtn) then
			toast('点击HomeBtn')
			mSleep(3000)
		elseif f_tu(feiji) then
			-- click(math.random(340,590),math.random(1010,1116))
			click(math.random(80,270),math.random(830,1340))
			mSleep(2000)
			if not f_tu(feiji) then
				isClickad = true
			end
		elseif not isClickAppAdToStore and isClickad and not f_tu(feiji) and not f_tu(homeBtn) then
			toast('只看广告')
			-- 只看广告
			delay(40)
			return 5010
		elseif c_pic(blueDown) or c_pic(redDown) or c_pic(fangqi) or c_pic(fangqiNew) then
			mSleep(1000)
		elseif c_pic(gotoAppStore) or c_pic(goStoreDown) then
			mSleep(1000)
		elseif isClickad and not f_tu(feiji) then
			toast('开始点击广告')
			if not isClickAppAdToStore then
				toast('只看广告')
				-- 只看广告
				delay(40)
				return 5010
			end
			-- local orient = getDeviceOrient()
			-- if orient.app ~= 0 then
			-- 	toast('调整屏幕方向')
			-- 	setDeviceOrient(0)
			-- end
			if indexN % 3 == 0 then
				click(math.random(34,721),math.random(1295,1330))
			elseif indexN % 3 == 1 then
				click(math.random(172,674),math.random(478,898))
			else
				click(math.random(274,504),math.random(606,966))
			end
			mSleep(5000)
			indexN = indexN + 1
						
		else 
			delay(3)
		end
	end
	return 5005
end
function InterfaceFunc: clickKaipingGuanggao(bid)
	toast('点击开屏广告')
	local endTime = os.time() + 300
	local newBid = nil
	local indexN = 0
	while endTime > os.time() do
		if g_pictureInterfase.findCloud() or g_pictureInterfase.findGetBtn() or g_pictureInterfase.findInstallBtn() then
			return 5007
		elseif g_pictureInterfase.findOpenOrUpdate() then
			if f_tu(douyin) then
				newBid = "com.ss.iphone.ugc.Aweme"
			elseif f_tu(pinduoduo) then
				newBid = "com.xunmeng.pinduoduo"
			elseif f_tu(daju) then
				newBid = "com.mntech.pocketsniper"
			elseif f_tu(suning) then
				newBid = "SuningEMall"
			else 
				snapshot("weizhi_" .. indexN ..".png", 20, 151, 235, 360);
				indexN = indexN + 1
				return 5007
			end
			return 5007,newBid
		elseif f_pic(gengxinNull) then
			
			return 5007
		elseif f_pic(lushiGet) or f_pic(xiechengGet) then
			return 5007
		elseif f_pic(downLoading) or f_pic(notDownDone) then
			return 5007
		elseif f_pic(connectStoreFail) then
			c_pic(cancle)
			mSleep(1000)
		elseif f_pic(cancle) or f_pic(meunBtn) or f_pic(backBtnNew) then
			delay(3)
			toast('正在跳转appstore')
		elseif f_tu(feiji) then
			toast('开始游戏')
			delay(5)
			if f_tu(feiji) then
				return 5005
			end
		elseif c_pic(gotoAppStore) or c_pic(goStoreDown) then
			mSleep(1000)
		else 
			if indexN % 2 == 0 then
				click(math.random(80,650),math.random(360,800))
			else
				click(math.random(7,130),math.random(346,953))
			end
			mSleep(5000)
			indexN = indexN + 1

		end
	end
	return 5005
end


return InterfaceFunc