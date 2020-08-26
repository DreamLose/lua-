local g_pictureInterfase = require("iPhone6")

startBtn = {0x0350ff, "4|-1|0xffffff,20|6|0x004eff,24|13|0xffffff,29|17|0x004eff,86|1|0xffffff,86|6|0x004eff,153|2|0xffffff,155|4|0x004eff,154|14|0xffffff", 90, 172, 844, 643, 1142,'开始游戏'}
startBtnNew = {0x0350ff, "4|0|0xffffff,29|0|0xffffff,31|5|0x004eff,62|1|0xfcfdff,66|1|0x024fff,155|2|0xfefeff,155|5|0x0350ff,156|14|0xfeffff,160|14|0x004eff", 90, 175, 890, 646, 1113,'开始新'}
backBtn = {0x0350ff, "4|-1|0xffffff,20|6|0x004eff,24|13|0xffffff,29|17|0x004eff,86|1|0xffffff,86|6|0x004eff,153|2|0xffffff,155|4|0x004eff,154|14|0xffffff", 90, 172, 844, 643, 1142,'返回'}
backBtnNew = {0x16b821, "1|49|0x16b821,29|21|0x16b821,-28|28|0x16b821,-6|26|0xffffff,26|43|0xfcfefc,22|52|0x16b821,41|43|0xfdfefd,44|44|0x16b821", 90, 16, 0, 154, 144,'新'}
jinbi = {0xffc53c, "0|3|0xffa402,0|9|0xffee3c,2|15|0xffd700,2|19|0xfff883,0|24|0xfed100,1|29|0xffea28,9|29|0xffad00,16|29|0xffeb73,20|27|0xc56506", 90, 630, 22, 739, 110,'金币'}
fuhuonew ={ 0xf4bf5f, "143|18|0xf4a924,84|43|0xf7c264,-7|56|0xf4a924,-88|48|0xf4aa27,-84|47|0xffffff,-76|47|0xf4a924", 90, 184, 910, 635, 1087,'复活新'}
fuhuo = {0xfeb635, "0|5|0xfffefd,16|22|0xffffff,23|22|0xfeb025,99|25|0xfffefb,102|25|0xfeb533,104|25|0xffffff,242|34|0xffffff,247|34|0xfeb025,274|4|0xfeb025", 90, 160, 885, 638, 1086,'复活'}
wujiaox = {0xff6600, "0|-2|0xffffff,-8|7|0xff6600,-11|7|0xffffff,8|7|0xff6600,11|7|0xffffff,-5|17|0xff6600,0|17|0xffffff,0|14|0xff6600,5|17|0xff6600", 90, 319, 700, 512, 968,'五角星'}
cancle = {0x007aff, "-4|0|0xf9f9f9,6|7|0x208afe,6|13|0xf9f9f9,6|15|0x007aff,37|2|0x027bff,37|6|0xf9f9f9,37|11|0x007aff,55|27|0x007aff,52|28|0xf9f9f9", 90, 12, 16, 148, 123,'取消'}
neeoLog = {0x000000, "0|2|0xc6c6c6,17|0|0x000000,17|2|0xc6c6c6,17|4|0x000000,103|17|0x000000,102|20|0xc6c6c6,102|24|0x000000,121|16|0x000000,124|25|0x000000", 90, 258, 278, 506, 419,'重新登陆'}
downDone = {0x0080fc, "-1|0|0x0080fc,-2|0|0x0080fc,-3|0|0x0080fc,-4|0|0x0080fc,-4|5|0xffffff,-2|-1|0x0080fc,-3|2|0x0080fc,-3|4|0xffffff,-4|0|0x0080fc", 90, 654, 284, 733, 383,'下载完成,未安装'}
-- downDonePic={'downDone_6.png',547, 108, 739, 517,30000000}
xiaoxiao = {'xiaoxiaole.png',547, 108, 739, 517,30000000}
xiaoxiaoleGet = {0xf3fdfe, "0|-2|0x0050c3,0|5|0xf3fdfe,6|5|0x0050c3,-5|4|0xf3fdfe,-7|4|0x0050c3,0|9|0xf3fdfe,0|12|0x0050c3,7|9|0x0050c3,69|24|0x0050c3", 90, 591, 546, 747, 683,'消消乐获取'}
doneBtn = {0x007aff, "0|-3|0xfafafa,2|4|0x007aff,2|9|0xfafafa,2|11|0x007aff,16|18|0x007aff,16|26|0x007aff,48|2|0x007aff,46|4|0xfafafa,46|6|0x007aff", 90, 7, 12, 123, 140,'完成'}
comment = { 0x666666, "7|4|0xffffff,7|6|0x666666,6|14|0xffffff,14|14|0x666666,17|20|0xffffff,17|22|0x666666,11|31|0x696969,16|34|0x666666,21|30|0x666666", 90, 248, 890, 459, 1033,'评论'}
notDownDone = {0x0080fc, "-1|0|0xffffff,-1|-1|0x0381fc,-1|2|0xffffff,0|2|0x0080fc,-9|0|0x0080fc,-15|3|0x0080fc,0|5|0xffffff,0|27|0x0080fc,0|36|0xffffff", 90, 645, 239, 745, 402,'未下载完成'}
downLoading = {0x0281fc, "15|4|0x0080fc,15|7|0xffffff,15|45|0x0080fc,0|47|0xffffff,0|49|0x0381fc,-21|37|0x0080fc,-24|25|0x0281fc,-8|25|0xffffff,1|25|0x0080fc", 90, 635, 270, 749, 410,'正在下载'}
gengxinNull = {0x99ccfe, "0|4|0xffffff,0|7|0x99ccfe,5|9|0x99ccfe,10|15|0xffffff,14|15|0x99ccfe,53|33|0x99ccfe,56|33|0xffffff,56|29|0x99ccfe,60|34|0x99ccfe", 90, 611, 225, 744, 460,'更新不可点击'}
shuaishi = {'shuaishi_6.png',11, 118, 484, 563,30000000}
mosheng = {'mosheng_6.png',11, 118, 484, 563,30000000}
buyu = {'buyu_6.png',11, 118, 484, 563,30000000}
shediao = {'shediao_6.png',28,415,741,942,30000000}

