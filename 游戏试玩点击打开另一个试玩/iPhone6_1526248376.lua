local g_pictureInterfase = require("iPhone6")
douyin = {'douyin_6.png',11, 118, 484, 563,30000000}
pinduoduo = {'pinduoduo.png',11, 118, 484, 563,30000000}
daju = {'daju_6.png',11, 118, 484, 563,30000000}
suning = {'suning_6.png',11, 118, 484, 563,30000000}

gengxinNull = {0x99ccfe, "0|4|0xffffff,0|7|0x99ccfe,5|9|0x99ccfe,10|15|0xffffff,14|15|0x99ccfe,53|33|0x99ccfe,56|33|0xffffff,56|29|0x99ccfe,60|34|0x99ccfe", 90, 611, 225, 744, 460,'更新不可点击'}
lushiGet = {0xf1f964, "0|-2|0x2b1510,1|8|0xf1f964,4|5|0xf1f964,7|5|0x2b1510,-4|5|0xf1f964,-6|5|0x2b1510,0|-5|0xf1f964,-1|-4|0x2b1510,41|-5|0xf1f964", 90, 615, 570, 742, 675,'炉石传说'}
xiechengGet = { 0x030a14, "0|-1|0xd7f4ff,0|6|0x030a14,4|5|0x030a14,6|5|0xd7f4ff,-5|5|0x030a14,-6|5|0xd7f4ff,-1|10|0xd7f4ff,-1|9|0x030a14,4|9|0xd7f4ff", 90, 615, 558, 739, 648,'携程获取'}
cancle = {0x007aff, "-4|0|0xf9f9f9,6|7|0x208afe,6|13|0xf9f9f9,6|15|0x007aff,37|2|0x027bff,37|6|0xf9f9f9,37|11|0x007aff,55|27|0x007aff,52|28|0xf9f9f9", 90, 12, 16, 148, 123,'取消'}
neeoLog = {0x000000, "0|2|0xc6c6c6,17|0|0x000000,17|2|0xc6c6c6,17|4|0x000000,103|17|0x000000,102|20|0xc6c6c6,102|24|0x000000,121|16|0x000000,124|25|0x000000", 90, 258, 278, 506, 419,'重新登陆'}
meunBtn = {0x007aff, "4|0|0xf9f9f9,7|0|0x007aff,1|11|0x007aff,5|11|0xf9f9f9,7|11|0x007aff,1|21|0x007aff,5|22|0xf9f9f9,7|22|0x007aff,39|22|0x007aff", 90, 534, 20, 747, 136,'商店菜单'}
notDownDone = {0x0080fc, "-1|0|0xffffff,-1|-1|0x0381fc,-1|2|0xffffff,0|2|0x0080fc,-9|0|0x0080fc,-15|3|0x0080fc,0|5|0xffffff,0|27|0x0080fc,0|36|0xffffff", 90, 645, 239, 745, 402,'未下载完成'}
downLoading = {0x0281fc, "15|4|0x0080fc,15|7|0xffffff,15|45|0x0080fc,0|47|0xffffff,0|49|0x0381fc,-21|37|0x0080fc,-24|25|0x0281fc,-8|25|0xffffff,1|25|0x0080fc", 90, 635, 270, 749, 410,'正在下载'}
connectStoreFail = {0x999999, "-3|0|0xffffff,32|0|0x999999,32|13|0xffffff,32|17|0x999999,284|4|0x999999,284|9|0xffffff,284|14|0x999999,474|10|0x999999,479|13|0xffffff", 90, 57, 437, 695, 801,'无法连接到appstore'}




startBtn = { 0xa357c8, "-67|31|0xa357c8,-91|71|0x791da6,-84|126|0x791da6,-85|194|0xf486d8,119|175|0xffa5fe,116|135|0x791da6,174|92|0xf688dc,121|-37|0xff9afe,98|5|0xa357c8", 90, 184, 693, 587, 1064,'开始按钮'}
nextBtn = {0xffffff, "0|3|0x0ba0ee,7|-16|0x09aff2,16|-16|0xffffff,19|-23|0x07b5f4,26|-23|0xffffff,31|-23|0x07b5f4,102|-1|0xffffff,102|4|0x0ba1ee,117|-33|0x06bef6", 90, 229, 793, 531, 962,'nextBtn'}
playBtn = {0x05c2f7, "0|8|0xf4f8ff,0|15|0x07b6f4,13|20|0xf4f8ff,17|21|0x08b1f3,54|36|0xf4f8ff,59|36|0x0ba6ef,71|20|0x08b3f3,71|30|0xf4f8ff,87|30|0x09abf1", 90, 215, 736, 559, 930,'play'}
oneGuan = {0x00c1f4, "4|0|0xffffff,10|0|0x12aef1,6|8|0xffffff,3|8|0x06a9ef,9|8|0x079fed,6|14|0xffffff,6|19|0x0094ec,6|24|0x00caf7,19|6|0x099fee", 90, 221, 837, 516, 1213,'第一关'}
twoGuan = {0x1bc7f5, "5|-2|0xffffff,8|1|0x0aadf0,11|-2|0xffffff,16|-2|0x00a0ef,8|5|0xffffff,11|7|0x0099ee,12|10|0xffffff,16|10|0x0097ed,-2|10|0x0ab0f2", 90, 188, 840, 484, 1213,'第二关'}
hua = {0xed207b, "3|4|0xf16192,16|-6|0xe41772,16|3|0xef6296,25|5|0xe41772,25|9|0xe74a7b,36|11|0xe41772,17|43|0xec1f7a,12|21|0xffe948,12|17|0xffe946", 90, 554, 614, 700, 815,'花'}
playNew = {0x05c2f7, "47|-2|0x05c4f8,106|-1|0x05c4f7,102|39|0x0ba4ef,48|56|0x0e96eb,126|67|0x0679f4,-16|70|0x0471f9,70|21|0x08b2f3,70|28|0xf4f8ff,32|22|0xf4f8ff", 90, 208, 709, 542, 945,'playBtn'}