douyin = {'douyin_6.png',11, 118, 484, 563,30000000}
pinduoduo = {'pinduoduo.png',11, 118, 484, 563,30000000}
daju = {'daju_6.png',11, 118, 484, 563,30000000}
suning = {'suning_6.png',11, 118, 484, 563,30000000}
jinbitu = {'jinbi_6.png',627,14,740,180,30000000}
shediaoTitle = {0x000000, "0|-2|0xf7f7f7,8|3|0x000000,8|11|0x000000,10|11|0xffffff,15|11|0x000000,193|4|0x000000,193|8|0xffffff,193|11|0x000000,191|28|0x000000", 90, 239, 42, 520, 118,'射雕title'}
fankui = {0x50525a, "0|5|0xffffff,0|7|0x50525a,2|13|0xffffff,2|18|0x52545c,22|7|0x56575f,20|10|0x5a5c64,32|16|0x53555d,35|16|0xffffff,35|20|0x55565e", 90, 649, 48, 746, 111,'反馈'}
guanbi = {0x222222, "0|-7|0xffffff,-7|-7|0x222222,-7|0|0xffffff,-7|6|0x222222,2|6|0xffffff,6|6|0x222222,6|0|0xffffff,11|-12|0x222222,12|12|0x222222", 90, 5, 33, 737, 118,'关闭'}
fankuiNew = {0x50525a, "-7|4|0xffffff,-10|4|0x52545c,1|14|0xfefefe,1|17|0x50525a,31|14|0x51535b,34|16|0xffffff,37|17|0x63646b,37|19|0xfefefe,37|21|0x56575f", 90, 638, 44, 747, 124,'反馈新'}

--  消消乐找图
guodong = {0xde4c1c, "0|8|0xffffff,0|15|0xde4c1c,65|50|0xde4c1c,69|69|0xde4d1c,101|13|0xde4c1c,101|21|0xededed,101|36|0xfca613,533|-29|0xdf511e,539|17|0xde4c1c", 90, 69, 157, 668, 478,'果冻消消乐'}
fristGuan = {0x27e013, "17|2|0x0bc910,17|10|0x101010,14|27|0x111111,8|27|0x0ac215,21|27|0x1c1c1c,25|27|0x04b022,25|38|0x02a829,45|26|0x00a42e,51|26|0xffffff", 90, 113, 844, 550, 1294,'第一关'}
playBtn = {0x5ce432, "23|-19|0xffffff,29|-13|0x7ef040,38|-13|0xffffff,52|-8|0xffffff,60|-8|0x78ef3e,76|-8|0xffffff,96|4|0x59e030,109|4|0xffffff,109|-4|0x6cea35", 90, 206, 706, 554, 1011,'play'}
nextBtn = {0x72ed3b, "11|1|0xffffff,37|2|0x77ee3d,49|2|0xffffff,70|3|0xffffff,79|3|0x7cf03f,126|2|0xffffff,131|-2|0x85f142,201|-5|0xffffff,208|-5|0x81f041", 90, 145, 801, 619, 1057,'next'}
setting = {0xffc243, "9|0|0xffffff,18|2|0xffc449,23|9|0xffffff,30|14|0xffc448,30|25|0xffffff,30|33|0xffc449,-17|34|0xffc448,-7|39|0xffffff,11|27|0xffc448", 90, 566, 5, 749, 185,'设置'}
downBtn = {0x00becc, "96|-14|0xffffff,96|-10|0x00becc,96|-5|0xffffff,144|-14|0xffffff,144|-9|0x00becc,162|-1|0xffffff,163|3|0x00becc,164|6|0xffffff,282|-8|0x00becc", 90, 28, 1141, 730, 1320,'下载观看'}
downBtnNew = {0xf23f3f, "0|5|0xffffff,-10|15|0xf23e3e,-10|18|0xffffff,-10|23|0xf13c3c,9|15|0xf03a3a,9|18|0xffffff,9|23|0xf03838,0|28|0xffffff,0|32|0xf03838", 90, 642, 984, 742, 1270,'下载'}
downBtn1 = {0x007aff, "0|3|0xffffff,0|7|0x007aff,35|8|0xffffff,38|8|0x007aff,42|10|0xfcfdff,84|12|0x007aff,84|14|0xffffff,88|26|0xd3e8ff,88|29|0x007aff", 90, 548, 1122, 728, 1302,'下载观看'}
downBtn2 = {0x007aff, "3|2|0xffffff,6|7|0x007aff,6|10|0xffffff,55|2|0xffffff,55|7|0x007aff,74|14|0xffffff,74|19|0x007aff,76|21|0xffffff,124|9|0x007aff", 90, 486, 1106, 732, 1317,'下载观看'}
daoju = {0xeb3f31, "7|0|0xffe2c9,12|1|0xf73021,23|2|0xfffded,26|2|0xf83a2b,35|11|0xfdefce,35|21|0xef3023,34|25|0xac0706,23|27|0xa90302,23|34|0x39bca7", 90, 92, 1045, 682, 1276,'道具'}
fristGuan1 = {0x11cf0e, "4|-3|0x121212,9|-5|0x101010,9|-9|0x0bc711,9|7|0x101010,13|10|0x06b81e,12|14|0x111111,12|20|0x04af24,3|15|0x121212,0|15|0x09c017", 90, 97, 885, 452, 1304,'第一关new'}
downNewBtn = { 0xf2c32c, "5|0|0x000000,14|5|0xffcd2f,13|8|0x000000,47|6|0x050401,52|6|0xffcd2f,56|6|0x040301,144|3|0x171304,144|5|0xf4c42c,144|9|0x080601", 90, 130, 730, 729, 1112,'残忍放弃'}
hongbao = { 0xebcd9a, "0|4|0x3a3b3b,0|9|0xebcd9a,0|14|0x3a3b3b,34|4|0x3a3b3b,34|10|0xebcd9a,34|14|0x3a3b3b,15|37|0x3a3b3b,15|45|0xe4c896,15|48|0x3a3b3b", 90, 203, 595, 530, 875,'红包'}
tixian = { 0xd85a41, "0|3|0xf9d8a2,7|3|0xd85940,12|3|0xfadda6,42|4|0xfadea6,65|7|0xfadda5,65|14|0xd85940,65|20|0xfadea6,178|19|0xfbe0a8,178|23|0xd85940", 90, 133, 577, 677, 872,'提现'}
guanka = {0x13d10e, "-5|0|0xffffff,24|-23|0x17d50e,24|-27|0xf5f6f0,55|-12|0x02aa27,62|-12|0xffffff,45|19|0x01a52b,45|25|0x1bca47,45|28|0x057f16,45|35|0xffffff", 90, 32, 258, 748, 1258,'关口'}
bluebtn = {0x4a90e2, "5|11|0x4a90e2,61|-4|0x4a90e2,110|-7|0x4a90e2,153|24|0x4a90e2,189|56|0x4a90e2,214|67|0x4a90e2", 90, 48, 388, 728, 1148,'蓝色提示'}
bluebtnNew = {0x118bff, "45|-12|0x118bff,243|-3|0x118bff,412|-9|0x118bff,445|-18|0x118bff,443|15|0x118bff", 90, 47, 1122, 714, 1298,'蓝色按钮'}
connectStoreFail = {0x999999, "-3|0|0xffffff,32|0|0x999999,32|13|0xffffff,32|17|0x999999,284|4|0x999999,284|9|0xffffff,284|14|0x999999,474|10|0x999999,479|13|0xffffff", 90, 57, 437, 695, 801,'无法连接到appstore'}
meunBtn = {0x007aff, "4|0|0xf9f9f9,7|0|0x007aff,1|11|0x007aff,5|11|0xf9f9f9,7|11|0x007aff,1|21|0x007aff,5|22|0xf9f9f9,7|22|0x007aff,39|22|0x007aff", 90, 534, 20, 747, 136,'商店菜单'}
guankaikuan = {0xf79608, "-62|124|0x93c643,-46|124|0xfff0a2,574|179|0xfff0a2,581|179|0x588b1d,314|713|0xffeea9,306|727|0x569115,508|612|0xffeea8,539|611|0x6fa424,482|655|0xffeea8", 90, 68, 280, 688, 1210,'关卡框'}
goStoreDown = { 0x313131, "4|0|0xf5f5f5,9|-1|0x303030,12|0|0xf5f5f5,12|2|0x323232,52|13|0x313131,53|15|0xf5f5f5,57|15|0x303030,140|2|0x313131,143|21|0x383838", 90, 102, 1224, 735, 1330,'前往app下载'}
needLoginOld = { 0x000000, "0|2|0xf8f7f6,9|2|0x000000,16|4|0x000000,16|8|0x000000,73|24|0x000000,78|24|0xf8f8f7,78|27|0x000000,122|16|0x000000,125|26|0x000000", 90, 95, 234, 659, 679,'需要登录'}
needLogNew = {0x000000, "0|3|0xedeaeb,3|3|0x000000,14|1|0x000000,17|3|0xf2f0f0,18|5|0x000000,71|3|0x000000,71|6|0xf8f7f5,71|9|0x000000,263|23|0x000000", 90, 120, 243, 631, 536,'登陆itunes store'}
backBtnNew = {0x000000, "2|2|0xf9f9f9,4|6|0x000000,-4|7|0xf1f1f1,-6|7|0x000000,0|11|0xf9f9f9,0|15|0x000000,2|13|0xf9f9f9,4|14|0x111111,11|12|0x000000", 90, 5, 0, 77, 45,'返回'}
lushiGet = {0xf1f964, "0|-2|0x2b1510,1|8|0xf1f964,4|5|0xf1f964,7|5|0x2b1510,-4|5|0xf1f964,-6|5|0x2b1510,0|-5|0xf1f964,-1|-4|0x2b1510,41|-5|0xf1f964", 90, 615, 570, 742, 675,'炉石传说'}
xiechengGet = { 0x030a14, "0|-1|0xd7f4ff,0|6|0x030a14,4|5|0x030a14,6|5|0xd7f4ff,-5|5|0x030a14,-6|5|0xd7f4ff,-1|10|0xd7f4ff,-1|9|0x030a14,4|9|0xd7f4ff", 90, 615, 558, 739, 648,'携程获取'}