mofabang = {0x05c2f7, "1|8|0xfae641,15|8|0x06baf5,0|30|0xf9b406,0|37|0x0c9ded,9|28|0xca1f0d,9|35|0x0b9ae6,23|41|0xe01c9f,25|42|0x0d99ec,18|43|0xb90377", 90, 188, 1159, 733, 1326,'魔法棒'}
jiahao = {0xffffff, "0|-3|0xe6f84f,6|7|0xffffff,11|7|0x7bda1d,0|14|0xffffff,0|16|0x45b516,-8|7|0xffffff,-13|7|0x7fde1e,0|7|0xfdfdfd,17|7|0x7cdb1e", 90, 192, 1163, 735, 1328,'加号'}
fangqiNew = { 0xf2c32c, "5|0|0x000000,14|5|0xffcd2f,13|8|0x000000,47|6|0x050401,52|6|0xffcd2f,56|6|0x040301,144|3|0x171304,144|5|0xf4c42c,144|9|0x080601", 90, 130, 730, 729, 1112,'残忍放弃'}
gotoAppStore = {0x303030, "0|5|0xf5f5f5,0|17|0x303030,-6|39|0x303030,-14|39|0xf5f5f5,-18|41|0x303030,-20|86|0x303030,-11|92|0xf5f5f5,-5|92|0x303030,-3|239|0x303030", 90, 20, 233, 149, 1109,'前往app领取'}
redBtn = {0xf23f3f, "0|4|0xffffff,-12|17|0xf23e3e,-7|17|0xffffff,11|17|0xffffff,15|17|0xf03838,1|26|0xffffff,1|30|0xf03838,-6|36|0xf03939,24|25|0xef3535", 90, 642, 956, 747, 1300,'红色下载'}
shou = {0xd59687, "0|4|0xcf7659,-5|34|0xe2bfa7,-3|37|0xca6c4d,1|39|0xe2a78b,1|46|0xc9694a,22|53|0xd78664,46|53|0xf9dbca,44|33|0xf9dbca,34|26|0xeab39b", 90, 48, 331, 705, 910,'引导'}

hongbao = {0xeacd9a, "1|3|0x333333,1|7|0xeacd9a,1|11|0x333333,2|14|0xe3c796,28|27|0x333333,33|27|0xeacd9a,31|51|0x333333,27|51|0xeacd9a,23|51|0x333333", 90, 213, 758, 566, 1082,'红包'}
lingqu  ={0xffffff, "7|0|0xf35542,14|-1|0xffffff,12|25|0xffffff,12|29|0xf35845,165|19|0xfffaf9,168|19|0xf35542,205|16|0xf46250,204|23|0xfffcfc,209|23|0xf35542", 90, 116, 754, 671, 965,'前往app领取'}

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
		
		elseif f_pic(lushiGet) or f_pic(xiechengGet) then
			return 5011
		elseif f_pic(cancle) or f_pic(meunBtn) then
			isClickad = false
			delay(3)
			toast('正在跳转appstore')
		elseif f_pic(shou) then
			t = shou
			local x, y = findMultiColorInRegionFuzzy(t[1],t[2],t[3],t[4],t[5],t[6],t[7])
			movexy(x,y,x,y+60)
		elseif f_pic(mofabang) or f_pic(jiahao) then
			toast('开始点击广告')
			mSleep(2000)
			local xs = 670
			local ys = 1250
			click(xs,ys)
			mSleep(3000)
			if not f_pic(mofabang) and not f_pic(jiahao) then 
				isClickad = true
				mSleep(3000)
			end
		elseif c_pic(startBtn) or c_pic(oneGuan) or c_pic(twoGuan) then
			mSleep(2000)
		elseif c_pic(playBtn) or c_pic(nextBtn) or c_pic(playNew) then
			mSleep(2000)
		elseif f_pic(hua) then
			click(378,1093)
			mSleep(1000)
		elseif isClickad and not f_pic(mofabang) and not f_pic(jiahao) then
			toast('开始点击广告')
			if not isClickAppAdToStore then
				toast('只看广告')
				-- 只看广告
				delay(40)
				return 5010
			elseif c_pic(gotoAppStore) or c_pic(fangqiNew) or c_pic(redBtn) then
				mSleep(1000)
			elseif c_pic(hongbao) or c_pic(lingqu) then
				mSleep(1000)
			else
				if indexN % 3 == 0 then
					click(math.random(38,740),math.random(1160,1305))
				elseif indexN % 3 == 1 then
					click(math.random(172,674),math.random(478,898))
				else
					click(math.random(274,504),math.random(606,966))
				end
				mSleep(5000)
				indexN = indexN + 1
			end
			
						
		else 
			toast('什么也没找到')
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
		elseif f_pic(cancle) or f_pic(meunBtn) then
			delay(3)
			toast('正在跳转appstore')
		elseif c_pic(gotoAppStore) then
			mSleep(1000)
		elseif c_pic(hongbao) or c_pic(lingqu) then
			mSleep(1000)
		elseif f_pic(startBtn) then
			toast('开始游戏')
			delay(5)
			if f_pic(startBtn) then
				return 5005
			end
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