guanbiJin = {0xffffff, "0|-9|0x96cbf3,-10|-7|0xffffff,-10|3|0x96cbf3,-7|12|0xffffff,0|14|0x96cbf3,10|14|0xffffff,12|3|0x96cbf3,10|-8|0xffffff,17|-8|0x96cbf3", 90, 568, 262, 688, 429,'X'}
fanhuiBtn = {0xfffefd, "0|2|0xfeb32d,0|5|0xffffff,16|4|0xfffcf8,16|9|0xfeb025,16|13|0xfffffe,43|-2|0xfffefb,43|3|0xfeb025,43|12|0xfeb025,43|15|0xfffbf5", 90, 234, 582, 517, 821,'返回游戏'}
sureBtn = {0xffffff, "-4|0|0x0f59ff,12|0|0xffffff,12|4|0x0350ff,80|12|0xffffff,80|18|0x004eff,82|24|0xffffff,82|33|0x004eff,88|37|0xffffff,91|37|0x004eff", 90, 191, 890, 586, 1079,'确定'}

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
			return 5011,newBid
		elseif f_tu(xiaoxiao) or f_pic(xiaoxiaoleGet) then
			return 5010
		elseif f_pic(lushiGet) or f_pic(xiechengGet) then
			return 5010
		elseif f_pic(doneBtn) or f_pic(fankui) or f_pic(guanbi) then
			delay(5)
			return 5010
		elseif f_pic(cancle) or f_pic(meunBtn) or f_pic(backBtnNew) then
			isClickad = false
			delay(3)
			toast('正在跳转appstore')
		elseif f_pic(fuhuo) or f_pic(fuhuonew) then
			local xs = math.random(310,470)
			local ys = math.random(980,1020)
			toast('点击坐标为:(' .. xs .. "," .. ys ..")" )
			writeASOLog("点击坐标为:(" .. xs .. "," .. ys ..")")
			click(xs,ys)
			delay(3)
			toast('点击了复活')
			isClickad = true
		elseif f_pic(wujiaox) or f_pic(m.comment) then
			if not isClickAppAdToStore then
				toast('只看广告')
				-- 只看广告
				delay(40)
				return 5010
			end
			click(330,1214)
			mSleep(1000)
			toast('点击了立即下载')
		elseif c_pic(startBtn) or c_pic(startBtnNew) then
		elseif f_pic(backBtn) or f_pic(jinbi) or f_pic(backBtnNew) then
			local x = math.random(240,500)
			local y = math.random(490,500)
			click(x,y)	
		elseif f_tu(jinbitu) then
			local x = math.random(240,500)
			local y = math.random(490,500)
			click(x,y)	
		elseif not isClickAppAdToStore and isClickad and not f_pic(fuhuo) and not f_pic(fuhuonew) then
			mSleep(2000)
			if not f_pic(guankaikuan) then
				toast('只看广告')
				-- 只看广告
				delay(40)
				return 5010
			end
		elseif f_pic(downNewBtn) then
			click(392,875)
			mSleep(1000)
		elseif c_pic(downBtn) or c_pic(downBtnNew) or c_pic(downBtn1) or c_pic(downBtn2) then
			mSleep(1000)
		elseif c_pic(hongbao) or c_pic(tixian) then
			mSleep(1000)
		elseif c_pic(bluebtn) or c_pic(bluebtnNew) then
			mSleep(1000)
		elseif c_pic(goStoreDown) then
			mSleep(1000)
		elseif c_pic(guanbiJin) or c_pic(fanhuiBtn) or c_pic(sureBtn) then
			mSleep(1000)
		elseif isClickad and not f_pic(fuhuo) and not f_pic(fuhuonew) then
			toast('开始点击广告')
			if not isClickAppAdToStore then
				toast('只看广告')
				-- 只看广告
				delay(40)
				return 5010
			end 
			if indexN % 3 == 0 then
				click(math.random(65,688),math.random(1187,1254))
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
		elseif f_pic(startBtn) or f_pic(startBtnNew) then
			toast('开始游戏')
			return 5005
		elseif c_pic(goStoreDown) then
			mSleep(1000)
		else 
			click(math.random(80,650),math.random(360,800))
			mSleep(1000)
		end
	end
	return 5005
end


return InterfaceFunc