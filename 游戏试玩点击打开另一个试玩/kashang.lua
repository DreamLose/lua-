-- require 'tsp'
--项目名称
ksItemNames = {
    ks_rrd = 'renrendai',
    ks_ppd = 'paipaidai',
    ks_yyw = 'youyuanwang',
    ks_thyc = 'tuhuyangche',
    ks_dy = 'douyin',
    ks_guazi = 'guaziershouche',
    ks_hsv = 'huoshanvideo',
    ks_xgv = 'xiguavideo',
    ks_upLive = 'upLive',
    ks_kuwo = 'kuwo',
    ks_wyx = 'wuyouxing',
    ks_xdjwt = 'xindongjinwutuan',
    ks_sdj = 'shandianjiang',
    ks_mt = 'meituan',
    ks_zjz2 = 'zhongjiezhe2',
    ks_ddpc = 'didapingche',
    ks_dcd = 'dongchedi',
    ks_mtwm = 'meituanwaimai',
    ks_yzb = 'yizhibo',
    ks_jimeng = 'jimeng',
    ks_helloYY = 'helloYY',
    ks_qielvxing = 'qielvxing',
    ks_sifulan  = 'sifulan',
    ks_wmmz = 'weimeimeizhuang',
    ks_cs = 'chushou',
    ks_yuxueyuan = 'yuxueyuan',
    ks_jiuxiuLive = 'jiuxiuLive',
    ks_xiaomiYoupin = 'xiaomiYoupin',
    ks_anneisiren = 'anneisiren',
    ks_lizhiFM = 'lizhiFM',
    ks_mmZB = 'memeZhiBo',
    ks_shansong ='shansong',
    ks_yiku = 'yiku',
    ks_meitu = 'MeiTuMeiZhuang',
    ks_siku = 'siku',
    ks_huoXing = 'HuoXing',
    ks_shuqixiaoshuo = 'shuqixiaoshuo',
    ks_huajiaozhibo = 'huajiaozhibo',
    ks_pahys = 'pinganHaoYiSheng',
    ks_ningmengxiaoshuo = 'ningmengxiaoshuo',
    ks_aiqiyiyuedu = 'aiqiyiyuedu',
    ks_zuiyou = 'zuiyou',
    ks_baobao = 'baobao',
    ks_hujing = 'hujing',
    ks_kkzhibo = 'kkzhibo',
    ks_kuaishou = 'kuaishou',
    ks_hongrenzhibo = 'hongrenzhibo',
    ks_lehaizhibo = 'lehaizhibo',
    ks_xiusezhibo = 'xiusezhibo',
    ks_haixiuzhibo = 'haixiuzhibo',
    ks_zhuishushenqi = 'zhuishushengqi',
    ks_lanrentingshu = 'lanrentingshu',
    ks_kugouzhibo = 'kugouzhibo',
    ks_17kxiaoshuo = '17kxiaoshuo',
    ks_kuaikanyuedu = 'kuaikanyuedu',
    ks_banbanjiaoyou = 'banbanjiaoyou',
    ks_58tongcheng = '58tongcheng',
    ks_qirexiaoshuo = 'qirexiaoshuo',
    ks_xiaoluqinggan = 'xiaoluqinggan',
    ks_langhuaxiaoshuo = 'langhuaxiaoshuo',
    ks_pukegongshe = 'pukegongshe',
    ks_changba = 'changba',
    ks_qimaoxiaoshuo = 'qimaoxiaoshuo',
    ks_duodaxiaoshuo = 'duodaxiaoshuo',
    ks_huajianyingxiang  = 'huajianyingxiang',
    ks_jinritoutiaojs = 'jinritoutiaojs',
    ks_niukouhaowu = 'niukouhaowu',
    ks_laiyifen = 'laiyifen',
    ks_yingyuliulishuo = 'yingyuliulishuo',
    ks_wangyiyanxuan = 'wangyiyanxuan',
    ks_xiaozhuduanzu = 'xiaozhuduanzu',
    ks_mifengzhibo = 'mifengzhibo',
    ks_weilikankan = 'weilikankan',
    ks_tianyancha = 'tianyancha',
    ks_chongya = 'chongya',
    ks_lingmengzhibo = 'lingmengzhibo',
    ks_niceyuyin = 'niceyuyin',
    ks_qingyin = 'qingyin',
    ks_dazhongdianping = 'dazhongdianping',
    ks_dedao = 'dedao',
    ks_tujia = 'tujia',
    ks_qiqizhibo = 'qiqizhibo',
    ks_pipigaoxiao = 'pipigaoxiao',
    ks_qidianzhongwenwang = 'qidianzhongwenwang',
    ks_tujizhibo = 'tujizhibo',
    ks_yingkezhibo = 'yingkezhibo',
    ks_zhangyuekeji = 'zhangyuekeji',
    ks_meiriyujia = 'meiriyujia',
    ks_xiaoshuoyueduba = 'xiaoshuoyueduba',
    ks_boluoqingbao = 'boluoqingbao',
    ks_xiecheng = 'xiecheng',
    ks_youyi = 'youyi',
    ks_xiaoshuodaquan = 'xiaoshuodaquan',
    ks_yangqiyuyin = 'yangqiyuyin',
    ks_dingdangkuaiyao = 'dingdangkuaiyao',
    ks_lieyou = 'lieyou',
    ks_zhihu = 'zhihu',
    ks_zhonganbaoxian = 'zhonganbaoxian',
    ks_xiaolanben = 'xiaolanben',
    ks_gengmei = 'gengmei',
    ks_baiping = 'baiping',
    ks_pipipipi = 'pipipipi',
    ks_huxiu = 'huxiu',
    ks_lieyouwangyu = 'lieyouwangyu',
    ks_pengpainews = 'pengpainews',
    ks_tiantianjianbao = 'tiantianjianbao',
    ks_jingming = 'jingming',
    ks_ermi = 'ermi',
    ks_kelakela = 'kelakela',
    ks_kuaishouJsb = 'kuaishouJsb',
}

local kashangObjIdx = 1
--------------------------------------------------- 卡商 --------------------------------------
--[[
    卡商接口方法
--]]
local function getKashangAPIMethods( platform, itemName )
	if 'xiaoxinma' == platform then
		return {
			API_Login = '/login',
            API_Logout = '/exit',
            API_GetPhone = '/getPhone',
            API_GetMessage = '/getMessage',
            API_ReleasePhone = '/clearPhone',
            API_AddBlack = '/addBlack',
		}
    elseif 'zhijingma' == platform then
        return {
            API_Login = '/Login/?',
            API_Balance = '/Balance/?',
            API_Logout = '',
            API_GetPhone = '/GetPhone/?',
            API_GetMessage = '/GetMsg/?',
            API_ReleasePhone = '/Cancel/?',
            API_AddBlack = '/Addblack/?',
        }
    elseif 'jindouyun' == platform then
        return {
            API_Login = '/login',
            API_Balance = '/getSummary',
            API_Logout = '',
            API_GetPhone = '/getPhone',
            API_GetMessage = '/getMessage',
            API_ReleasePhone = '/cancelRecv',
            API_AddBlack = '/addBlacklist',
        }
    elseif 'guaima' == platform then
        return {
            API_Login = 'getInfo',
            API_Balance = '',
            API_Logout = '',
            API_GetPhone = 'getPhone',
            API_GetMessage = 'getCode',
            API_ReleasePhone = 'freePhone',
            API_AddBlack = 'addBlack',
        }
    elseif 'gongxiangyun' == platform then
        return {
            API_Login = 'login',
            API_Balance = 'myInfo',
            API_Logout = '',
            API_GetPhone = 'getPhone',
            API_GetMessage = 'getPhoneCode',
            API_ReleasePhone = 'setRel',
            API_AddBlack = 'addBlack',
        }
    elseif 'xinyima' == platform or 'liebaoma' == platform or 'dingdongma' == platform or 'xinaima' == platform or 'feixiangma' == platform then
        return {
            API_Login = '/api/sign/',
            API_Balance = '/api/yh_gx/',
            API_Logout = '',
            API_GetPhone = '/api/yh_qh/',
            API_GetMessage = '/api/yh_qm/',
            API_ReleasePhone = '/api/yh_sf/',
            API_AddBlack = '/api/yh_lh/',
        }
    elseif 'kekema' == platform or 'yema' == platform then
        return {
            API_Login = '/UserLoginStr',
            API_Logout = '/UserExitStr',
            -- API_GetArea = '/uGetArea?',
            -- API_GetItems = '/uGetItems',
            API_GetPhone = '/GetHM2Str',
            API_GetPhone2 = '/GetTaskStr',
            API_GetMessage = '/GetYzm2Str',
            API_ReleasePhone = '/sfHmStr',
            API_AddBlack = '/Hmd2Str',
        }
    elseif 'sunshine' == platform then
        if ksItemNames.ks_kuaishou == itemName then
            return {
                API_GetPhone = '/getWYYMobilePull.jsp',
                API_GetMessage = '/getWYYCodePull.jsp',
                API_Callback = '/getWYYCallbak.jsp',
            }
        elseif ksItemNames.ks_upLive == itemName then
            return {
                API_GetPhone = '/getHJMobilePull.jsp',
                API_GetMessage = '/getHJCodePull.jsp',
                API_Callback = '/getHJCallbak.jsp',
            }
        elseif ksItemNames.ks_changba == itemName then
            return {
                API_GetPhone = '/getHJMobilePull.jsp',
                API_GetMessage = '/getHJCodePull.jsp',
                API_Callback = '/getHJCallbak.jsp',
            }
        elseif ksItemNames.ks_58tongcheng == itemName then
            return {
                API_GetPhone = '/get58CityMobilePull.jsp',
                API_GetMessage = '/get58CityCodePull.jsp',
                API_Callback = '/get58CityCallbak.jsp',
            }
        elseif ksItemNames.ks_yzb == itemName then
            return {
                API_GetPhone = '/getYZBMobilePull.jsp',
                API_GetMessage = '/getYZBCodePull.jsp',
                API_Callback = '/getYZBCallbak.jsp',
            }
        elseif ksItemNames.ks_tianyancha == itemName then
            return {
                API_GetPhone = '/getTYCMobilePull.jsp',
                API_GetMessage = '/getTYCCodePull.jsp',
                API_Callback = '/getTYCCallbak.jsp',
            }
        elseif ksItemNames.ks_huajiaozhibo == itemName then
            return {
                API_GetPhone = '/getHJMobilePull.jsp',
                API_GetMessage = '/getHJCodePull.jsp',
                API_Callback = '/getHJCallbak.jsp',
            }
        end
    end
end

--[[
    卡商接口参数
--]]
local function getItemId( platform, itemName)
    if 'xiaoxinma' == platform then
    	if ksItemNames.ks_sifulan == itemName then
    		return 507
    	elseif ksItemNames.ks_jinritoutiaojs == itemName then
    		return 506
        elseif ksItemNames.ks_kkzhibo == itemName then
            return 508
        elseif ksItemNames.ks_yuxueyuan == itemName then
            return 543
        elseif ksItemNames.ks_xgv == itemName then
            return 551
        elseif ksItemNames.ks_kuaishou == itemName then
            return 230
        elseif ksItemNames.ks_baiping == itemName then
            return 679
        elseif ksItemNames.ks_huajiaozhibo == itemName then
            return 276
        elseif ksItemNames.ks_xiaozhuduanzu == itemName then
            return 548
        elseif ksItemNames.ks_huoXing == itemName then
            return 544
        elseif ksItemNames.ks_guazi == itemName then
            return 566
        elseif ksItemNames.ks_shuqixiaoshuo == itemName then
            return 547
        -- elseif ksItemNames.ks_xiecheng == itemName then
        --     return 821
        elseif ksItemNames.ks_gengmei == itemName then
            return 801
        elseif ksItemNames.ks_qimaoxiaoshuo == itemName then
            return 803  
        elseif ksItemNames.ks_dedao == itemName then
            return 529
        elseif ksItemNames.ks_shansong == itemName then
            return 4590
        elseif ksItemNames.ks_lieyou == itemName then
            return 804
        elseif ksItemNames.ks_qiqizhibo == itemName then
            return 23381
        elseif ksItemNames.ks_pipipipi == itemName then
            return 28847
        elseif ksItemNames.ks_huxiu == itemName then
            return 24160
        elseif ksItemNames.ks_meiriyujia == itemName then
            return 8423
        elseif ksItemNames.ks_lieyouwangyu == itemName then
            return 57221
        elseif ksItemNames.ks_xiaomiYoupin == itemName then
            return 27568
        elseif ksItemNames.ks_pengpainews == itemName then
            return 64223
        elseif ksItemNames.ks_xiaoshuoyueduba == itemName then
            return 67311
        elseif ksItemNames.ks_tiantianjianbao == itemName then
            return 5757
        elseif ksItemNames.ks_jingming == itemName then
            return 57920
        elseif ksItemNames.ks_ermi == itemName then
            return 28859
        elseif ksItemNames.ks_kelakela == itemName then
            return 1694
    	end
    elseif 'gongxiangyun' == platform then
        if ksItemNames.ks_jinritoutiaojs == itemName then
            return 31543
        elseif ksItemNames.ks_xgv == itemName then
            return 23946
        elseif ksItemNames.ks_kuaishou == itemName then
            return 40377
        elseif ksItemNames.ks_jingming == itemName then
            return 
        elseif ksItemNames.ks_kkzhibo == itemName then
            return 20178
        elseif ksItemNames.ks_kelakela == itemName then
            return
        elseif ksItemNames.ks_gengmei == itemName then
            return 21197
        elseif ksItemNames.ks_sifulan == itemName then
            return 34208
        elseif ksItemNames.ks_huajiaozhibo == itemName then
            return 13499
        elseif ksItemNames.ks_pipipipi == itemName then
            return 
        elseif ksItemNames.ks_meiriyujia == itemName then
            return 
        elseif ksItemNames.ks_guazi == itemName then
            return 16479
        elseif ksItemNames.ks_baiping == itemName then
            return 13202
        elseif ksItemNames.ks_tianyancha == itemName then
            return 24731
        elseif ksItemNames.ks_lieyou == itemName then
            return 31693
        elseif ksItemNames.ks_xiaozhuduanzu == itemName then
            return 33874
        elseif ksItemNames.ks_kuaishouJsb == itemName then
            return 34033
        elseif ksItemNames.ks_huxiu == itemName then
            return 29522
        elseif ksItemNames.ks_diandiankaihei == itemName then
            return 39421
        end
    elseif 'zhijingma' == platform then
        if ksItemNames.ks_sifulan == itemName then
            return 50139
        elseif ksItemNames.ks_yuxueyuan == itemName then
        	return 50138
        elseif ksItemNames.ks_qimaoxiaoshuo == itemName then
        	return 16874 -- 16869
        elseif ksItemNames.ks_xgv == itemName then
        	return 14543
        elseif ksItemNames.ks_xiaozhuduanzu == itemName then
            return 12892
        elseif ksItemNames.ks_gengmei == itemName then
        	return 14545
        elseif ksItemNames.ks_xiecheng == itemName then
        	return 11040
        elseif ksItemNames.ks_huajiaozhibo == itemName then
            return 10355
        elseif ksItemNames.ks_huoXing == itemName then
            return 16526
        elseif ksItemNames.ks_kuaishou == itemName then
            return 50634
        elseif ksItemNames.ks_kkzhibo == itemName then
            return 50913
        elseif ksItemNames.ks_baiping == itemName then
            return 50912
        elseif ksItemNames.ks_lieyou == itemName then
            return 50914
        elseif ksItemNames.ks_qiqizhibo == itemName then
            return 51031
        elseif ksItemNames.ks_pipipipi == itemName then
            return 50424
        elseif ksItemNames.ks_huxiu == itemName then
            return 52005
        elseif ksItemNames.ks_lieyouwangyu == itemName then
            return 55338
        elseif ksItemNames.ks_pengpainews == itemName then
            return 53982
        elseif ksItemNames.ks_jingming == itemName then
            return 51971
        elseif ksItemNames.ks_ermi == itemName then
            return 51680
        elseif ksItemNames.ks_kelakela == itemName then
            return 52878
        end
    elseif 'xinyima' == platform then
        if ksItemNames.ks_jinritoutiaojs == itemName then
            return 31543
        elseif ksItemNames.ks_xgv == itemName then
            return 23946
        elseif ksItemNames.ks_kuaishou == itemName then
            return 40377
        elseif ksItemNames.ks_jingming == itemName then
            return 
        elseif ksItemNames.ks_kkzhibo == itemName then
            return 20178
        elseif ksItemNames.ks_kelakela == itemName then
            return
        elseif ksItemNames.ks_gengmei == itemName then
            return 21197
        elseif ksItemNames.ks_sifulan == itemName then
            return 34208
        elseif ksItemNames.ks_huajiaozhibo == itemName then
            return 13499
        elseif ksItemNames.ks_pipipipi == itemName then
            return 
        elseif ksItemNames.ks_meiriyujia == itemName then
            return 
        elseif ksItemNames.ks_guazi == itemName then
            return 16479
        elseif ksItemNames.ks_baiping == itemName then
            return 13202
        elseif ksItemNames.ks_tianyancha == itemName then
            return 24731
        elseif ksItemNames.ks_lieyou == itemName then
            return 31693
        elseif ksItemNames.ks_xiaozhuduanzu == itemName then
            return 33874
        elseif ksItemNames.ks_kuaishouJsb == itemName then
            return 34033
        elseif ksItemNames.ks_huxiu == itemName then
            return 29522
        elseif ksItemNames.ks_diandiankaihei == itemName then
            return 39421
        end
    elseif 'jindouyun' == platform then
        if ksItemNames.ks_jinritoutiaojs == itemName then
            return 1975 --0.11
        elseif ksItemNames.ks_xgv == itemName then
            return 1637 --0.11
        elseif ksItemNames.ks_kuaishou == itemName then
            return 1301 -- 0.11
        elseif ksItemNames.ks_jingming == itemName then
            return 13032
        elseif ksItemNames.ks_kkzhibo == itemName then
            return 11066 --0.11
        elseif ksItemNames.ks_kelakela == itemName then
            return 4785  -- 0.11
        elseif ksItemNames.ks_gengmei == itemName then
            return 8319 --0.11
        elseif ksItemNames.ks_sifulan == itemName then
            return 12878 -- 0.11
        elseif ksItemNames.ks_huajiaozhibo == itemName then
            return 1665
        elseif ksItemNames.ks_pipipipi == itemName then
            return 4791
        elseif ksItemNames.ks_meiriyujia == itemName then
            return 6171
        elseif ksItemNames.ks_guazi == itemName then
            return 13660
        elseif ksItemNames.ks_baiping == itemName then
            return 13943
        elseif ksItemNames.ks_lieyou == itemName then
            return 9148
        elseif ksItemNames.ks_xiaozhuduanzu == itemName then
            return 3309
        elseif ksItemNames.ks_kuaishouJsb == itemName then
            return 11768
        elseif ksItemNames.ks_huxiu == itemName then
            return
        elseif ksItemNames.ks_diandiankaihei == itemName then
            return 
        end
    elseif 'kekema' == platform then
        if ksItemNames.ks_jinritoutiaojs == itemName then
            return 
        elseif ksItemNames.ks_xgv == itemName then
            return 5261 --0.35
        elseif ksItemNames.ks_kuaishou == itemName then
            -- return 477 -- 2.2
        elseif ksItemNames.ks_jingming == itemName then
            return 362244
        elseif ksItemNames.ks_kkzhibo == itemName then
            return 357951 -- 0.3
        elseif ksItemNames.ks_kelakela == itemName then
            return 360917 -- 0.25
        elseif ksItemNames.ks_gengmei == itemName then
            return 5263 --0.2
        elseif ksItemNames.ks_sifulan == itemName then
            return 4926
        elseif ksItemNames.ks_huajiaozhibo == itemName then
            return 419
        elseif ksItemNames.ks_meiriyujia == itemName then
            return 31
        end
    elseif 'guaima' == platform then
        if ksItemNames.ks_jinritoutiaojs == itemName then
            return 10487
        elseif ksItemNames.ks_xgv == itemName then
            return 11750 
        elseif ksItemNames.ks_kuaishou == itemName then
            return 11124
        elseif ksItemNames.ks_jingming == itemName then
            return 15049
        elseif ksItemNames.ks_kkzhibo == itemName then
            return 11557
        elseif ksItemNames.ks_kelakela == itemName then
            return 13478
        elseif ksItemNames.ks_gengmei == itemName then
            return 15050
        elseif ksItemNames.ks_sifulan == itemName then
            return 11386
        elseif ksItemNames.ks_huajiaozhibo == itemName then
            return 10462
        elseif ksItemNames.ks_guazi == itemName then
            return 13025
        elseif ksItemNames.ks_baiping == itemName then
            return 13684
        elseif ksItemNames.ks_xiaozhuduanzu == itemName then
            return 15037
        elseif ksItemNames.ks_kuaishouJsb == itemName then
            return 10224
        elseif ksItemNames.ks_huxiu == itemName then
            return 11140
        end 
    elseif 'dingdongma' == platform then
        if ksItemNames.ks_jinritoutiaojs == itemName then
            return 25141
        elseif ksItemNames.ks_xgv == itemName then
            return 36299 
        elseif ksItemNames.ks_kuaishou == itemName then
            return 27673
        elseif ksItemNames.ks_jingming == itemName then
            return 
        elseif ksItemNames.ks_kkzhibo == itemName then
            return 11836
        elseif ksItemNames.ks_kelakela == itemName then
            return 24481
        elseif ksItemNames.ks_gengmei == itemName then
            return 17148
        elseif ksItemNames.ks_sifulan == itemName then
            return 32313
        elseif ksItemNames.ks_huajiaozhibo == itemName then
            return 31788
        elseif ksItemNames.ks_pipipipi == itemName then
            return 30990
        elseif ksItemNames.ks_meiriyujia == itemName then
            return 
        elseif ksItemNames.ks_guazi == itemName then
            return 
        elseif ksItemNames.ks_baiping == itemName then
            return 34808
        end 
    elseif 'liebaoma' == platform then
        if ksItemNames.ks_jinritoutiaojs == itemName then
            return 
        elseif ksItemNames.ks_xgv == itemName then
            return 37702 
        elseif ksItemNames.ks_kuaishou == itemName then
            return 40377
        elseif ksItemNames.ks_jingming == itemName then
            return 
        elseif ksItemNames.ks_kkzhibo == itemName then
            return 
        elseif ksItemNames.ks_kelakela == itemName then
            return 
        elseif ksItemNames.ks_gengmei == itemName then
            return 21197
        elseif ksItemNames.ks_sifulan == itemName then
            return 32646
        elseif ksItemNames.ks_huajiaozhibo == itemName then
            return 13499
        end 
    elseif 'yema' == platform then
        if ksItemNames.ks_jinritoutiaojs == itemName then
            return 70129 --0.5
        elseif ksItemNames.ks_xgv == itemName then
            return 5261 --0.30
        elseif ksItemNames.ks_kuaishou == itemName then
            return  -- 2.2
        elseif ksItemNames.ks_jingming == itemName then
            return 91 --0.25
        elseif ksItemNames.ks_kkzhibo == itemName then
            return 57064 --357951 -- 0.2
        elseif ksItemNames.ks_kelakela == itemName then
            return 57156 -- 0.2
        elseif ksItemNames.ks_gengmei == itemName then
            return 5263 --0.2
        elseif ksItemNames.ks_sifulan == itemName then
            return 4926
        end
    elseif 'xinaima' == platform then
        if ksItemNames.ks_xiecheng == itemName then
            return 33395
        elseif ksItemNames.ks_xgv == itemName then
            return 37702 --19220 
        elseif ksItemNames.ks_qimaoxiaoshuo == itemName then
            return 12577 --12383
        elseif ksItemNames.ks_kuaishou == itemName then
            return 40377 -- 19658
        elseif ksItemNames.ks_kkzhibo == itemName then
            return 20178
        elseif ksItemNames.ks_huoXing == itemName then
            return 35173
        elseif ksItemNames.ks_dedao == itemName then
            return 13487
        elseif ksItemNames.ks_shansong == itemName then
            return 19760
        -- elseif ksItemNames.ks_xiaozhuduanzu == itemName then
        --     return 33874 
        elseif ksItemNames.ks_gengmei == itemName then
            return 21197
        elseif ksItemNames.ks_sifulan == itemName then
            return 34208
        elseif ksItemNames.ks_yuxueyuan == itemName then
            return 16321
        end
    elseif 'feixiangma' == platform then
        if ksItemNames.ks_xiecheng == itemName then
            return 33395
        elseif ksItemNames.ks_huajiaozhibo == itemName then
            return 13499
        elseif ksItemNames.ks_baiping == itemName then
            return 27906
        elseif ksItemNames.ks_lieyou == itemName then
            return 19168
        end
    end
end

--[[
    Gongxiangyun_APIParams
--]]
local Gongxiangyun_APIParams = class()

function Gongxiangyun_APIParams:ctor( cfg, itemName )
    self.cfg = cfg
    self.itemId = getItemId(cfg.platform, itemName)
    self.sessionToken = nil
end

function Gongxiangyun_APIParams:setItemByName(itemName)
    if self.cfg then
        self.itemId = getItemId(self.cfg.platform, itemName)
    end
end

function Gongxiangyun_APIParams:setPid(pid)
    self.pid = pid
end

function Gongxiangyun_APIParams:loginParams( )
    local tt = {
        ApiName = self.cfg.userName,
        PassWord = self.cfg.password,
    }
    return tt
end

function Gongxiangyun_APIParams:balanceParams( )
    local tt = {
        token = self.sessionToken,
    }
    return tt
end

function Gongxiangyun_APIParams:getPhoneParams( ptype, phoneNO, bValidate  )
    local tt =  {
        token = self.sessionToken,
        iid  = self.itemId,
        did = self.cfg.developer,
        mobile = phoneNO,
    }
    return tt
end

function Gongxiangyun_APIParams:getMessageParams( phoneNO, pid )
   local tt = {
        token = self.sessionToken,
        pid = self.pid,
    }
    return tt
end

function Gongxiangyun_APIParams:releasePhoneParams( phoneNO )
    local tt = {
        token = self.sessionToken,
        pid = self.pid,
    }
    return tt
end

function Gongxiangyun_APIParams:addBlackParams( phoneNO )
    local tt = {
        token = self.sessionToken,
        pid = self.pid,
        reason = 'canot be use',
    }
    return tt
end

--[[
    Zhijingma_APIParams
--]]
local Zhijingma_APIParams = class()

function Zhijingma_APIParams:ctor( cfg, itemName )
    self.cfg = cfg
    self.itemId = getItemId(cfg.platform, itemName)
    self.sessionToken = nil
end

function Zhijingma_APIParams:setItemByName(itemName)
    if self.cfg then
        self.itemId = getItemId(self.cfg.platform, itemName)
    end
end

function Zhijingma_APIParams:loginParams( )
    local tt = {
        username = self.cfg.userName,
        password = self.cfg.password,
    }
    return tt
end

function Zhijingma_APIParams:balanceParams( )
	local tt = {
        token = self.sessionToken,
    }
    return tt
end

function Zhijingma_APIParams:getPhoneParams( ptype, phoneNO, bValidate  )
    local tt =  {
        token = self.sessionToken,
        id  = self.itemId,
        loop = 1,
        card = bValidate and 2 or 0,
        phone = phoneNO,
    }
    if ptype then
        tt.isp = ptype
    end
    return tt
end

function Zhijingma_APIParams:getMessageParams( phoneNO )
   local tt = {
        token = self.sessionToken,
        id = self.itemId,
        phone = phoneNO,
        dev = self.cfg.userName,
    }
    return tt
end

function Zhijingma_APIParams:releasePhoneParams( phoneNO )
    local tt = {
        token = self.sessionToken,
        id = self.itemId,
        phone = phoneNO,
    }
    return tt
end

function Zhijingma_APIParams:addBlackParams( phoneNO )
    local tt = {
        token = self.sessionToken,
        id = self.itemId,
        phone = phoneNO,
    }
    return tt
end

--[[
	Xinaima_APIParams
--]]
local Xinaima_APIParams = class()

function Xinaima_APIParams:ctor( cfg, itemName )
    self.cfg = cfg
    self.itemId = getItemId(cfg.platform, itemName)
    self.sessionToken = nil
end

function Xinaima_APIParams:setItemByName(itemName)
    if self.cfg then
        self.itemId = getItemId(self.cfg.platform, itemName)
    end
end

function Xinaima_APIParams:loginParams( )
    local tt = {
        username = self.cfg.userName,
        password = self.cfg.password,
    }
    return tt
end

function Xinaima_APIParams:balanceParams( )
	local tt = {
        token = self.sessionToken,
    }
    return tt
end

function Xinaima_APIParams:getPhoneParams( ptype, phoneNO, bValidate )
    local tt =  {
        token = self.sessionToken,
        id  = self.itemId,
        loop = 1,
        card = 0, --bValidate and 2 or 0, 暂时都不过来虚拟号段
        phone = phoneNO,
    }
    if ptype then
        tt.operator = ptype
    end
    return tt
end

function Xinaima_APIParams:getMessageParams( phoneNO )
   local tt = {
        token = self.sessionToken,
        id = self.itemId,
        phone = phoneNO,
        t = self.cfg.userName,
    }
    return tt
end

function Xinaima_APIParams:releasePhoneParams( phoneNO )
    local tt = {
        token = self.sessionToken,
        id = self.itemId,
        phone = phoneNO,
    }
    return tt
end

function Xinaima_APIParams:addBlackParams( phoneNO )
    local tt = {
        token = self.sessionToken,
        id = self.itemId,
        phone = phoneNO,
    }
    return tt
end

--[[
    EMa_APIParams
--]]
local EMa_APIParams = class()

function EMa_APIParams:ctor( cfg, itemName )
    self.cfg = cfg
    self.itemId = getItemId(cfg.platform, itemName)
    self.sessionToken = nil
end

function EMa_APIParams:setItemByName(itemName)
    if self.cfg then
        self.itemId = getItemId(self.cfg.platform, itemName)
    end
end

function EMa_APIParams:addDefaultParam( params )
    if params and 'table' == type(params) then
        params.Code = 'UTF8'
    end
    return params
end

function EMa_APIParams:loginParams( )
    local tt = {
        uName = self.cfg.userName,
        pWord = self.cfg.password,
        Developer = self.cfg.developer,
    }
    return self:addDefaultParam(tt)
end

function EMa_APIParams:logoutParams( )
    local tt = {
        token = self.sessionToken,
    }
    return self:addDefaultParam(tt)
end

function EMa_APIParams:getAreaParams( )
    local tt =  {
    }
    return self:addDefaultParam(tt)
end

function EMa_APIParams:getItemsParams( )
    local tt = {
        token = self.sessionToken,
        tp = 'ut',
    }
    return self:addDefaultParam(tt)
end

function EMa_APIParams:getPhoneParams( ptype, phoneNO )
    local tt =  {
        token = self.sessionToken,
        ItemId  = self.itemId,
        PhoneType = ptype or 0,
        Phone = phoneNO,
    }
    return self:addDefaultParam(tt)
end

function EMa_APIParams:getMessageParams( phoneNO )
    local tt =  {
        token = self.sessionToken,
        itemId  = self.itemId,
        phone = phoneNO,
    }
    return self:addDefaultParam(tt)
end

function EMa_APIParams:releasePhoneParams( phone )
    local tt = {
        token = self.sessionToken,
        phoneList = phone .. '-' .. self.itemId .. ';'
    }
    return self:addDefaultParam(tt)
end

function EMa_APIParams:addBlackParams( phone )
    local tt = {
        token = self.sessionToken,
        phoneList = self.itemId .. '-' .. phone .. ';',
    }
    return self:addDefaultParam(tt)
end
--[[
	Xiaoxinma_APIParams
--]]
local Xiaoxinma_APIParams = class(EMa_APIParams)
function Xiaoxinma_APIParams:addDefaultParam( params )
	return params
end

function Xiaoxinma_APIParams:getMessageParams( phoneNO )
    local tt =  {
        token = self.sessionToken,
        ItemId  = self.itemId,
        Phone = phoneNO,
    }
    return tt
end
function Xiaoxinma_APIParams:getPhoneParams( ptype, phoneNO, bValidate )
	if bValidate then
		ptype = 5
	end
    local tt =  {
        token = self.sessionToken,
        ItemId  = self.itemId,
        PhoneType = ptype or 0,
        Phone = phoneNO,
    }
    return tt
end
--[[
    JsYzm_APIParams
--]]
local JsYzm_APIParams = class()
function JsYzm_APIParams:ctor( cfg, itemName )
    self.cfg = cfg
    self.itemId = getItemId(cfg.platform, itemName)
    self.sessionToken = nil
end

function JsYzm_APIParams:setItemByName(itemName)
    if self.cfg then
        self.itemId = getItemId(self.cfg.platform, itemName)
    end
end

function JsYzm_APIParams:loginParams( )
    local tt = {
        name = self.cfg.userName,
        psw = self.cfg.password,
    }
    return tt
end

function JsYzm_APIParams:logoutParams( )
    local tt = {
        token = self.sessionToken,
    }
    return tt
end

-- function JsYzm_APIParams:getAreaParams( )
--     local tt = {
--     }
--     return tt
-- end

-- function JsYzm_APIParams:getItemsParams( )
--     local tt = {
--         token = self.sessionToken,
--         tp = 'ut',
--     }
--     return tt
-- end

function JsYzm_APIParams:getPhoneParams( ptype, phoneNO, ksNO )
    local tt = {
        token = self.sessionToken,
        xmid  = self.itemId,
        sl = 1,
        lx = ptype or 0,
        ks = 0, --ksNO or 
        a1 = '',
        a2 = '',
        pk = '',
        rj = '', -- 'yw2019',
        -- rj (作者帐户名)
        -- mobile = phoneNO,
    }
    return tt
end

function JsYzm_APIParams:getPhoneParams2( queId )
    local tt = {
        token = self.sessionToken,
        id  = queId,
    }
    return tt
end

function JsYzm_APIParams:getMessageParams( phoneNO )
    local tt = {
        token = self.sessionToken,
        xmid  = self.itemId,
        hm = phoneNO,
        sf = 1,
    }
    return tt
end

function JsYzm_APIParams:releasePhoneParams( phone )
    local tt = {
        token = self.sessionToken,
        hm = phone
    }
    return tt
end

function JsYzm_APIParams:addBlackParams( phone )
    local tt = {
        token = self.sessionToken,
        xmid  = self.itemId,
        hm = phoneNO,
        sf = 1,
    }
    return tt
end
--[[
    Jindouyun_APIParams
--]]
local Jindouyun_APIParams = class()

function Jindouyun_APIParams:ctor( cfg, itemName )
    self.cfg = cfg
    self.itemId = getItemId(cfg.platform, itemName)
    self.sessionToken = nil
end

function Jindouyun_APIParams:setItemByName(itemName)
    if self.cfg then
        self.itemId = getItemId(self.cfg.platform, itemName)
    end
end

function Jindouyun_APIParams:loginParams( )
    local tt = {
        userName = self.cfg.userName,
        password = self.cfg.password,
    }
    return tt
end

function Jindouyun_APIParams:balanceParams( )
    local tt = {
        token = self.sessionToken,
    }
    return tt
end

function Jindouyun_APIParams:getPhoneParams( ptype, phoneNO, bValidate )
    local tt =  {
        token = self.sessionToken,
        sid  = self.itemId,
        developer = "yw2018",
    }
    -- if bValidate then
    --     tt.operator = "exclude4"
    -- end
    return tt
end

function Jindouyun_APIParams:getMessageParams( phoneNO )
   local tt = {
        token = self.sessionToken,
        sid = self.itemId,
        phone = phoneNO,
    }
    return tt
end

function Jindouyun_APIParams:releasePhoneParams( phoneNO )
    local tt = {
        token = self.sessionToken,
        sid = self.itemId,
        phone = phoneNO,
    }
    return tt
end

function Jindouyun_APIParams:addBlackParams( phoneNO )
    local tt = {
        token = self.sessionToken,
        sid = self.itemId,
        phone = phoneNO,
    }
    return tt
end
--[[
    Guaima_APIParams
--]]
local Guaima_APIParams = class()

function Guaima_APIParams:ctor( cfg, itemName )
    self.cfg = cfg
    self.itemId = getItemId(cfg.platform, itemName)
    self.sessionToken = nil
end

function Guaima_APIParams:setItemByName(itemName)
    if self.cfg then
        self.itemId = getItemId(self.cfg.platform, itemName)
    end
end

function Guaima_APIParams:loginParams( )
    local tt = {
        apiid = self.cfg.userName,
        pwd = self.cfg.password,
    }
    return tt
end

function Guaima_APIParams:balanceParams( )
    local tt = {
        apiid = self.cfg.userName,
        pwd = self.cfg.password,
    }
    return tt
end

function Guaima_APIParams:getPhoneParams( ptype, phoneNO, bValidate )
    local tt =  {
        apiid = self.cfg.userName,
        pwd = self.cfg.password,
        xmid  = self.itemId,
        kx = bValidate and 1 or 0,
        hm = phoneNO,
        author = "yw2018",
    }
    if ptype then
        tt.yys = ptype
    end
    return tt
end

function Guaima_APIParams:getMessageParams( phoneNO )
   local tt = {
        apiid = self.cfg.userName,
        pwd = self.cfg.password,
        xmid  = self.itemId,
        hm = phoneNO,
    }
    return tt
end

function Guaima_APIParams:releasePhoneParams( phoneNO )
    local tt = {
        apiid = self.cfg.userName,
        pwd = self.cfg.password,
        xmid  = self.itemId,
        hm = phoneNO,
    }
    return tt
end

function Guaima_APIParams:addBlackParams( phoneNO )
    local tt = {
        apiid = self.cfg.userName,
        pwd = self.cfg.password,
        xmid  = self.itemId,
        hm = phoneNO,
    }
    return tt
end
--[[
    Sunshine_APIParams
--]]
local Sunshine_APIParams = class()
function Sunshine_APIParams:ctor( cfg, itemName )
    self.cfg = cfg
    self.itemId = getItemId(cfg.platform, itemName)
    self.sessionToken = nil
end

function Sunshine_APIParams:setItemByName(itemName)
    if self.cfg then
        self.itemId = getItemId(self.cfg.platform, itemName)
    end
end

-- function Sunshine_APIParams:loginParams( )
--     return 
-- end

-- function Sunshine_APIParams:logoutParams( )
--     return
-- end

-- function Sunshine_APIParams:releasePhoneParams( phone )
--     return
-- end

-- function Sunshine_APIParams:addBlackParams( phone )
--     return
-- end

-- function Sunshine_APIParams:getPhoneParams2( queId )
--     return
-- end

function Sunshine_APIParams:getPhoneParams( ptype, phoneNO )
    local tt = {
        cid = self.cfg.userName,
        pid  = self.cfg.password,
        authkey = self.cfg.authkey,
    }
    return tt
end

function Sunshine_APIParams:getMessageParams( phoneNO )
    local tt = {
        cid = self.cfg.userName,
        pid  = self.cfg.password,
        authkey = self.cfg.authkey,
        mobile = phoneNO,
    }
    return tt
end

function Sunshine_APIParams:getCallbackParams( phoneNO )
    local tt = {
        cid = self.cfg.userName,
        pid  = self.cfg.password,
        status = 'true',
        mobile = phoneNO,
    }
    return tt
end

local function getAPIParams( cfg, itemId )
    if 'xiaoxinma' == cfg.platform then
     	return Xiaoxinma_APIParams.new(cfg, itemId)
    elseif 'gongxiangyun' == cfg.platform then
        return Gongxiangyun_APIParams.new(cfg, itemId)
    elseif 'zhijingma' == cfg.platform then
        return Zhijingma_APIParams.new(cfg, itemId)
    elseif 'xinyima' == cfg.platform or 'liebaoma' == cfg.platform or 'dingdongma' == cfg.platform or 'xinaima' == cfg.platform or 'feixiangma' == cfg.platform  then
        return Xinaima_APIParams.new(cfg, itemId)
    elseif 'jindouyun' == cfg.platform then
        return Jindouyun_APIParams.new(cfg, itemId)
    elseif 'guaima' == cfg.platform then
        return Guaima_APIParams.new(cfg, itemId)
    elseif 'kekema' == cfg.platform or 'yema' == cfg.platform then
        return JsYzm_APIParams.new(cfg, itemId)
    elseif 'sunshine' == cfg.platform then
        return Sunshine_APIParams.new(cfg, itemId)
    end
end

--[[
    卡商实现类
--]]
local KashangBaseClass = class()

function KashangBaseClass:ctor( cfg, itemId )
    self.APIParams = getAPIParams(cfg, itemId)
    self.APIMethondList = getKashangAPIMethods(cfg.platform)
    self.cfg = cfg
end

function KashangBaseClass:setItem( itemName )
    if self.APIParams then
        self.APIParams:setItemByName(itemName)
    end
end

function KashangBaseClass:getToken( )
    return self.APIParams and self.APIParams.sessionToken
end

function KashangBaseClass:setToken( token )
    if self.APIParams then
        self.APIParams.sessionToken = token
    end
end

function KashangBaseClass:isValidPhoneNO( phoneNO ) -- 过滤虚拟号段
    if phoneNO and '14' ~= string.sub(phoneNO, 1, 2) and '17' ~= string.sub(phoneNO, 1, 2) and '19' ~= string.sub(phoneNO, 1, 2) then
        return true
    end
    return false
end

function KashangBaseClass:kashang_request( strAction, tabParams)
    tabParams = tabParams or {}
    local strParams = '?'
    local sepStr = ''
    for k,v in pairs(tabParams) do
        strParams = strParams .. sepStr .. k .. '=' .. v
        sepStr = '&'
    end
    -- dialog(self.APIParams.cfg.APIAdress .. strAction .. strParams, 0)
    local res = szocket_http.request(self.APIParams.cfg.APIAdress .. strAction .. strParams)
    if self.checkErrors then
        res = self:checkErrors(res)
        -- dialog(tostring(res))
    end
    return res
end

--[[
    风火云
--]]
local KashangFHY = class(KashangBaseClass)

function KashangFHY:kashang_request( strAction, tabParams)
    tabParams = tabParams or {}
    local strParams = '?action=' .. strAction
    local sepStr = '&'
    for k,v in pairs(tabParams) do
        strParams = strParams .. sepStr .. k .. '=' .. v
    end
    -- dialog(self.APIParams.cfg.APIAdress .. strParams, 0)
    local res = szocket_http.request(self.APIParams.cfg.APIAdress .. strParams)
    -- if self.checkErrors then
    --     res = self:checkErrors(res)
    --     -- dialog(tostring(res))
    -- end
    return res
end

-- function KashangFHY:checkErrors( res )
-- 	if res then
-- 		if '1|' == string.sub(res, 1, 2) then
-- 			return res
-- 		end
-- 	end
-- 	return res
-- end

function KashangFHY:kashang_login( )
    writeASOLog('KashangFHY:kashang_login')
    if self:getToken() then
        self:kashang_logout()
    end
    self.tokenTable = self.tokenTable or readFromJsonFile( g_config.tokenTableFile )

    local login_token = self.tokenTable and self.tokenTable[self.cfg.platform]

    if login_token then
    	self:setToken(login_token)
    	-- 获取余额，如果成功无需再登录
    	local tt = self.APIParams:balanceParams()
    	for i=1, 2 do
    		local res = self:kashang_request(self.APIMethondList.API_Balance, tt)
			if res and string.find(res, '1|') then
				return true
			end
		end
		self:setToken()
    end

    local tt = self.APIParams:loginParams()
    local function loginKashang( )
        local res = self:kashang_request(self.APIMethondList.API_Login, tt)        
        writeASOLog('res: ' .. tostring(res) )
        toast('res: ' .. tostring(res) )
        if not res then
            return false
        else
            local resTable = stoastSplit(res, '|')
            if '0' == resTable[1] then
            	return false
            else
	            self:setToken(resTable[2])
	            return true
	        end
        end
    end

    for i=1,3 do
    	local bLogin = loginKashang()
        if bLogin then
        	self.tokenTable = self.tokenTable or {}
        	self.tokenTable[self.cfg.platform] = self:getToken()
        	saveToJsonFile( g_config.tokenTableFile, self.tokenTable )
            return true
        else
            delay(30)
        end
    end
    return false
end

--[[
    获取手机号码
--]]
function KashangFHY:kashang_getPhone( ptype, phoneNO, bValidate)
    writeASOLog('KashangFHY:kashang_getPhone')
    if not self:getToken() then
        writeASOLog('请先登录风火云平台')
        return
    end

    local tt = self.APIParams:getPhoneParams(ptype, phoneNO, bValidate)
    local res = self:kashang_request(self.APIMethondList.API_GetPhone, tt)
    writeASOLog(tostring(res))
    if not res or string.find(res, '0|') then
    	return nil
    else
        return stoastSplit(res, '|')[2]
    end
end

function KashangFHY:kashang_getMessage(phoneNO)
    writeASOLog('KashangFHY:kashang_getMessage(' .. phoneNO .. ')')
    if not self:getToken() then
        writeASOLog('请先登录风火云平台')
        return nil
    end
    local tt = self.APIParams:getMessageParams(phoneNO)

    local res = self:kashang_request(self.APIMethondList.API_GetMessage, tt)
    if not res or string.find(res, '0|') then
    	return nil
    else
        self:kashang_releasePhone(phoneNO)
        return stoastSplit(res, '|')[2]
    end
end

function KashangFHY:kashang_addBlack( phone )
    if not phone then
        return
    end
    writeASOLog('KashangFHY:kashang_addBlack(' .. phone .. ')')
    if not self:getToken() then
        writeASOLog('请先登录风火云平台')
        return
    end

    local tt = self.APIParams:addBlackParams(phone)
    local res = self:kashang_request(self.APIMethondList.API_AddBlack, tt)
    writeASOLog(tostring(res))
end

function KashangFHY:kashang_releasePhone( phone)
    writeASOLog('KashangFHY:kashang_releasePhone ' .. tostring(phone) )
    if not self:getToken() then
        writeASOLog('请先登录风火云平台')
        return
    end
    local tt = self.APIParams:releasePhoneParams(phone)
    local res = self:kashang_request(self.APIMethondList.API_ReleasePhone, tt)
    writeASOLog(tostring(res))
end

function KashangFHY:kashang_logout( )
    writeASOLog('KashangFHY:kashang_logout')
    if not self:getToken() then
        writeASOLog('风火云已经退出')
        return
    end
    self:setToken()
end

--[[
    共享云
--]]
local KashangGXY = class(KashangFHY)

function KashangGXY:kashang_request( strAction, tabParams)
    tabParams = tabParams or {}
    local strParams = '?act=' .. strAction
    local sepStr = '&'
    for k,v in pairs(tabParams) do
        strParams = strParams .. sepStr .. k .. '=' .. v
    end
    -- dialog(self.APIParams.cfg.APIAdress .. strParams, 0)
    local res = szocket_http.request(self.APIParams.cfg.APIAdress .. strParams)
    -- if self.checkErrors then
    --     res = self:checkErrors(res)
    --     -- dialog(tostring(res))
    -- end
    return res
end

--[[
    获取手机号码
--]]
function KashangGXY:kashang_getPhone( ptype, phoneNO, bValidate)
    writeASOLog('KashangGXY:kashang_getPhone')
    if not self:getToken() then
        writeASOLog('请先登录共享云平台')
        return
    end

    local tt = self.APIParams:getPhoneParams(ptype, phoneNO, bValidate)
    local res = self:kashang_request(self.APIMethondList.API_GetPhone, tt)
    writeASOLog(tostring(res))
    if not res or string.find(res, '0|') then
        return nil
    else
        local resTable = stoastSplit(res, '|')
        self.APIParams:setPid(resTable[2])
        return resTable[5]
    end
end

--[[
    乖码
--]]
local kashangGuaima = class(KashangFHY)
function kashangGuaima:kashang_login( )
    writeASOLog('kashangGuaima:kashang_login')
    if self:getToken() then
        self:kashang_logout()
    end

    local tt = self.APIParams:loginParams()
    local function loginKashang( )
        local res = self:kashang_request(self.APIMethondList.API_Login, tt)        
        writeASOLog('res: ' .. tostring(res) )
        toast('res: ' .. tostring(res) )
        if not res then
            return false
        else
            local resTable = stoastSplit(res, '|')
            if '0' == resTable[1] then
                return false
            else
                local balance = tonumber(resTable[2])
                if balance and balance > 0.2 then
                    self:setToken(resTable[2])
                    return true
                else
                    return nil
                end
            end
        end
    end

    for i=1,3 do
        local bLogin = loginKashang()
        if bLogin then
            return true
        elseif nil == bLogin then
            return
        else
            delay(30)
        end
    end
    return false
end
--[[
    致敬码
--]]
local KashangZJM = class(KashangFHY)

function KashangZJM:kashang_request( strAction, tabParams)
    tabParams = tabParams or {}
    local strParams = ''
    local sepStr = ''
    for k,v in pairs(tabParams) do
        strParams = strParams .. sepStr .. k .. '=' .. v
        sepStr = '&'
    end
    -- dialog(self.APIParams.cfg.APIAdress .. strParams, 0)
    writeASOLog(string.format('%s%s%s', self.cfg.APIAdress, strAction, strParams))
    local res = szocket_http.request(string.format('%s%s%s', self.cfg.APIAdress, strAction, strParams))
    -- if self.checkErrors then
    --     res = self:checkErrors(res)
    --     -- dialog(tostring(res))
    -- end
    return res
end

function KashangZJM:kashang_getPhone( ptype, phoneNO, bValidate )
    writeASOLog('KashangZJM:kashang_getPhone')
    if not self:getToken() then
        writeASOLog('请先登录致敬码平台')
        return
    end
    local tt = self.APIParams:getPhoneParams(ptype, phoneNO, bValidate)
    local res = self:kashang_request(self.APIMethondList.API_GetPhone, tt)
    writeASOLog(tostring(res))
    if not res or string.find(res, '0|') then
    	return nil
    else
        return stoastSplit(res, '|')[2]
    end
end

--[[
    筋斗云
--]]
local KashangJDY = class(KashangBaseClass)

function KashangJDY:kashang_login( )
    writeASOLog('KashangJDY:kashang_login')
    if self:getToken() then
        self:kashang_logout()
    end
    self.tokenTable = self.tokenTable or readFromJsonFile( g_config.tokenTableFile )

    local login_token = self.tokenTable and self.tokenTable[self.cfg.platform]

    if login_token then
        self:setToken(login_token)
        -- 获取余额，如果成功无需再登录
        local tt = self.APIParams:balanceParams()
        for i=1, 2 do
            local res = self:kashang_request(self.APIMethondList.API_Balance, tt)
            if res and string.find(res, '0|') then
                return true
            end
        end
        self:setToken()
    end

    local tt = self.APIParams:loginParams()
    local function loginKashang( )
        local res = self:kashang_request(self.APIMethondList.API_Login, tt)        
        writeASOLog('res: ' .. tostring(res) )
        toast('res: ' .. tostring(res) )
        if not res then
            return false
        else
            local resTable = stoastSplit(res, '|')
            if '0' == resTable[1] then
                self:setToken(resTable[3] or resTable[2])
                return true
            else
                return false
            end
        end
    end

    for i=1,3 do
        local bLogin = loginKashang()
        if bLogin then
            self.tokenTable = self.tokenTable or {}
            self.tokenTable[self.cfg.platform] = self:getToken()
            saveToJsonFile( g_config.tokenTableFile, self.tokenTable )
            return true
        else
            delay(30)
        end
    end
    return false
end

--[[
    获取手机号码
--]]
function KashangJDY:kashang_getPhone( ptype, phoneNO, bValidate)
    writeASOLog('KashangJDY:kashang_getPhone')
    if not self:getToken() then
        writeASOLog('请先登录筋斗云平台')
        return
    end

    local tt = self.APIParams:getPhoneParams(ptype, phoneNO, bValidate)
    local res = self:kashang_request(self.APIMethondList.API_GetPhone, tt)
    writeASOLog(tostring(res))
    if not res or not string.find(res, '0|') then
        return nil
    else
        return stoastSplit(res, '|')[2]
    end
end

function KashangJDY:kashang_getMessage(phoneNO)
    writeASOLog('KashangJDY:kashang_getMessage(' .. phoneNO .. ')')
    if not self:getToken() then
        writeASOLog('请先登录筋斗云平台')
        return nil
    end
    local tt = self.APIParams:getMessageParams(phoneNO)

    local res = self:kashang_request(self.APIMethondList.API_GetMessage, tt)
    if not res or not string.find(res, '0|') then
        return nil
    else
        local resTab = stoastSplit(res, '|')
        if resTab[3] and tonumber(resTab[3]) then
            return resTab[3]
        else
            return resTab[2]
        end
    end
end

function KashangJDY:kashang_addBlack( phone )
    if not phone then
        return
    end
    writeASOLog('KashangJDY:kashang_addBlack(' .. phone .. ')')
    if not self:getToken() then
        writeASOLog('请先登录筋斗云平台')
        return
    end

    local tt = self.APIParams:addBlackParams(phone)
    local res = self:kashang_request(self.APIMethondList.API_AddBlack, tt)
    writeASOLog(tostring(res))
end

function KashangJDY:kashang_releasePhone( phone)
    writeASOLog('KashangJDY:kashang_releasePhone ' .. tostring(phone) )
    if not self:getToken() then
        writeASOLog('请先登录筋斗云平台')
        return
    end
    local tt = self.APIParams:releasePhoneParams(phone)
    local res = self:kashang_request(self.APIMethondList.API_ReleasePhone, tt)
    writeASOLog(tostring(res))
end

function KashangJDY:kashang_logout( )
    writeASOLog('KashangJDY:kashang_logout')
    if not self:getToken() then
        writeASOLog('筋斗云已经退出')
        return
    end
    self:setToken()
end


--[[
    小新码
--]]
local KashangClass = class(KashangBaseClass)

function KashangClass:checkErrors( res )
    if res then
        if string.find(res, 'False:Session 过期') then
            self:setToken()
        elseif string.find(res, 'False:余额不足') then
            self:kashang_logout()
        elseif string.find(res, '!DOCTYPE html') then
            return nil
        end
    end
    return res
end

function KashangClass:kashang_login( )
    writeASOLog('KashangClass:kashang_login')
    if self:getToken() then
        self:kashang_logout()
        mSleep(2 * 1000)
    end

    local tt = self.APIParams:loginParams()
    local function loginKashang( )
        local res = self:kashang_request(self.APIMethondList.API_Login, tt)        
        writeASOLog('res: ' .. tostring(res) )
        toast('res: ' .. tostring(res) )
        if not res or string.find(res, 'False:') then
            return false
        else
            local resTable = stoastSplit(res, '&')
            self:setToken(resTable[1])
            local balance = tonumber(resTable[2])
            if not balance then
                return false
            elseif balance  <= 0.1 then
                writeASOLog('余额不足')
                return true, true
            end
            return true
        end
    end

    for i=1,3 do
        local bLogin, bal = loginKashang()
        if bal then
            self:kashang_logout()
            return false
        elseif bLogin then
            return true
        else
            delay(30)
        end
    end
    return false
end

function KashangClass:kashang_getArea( )
    writeASOLog('KashangClass:kashang_getArea')
    local res = self:kashang_request(self.APIMethondList.API_GetArea, {})
    -- dialog(res)
    return res
end

function KashangClass:kashang_getItems( )
    writeASOLog('KashangClass:kashang_getItems')
    if not self.APIParams or not self.APIParams.sessionToken then
        writeASOLog('请先登录卡商平台')
        return
    end

    local tt = self.APIParams:getItemsParams()
    local res = self:kashang_request(self.APIMethondList.API_GetItems, tt)
    writeASOLog(tostring(res) )
    -- local itemsTab = stoastSplit(res, '\n')
    -- for i,v in ipairs(itemsTab) do
    --     toast(v, 1)
    --     mSleep(2 * 1000)
    -- end
end

--[[
    获取手机号码
--]]
function KashangClass:kashang_getPhone( ptype, phoneNO, bValidate)
    writeASOLog('KashangClass:kashang_getPhone')
    if not self:getToken() then
        writeASOLog('请先登录卡商平台')
        return
    end

    local tt = self.APIParams:getPhoneParams(ptype, phoneNO, bValidate)
    local res = self:kashang_request(self.APIMethondList.API_GetPhone, tt)
    writeASOLog(tostring(res))
    if res then
        if not self:getToken() then
            return nil
        end

        if string.find(res, 'False:') then
            return nil
        else
            return stoastSplit(res, ';')
        end
    end
end

function KashangClass:kashang_getMessage(phoneNO)
    writeASOLog('KashangClass:kashang_getMessage(' .. phoneNO .. ')')
    if not self:getToken() then
        writeASOLog('请先登录E云/神话平台')
        return nil
    end
    local tt = self.APIParams:getMessageParams(phoneNO)

    local res = self:kashang_request(self.APIMethondList.API_GetMessage, tt)
    if res then
        writeASOLog('res: ' .. res)
        local _beg, _end = string.find(res, 'MSG&')
        if _beg then
            local _beg2, _end2 = string.find(res, 'End]', _beg)
            res = string.sub(res, _beg, _beg2)
            local msgTab = stoastSplit(res, '&')
            local maxIndex = 1
            local maxLen = 0
            for i,v in ipairs(msgTab) do
                if #v > maxLen then
                    maxLen = #v
                    maxIndex = i
                end
            end
            return msgTab[maxIndex]
        end
    end
    return nil
end

function KashangClass:kashang_addBlack( phone )
    if not phone then
        return
    end
    writeASOLog('KashangClass:kashang_addBlack(' .. phone .. ')')
    if not self:getToken() then
        writeASOLog('请先登录E云/神话平台')
        return
    end

    local tt = self.APIParams:addBlackParams(phone)
    local res = self:kashang_request(self.APIMethondList.API_AddBlack, tt)
    writeASOLog(tostring(res))
end

function KashangClass:kashang_releasePhone( phone)
    writeASOLog('KashangClass:kashang_releasePhone ' .. tostring(phone) )
    if not self:getToken() then
        writeASOLog('请先登录E云/神话平台')
        return
    end
    local tt = self.APIParams:releasePhoneParams(phone)
    local res = self:kashang_request(self.APIMethondList.API_ReleasePhone, tt)
    writeASOLog(tostring(res))
end

function KashangClass:kashang_logout( )
    writeASOLog('KashangClass:kashang_logout')
    if not self:getToken() then
        writeASOLog('请先登录E云/神话平台')
        return
    end

    local tt = self.APIParams:logoutParams()
    local res = self:kashang_request(self.APIMethondList.API_Logout, tt)
    writeASOLog(tostring(res))
    self:setToken()
end
------------------------------------------------- 极速验证码 -------------------------------------------
local JsYzm = class(KashangBaseClass)

function JsYzm:checkErrors( res )
    local nRes = tonumber(res)
    if nRes and nRes <= 0 then
        if '0' == res then --没登陆或token过期
            self:setToken()
        elseif '-8' == res then --帐户余额不足
            self:kashang_logout()
        end
        return false
    end
    return res
end

-- function JsYzm:kashang_request( strAction, tabParams)
--     tabParams = tabParams or {}
--     local strParams = '?'
--     local sepStr = ''
--     for k,v in pairs(tabParams) do
--         strParams = strParams .. sepStr .. k .. '=' .. v
--         sepStr = '&'
--     end
--     -- dialog(self.APIParams.cfg.APIAdress .. strAction .. strParams, 0)
--     local res = szocket_http.request(self.APIParams.cfg.APIAdress .. strAction .. strParams)
--     writeASOLog(string.format('strAction: %s, res: %s', strAction, tostring(res) ) )
--     if not res or tonumber(res) <=0 then
--         if '0' == res then --没登陆或token过期
--             self:setToken()
--         elseif '-8' == res then --帐户余额不足
--             self:kashang_logout()
--         end
--         return false
--     else
--         return res
--     end
-- end

function JsYzm:kashang_login( )
    writeASOLog('JsYzm:kashang_login')
    if self:getToken() then
        self:kashang_logout()
        mSleep(2 * 1000)
    end

    local tt = self.APIParams:loginParams()
    local function loginKashang( )
        local res = self:kashang_request(self.APIMethondList.API_Login, tt)
        toast('res: ' .. tostring(res) )
        if res then
            self:setToken(res)
            return true
        else
            -- local balance = tonumber(resTable[2])
            -- if not balance then
            --     return false
            -- elseif balance  <= 0.1 then
            --     writeASOLog('余额不足')
            --     return true, true
            -- end
            return false
        end
    end

    for i=1,5 do
        local bLogin, bal = loginKashang()
        if bal then
            self:kashang_logout()
            return false
        elseif bLogin then
            return true
        else
            delay(30)
        end
    end
    return false
end

function JsYzm:kashang_getPhone( ptype, phoneNO, ksNO)
    writeASOLog('JsYzm:kashang_getPhone')
    if not self:getToken() then
        writeASOLog('请先登录极速验证码平台')
        return
    end

    local tt = self.APIParams:getPhoneParams(ptype, phoneNO, ksNO)
    -- for k,v in pairs(table_name) do
    --     dialog(tostring(v))
    -- end
    local res = self:kashang_request(self.APIMethondList.API_GetPhone, tt)
    if res then
        if string.find(res, 'hm=') then
            return stoastSplit(string.sub(res, 4), ',')
        elseif string.find(res, 'id=') then
            local tt = self.APIParams:getPhoneParams2(string.sub(res, 4))
            for i=1, 12 do
                res = self:kashang_request(self.APIMethondList.API_GetPhone2, tt)
                if res and string.len(res) > 8 then
                    return res
                end
            end
        end
    end
end

function JsYzm:kashang_getMessage(phoneNO)
    writeASOLog('JsYzm:kashang_getMessage(' .. phoneNO .. ')')
    if not self:getToken() then
        writeASOLog('请先登录极速验证码平台')
        return nil
    end
    local tt = self.APIParams:getMessageParams(phoneNO)

    local res = self:kashang_request(self.APIMethondList.API_GetMessage, tt)
    if res and string.len(res) > 4 then
        return string.sub(res, 20)
    end
    return nil
end

function JsYzm:kashang_addBlack( phone )
    if not phone then
        return
    end
    writeASOLog('JsYzm:kashang_addBlack(' .. phone .. ')')
    if not self:getToken() then
        writeASOLog('请先登录极速验证码平台')
        return
    end

    local tt = self.APIParams:addBlackParams(phone)
    local res = self:kashang_request(self.APIMethondList.API_AddBlack, tt)
end

function JsYzm:kashang_releasePhone( phone)
    writeASOLog('JsYzm:kashang_releasePhone ' .. tostring(phone) )
    if not self:getToken() then
        writeASOLog('请先登录极速验证码平台')
        return
    end
    local tt = self.APIParams:releasePhoneParams(phone)
    local res = self:kashang_request(self.APIMethondList.API_ReleasePhone, tt)
end

function JsYzm:kashang_logout( )
    writeASOLog('JsYzm:kashang_logout')
    if not self:getToken() then
        return
    end
    local tt = self.APIParams:logoutParams()
    local res = self:kashang_request(self.APIMethondList.API_Logout, tt)
    self:setToken()
end
------------------------------------------------- Sunshine -------------------------------------------
local Sunshine = class()

function Sunshine:ctor( cfg, itemId )
    self.APIParams = getAPIParams(cfg, itemId)
    self.APIMethondList = getKashangAPIMethods(cfg.platform, itemId)
end

function Sunshine:setItem( itemName )
    if self.APIParams then
        self.APIParams:setItemByName(itemName)
        local cfg = g_config.kashangList[kashangObjIdx]
        if cfg then
            self.APIMethondList = getKashangAPIMethods(cfg.platform, itemName)
        end
    end
end

function Sunshine:getToken( )
    return true --self.APIParams and self.APIParams.sessionToken
end

function Sunshine:setToken( token )
    if self.APIParams then
        self.APIParams.sessionToken = token
    end
end

function Sunshine:kashang_request( strAction, tabParams)
    tabParams = tabParams or {}
    local strParams = strAction
    local sepStr = '?'
    for k,v in pairs(tabParams) do
        strParams = strParams .. sepStr .. k .. '=' .. v
        sepStr = '&'
    end
    -- dialog(self.APIParams.cfg.APIAdress .. strAction .. strParams, 0)
    local res = szocket_http.request(self.APIParams.cfg.APIAdress .. strParams)
    writeASOLog(string.format('strAction: %s, res: %s', strAction, tostring(res) ) )
    return res
end

function Sunshine:kashang_login( )
    writeASOLog('Sunshine:kashang_login')
    return true -- 无需登录
end

function Sunshine:isValidPhoneNO( phoneNO )
    if phoneNO and '14' ~= string.sub(phoneNO, 1, 2) and '17' ~= string.sub(phoneNO, 1, 2) and '19' ~= string.sub(phoneNO, 1, 2) then
        return true
    end
    return false
end

--[[
    获取手机号码
--]]
function Sunshine:kashang_getPhone( ptype, phoneNO, bValidate )
    writeASOLog('Sunshine:kashang_getPhone')
    local tt = self.APIParams:getPhoneParams(ptype, phoneNO, bValidate)
    local res = self:kashang_request(self.APIMethondList.API_GetPhone, tt)
    if res then
        local resTab = cjson.decode(res)
        return resTab and resTab.no
    end
end

function Sunshine:kashang_getMessage(phoneNO)
    writeASOLog('Sunshine:kashang_getMessage(' .. phoneNO .. ')')
    local tt = self.APIParams:getMessageParams(phoneNO)

    local res = self:kashang_request(self.APIMethondList.API_GetMessage, tt)
    if res then
        local resTab = cjson.decode(res)
        if resTab and 'true' == resTab['return'] then
            return resTab.code
        end
    end
    return nil
end

function Sunshine:kashang_addBlack( phone )
    -- writeASOLog('Sunshine:kashang_addBlack(' .. phone .. ')')
end

function Sunshine:kashang_releasePhone( phone)
    -- writeASOLog('Sunshine:kashang_releasePhone ' .. tostring(phone) )
end

function Sunshine:kashang_CallbackPhone( phone)
    writeASOLog('Sunshine:kashang_CallbackPhone ' .. tostring(phone) )
    local tt = self.APIParams:getCallbackParams(phone)
    local res = self:kashang_request(self.APIMethondList.API_Callback, tt)
    if res then
        local resTab = cjson.decode(res)
        if resTab and 'ok' == resTab['return'] then
            return true
        end
    end
    return false
end

function Sunshine:kashang_logout( )
    writeASOLog('Sunshine:kashang_logout')
    return true
end

------------------------------------------------- 卡商对象创建与切换 -------------------------------------------
-- local kashangObjIdx = 1
local kashangObjList = {}
function changeKashangObjIdx( idx )
    if idx then
        kashangObjIdx = idx
    else
        local platformCount = #g_config.kashangList
        kashangObjIdx = (kashangObjIdx % platformCount )  + 1
    end
end

function getKashangPlatform( idx )
    idx = idx or kashangObjIdx
    local cfg = g_config.kashangList[idx]
    if 'xiaoxinma' == cfg.platform then
    	return '小新码'
    elseif 'gongxiangyun' == cfg.platform then
        return '共享云'
    elseif 'zhijingma' == cfg.platform then
        return '致敬码'
    elseif 'jindouyun' == cfg.platform then
        return '筋斗云'
    elseif 'guaima' == cfg.platform then
        return '乖码'
    elseif 'dingdongma' == cfg.platform then
        return '叮咚码'
    elseif 'liebaoma' == cfg.platform then
        return '猎豹码'
    elseif 'kekema' == cfg.platform then
        return '可可码'
    elseif 'yema' == cfg.platform then
        return '野马'
    elseif 'xinaima' == cfg.platform then
        return '新爱码'
    elseif 'xinyima' == cfg.platform then
        return '新易码'
    elseif 'feixiangma' == cfg.platform then
        return '飞享码'
    elseif 'sunshine' == cfg.platform then
        return '景维'
    end
    return ''
end

local function createKashangObj( idx, itemName )
    local cfg = g_config.kashangList[kashangObjIdx]
    if 'xiaoxinma' == cfg.platform then
        return KashangClass.new(cfg, itemName)
    elseif 'gongxiangyun' == cfg.platform then
        return KashangGXY.new(cfg, itemName)
    elseif 'xinyima' == cfg.platform or 'liebaoma' == cfg.platform or 'dingdongma' == cfg.platform or 'zhijingma' == cfg.platform or 'xinaima' == cfg.platform or 'feixiangma' == cfg.platform then
        return KashangZJM.new(cfg, itemName)
    elseif 'jindouyun' == cfg.platform then
        return KashangJDY.new(cfg, itemName)
    elseif 'guaima' == cfg.platform then
        return kashangGuaima.new(cfg, itemName)
    elseif 'kekema' == cfg.platform or 'yema' == cfg.platform then
        return JsYzm.new(cfg, itemName)
    elseif 'sunshine' == cfg.platform then
        return Sunshine.new(cfg, itemName)
    end
end

function getKashangClassInstance( itemName )
    for i=1, 2 do
        local cfg = g_config.kashangList[kashangObjIdx]
        if not getItemId(cfg.platform, itemName) then
            changeKashangObjIdx()
        else
            break
        end
    end
    
    -- if itemName and not getItemId('shenhua', itemName) then
    --     changeKashangObjIdx()
    -- end
    if not kashangObjList[kashangObjIdx] then
        kashangObjList[kashangObjIdx] = createKashangObj(kashangObjIdx, itemName)
    elseif itemName then
        kashangObjList[kashangObjIdx]:setItem(itemName)
    end

    return kashangObjList[kashangObjIdx]
end

local KashangError = class()
function KashangError:ctor()
    self.errorDict = {
        [0] = '没有错误',
        [4] = '登录失败',
        [3] = '余额不足',
        [2] = '获取不到手机号码',
        [1] = '获取不到验证码',
    }
    self.errorInfo = {}
    -- for i=1, #g_config.kashangList do
    --     self:setError(i, 0)
    -- end
end

function KashangError:setError( kashangIdx, errorNO )
    if not self.errorInfo[kashangIdx] then
        self.errorInfo[kashangIdx] = {}
    end
    local info = self.errorInfo[kashangIdx]
    info.platform = getKashangPlatform(kashangIdx)
    info.errorNO = errorNO
    info.errorMsg = self.errorDict[errorNO]
end

local KashangErrorObj = nil
function getKashangErrorObj( )
    if not KashangErrorObj then
        KashangErrorObj = KashangError.new()
        -- for i=1, #g_config.kashangList do
        --     KashangErrorObj:setError(i, 0)
        -- end
    end
    return KashangErrorObj
end

--[[
    app 注册类
--]]
AppRegister = class()

function AppRegister:ctor()
    self.sendRegisterCode = nil -- 输入号码，点下一步，接收验证码
    self.inputRegisterCode = nil --输入验证码，完成注册
    self.returnFirstPage = nil --回到输入电话号码页
    self.bLogin = nil
end

function AppRegister:getRegisterCode( kashangObj, phone, strFormat )
    self.msgTimeout = self.msgTimeout or 70
    local beginTime = os.time()
    while (true) do
        local msg = kashangObj:kashang_getMessage(phone)
        if msg then
            if strFormat then
                local _bgn, _end = string.find(msg, strFormat)
                if _bgn then
                    return string.sub(msg, _bgn, _end)
                else
                    return ""
                end
            else
                return msg
            end
        elseif not kashangObj:getToken() then
            break
        elseif os.time() - beginTime >= self.msgTimeout then
            kashangObj:kashang_addBlack(phone)
            kashangObj:kashang_releasePhone(phone)
            break
        else
            mSleep(8 * 1000)
        end
    end
end

function AppRegister:logout_kashang(  )
    if self.bLogin then
        getKashangClassInstance():kashang_logout()
        self.bLogin = nil
    end
end

function AppRegister:doRegister(itemName, strFormat, phoneType, bValidate, logoutBySelf, phoneNO, acceptOtherPhone, notRetry )
    local bRetryed = false
    local function login_kashang( )
        writeASOLog('login_kashang')
        local kashangObj = nil
        local kashangCount = #g_config.kashangList
        repeat
            kashangObj = getKashangClassInstance(itemName)
            getKashangErrorObj():setError(kashangObjIdx, 0)
            local bLogin, bal = kashangObj:kashang_login()

            if not bLogin then
                kashangObj = nil
                getKashangErrorObj():setError(kashangObjIdx, 4)
                changeKashangObjIdx()
            elseif bal then
                kashangObj:kashang_logout()
                kashangObj = nil
                getKashangErrorObj():setError(kashangObjIdx, 3)
                changeKashangObjIdx()
            else
                break
            end
            kashangCount = kashangCount - 1
        until(kashangCount <= 0)
        return kashangObj
    end
    if '景维' == getKashangPlatform() then
        self.msgTimeout = 180
    elseif ksItemNames.ks_xiaozhuduanzu == itemName then
        self.msgTimeout = 120
    end
    phoneStatList = phoneStatList or {}
    self:logout_kashang()
    local EMa = login_kashang()
    if not EMa then
        registerErrorcode = 4008
        return false
    else
        self.bLogin = true
    end
    local invaildPhone = 0
    local failToGetPhone = 0
    local retryTimes = 0
    local retryInterval = 10
    local bRet = false
    if notRetry then
    	retryTimes = 4
    end
    while (true) do
        if retryTimes >=5 or failToGetPhone >= 8 then
            if phoneNO and not bRetryed then
                registerErrorcode = 0
                bRetryed = true
                if acceptOtherPhone then
                    writeASOLog('不使用指定号码尝试一遍')
                    phoneNO = nil
                else
                    writeASOLog('使用指定号码再尝试一遍')
                end
                failToGetPhone = 0
            else
                writeASOLog('注册失败')
                registerErrorcode = 4005
                break
            end
        end
        if not self.returnFirstPage() then
            registerErrorcode = 4009
            break
        end

        local phone = EMa:kashang_getPhone(phoneType, phoneNO, bValidate)
        if not EMa:getToken() then
            writeASOLog('sesion 过期，重新登陆')
            EMa = login_kashang()
            if not EMa then
                registerErrorcode = 4008
                break
            end
        end
        if type(phone) == 'string' then
            phone = phone
        else
            phone = phone and phone[1]
        end
        writeASOLog('phone: ' .. tostring(phone) )
        if not phone or 11~=string.len(phone) or not tonumber(phone) then
            failToGetPhone = failToGetPhone + 1
            if failToGetPhone % 3 == 0 then
                reconnectVPN()
            end
            writeASOLog('获取号码失败')
            mSleep(retryInterval * 1000)
            -- retryInterval = retryInterval<120 and 2*retryInterval or retryInterval
        -- elseif bValidate and not EMa:isValidPhoneNO(phone) then
        --     invaildPhone = invaildPhone + 1
        --     EMa:kashang_addBlack(phone)
        --     EMa:kashang_releasePhone(phone)
        --     if invaildPhone >= 5 then
        --         bValidate = false
        --     end
        else
            retryInterval = 30
            local phoneStatInfo = { getMessage = 0 }
            phoneStatInfo['phoneNO'] = phone
            phoneStatInfo['getTime'] = os.time()
            phoneStatInfo['platform'] = getKashangPlatform()
            table.insert(phoneStatList, phoneStatInfo)
            if not self.sendRegisterCode(phone) then
                if registerErrorcode and registerErrorcode > 0 then
                    EMa:kashang_releasePhone(phone)
                    break
                else
                    writeASOLog('sendRegisterCode 超时')
                    EMa:kashang_releasePhone(phone)
                    -- EMa:kashang_releasePhone(phone)
                    retryTimes = retryTimes + 1
                end
            else
                retryTimes = retryTimes + 1
                local registerCode = self:getRegisterCode(EMa, phone, strFormat)
                toast('registerCode: ' .. tostring(registerCode) )
                phoneStatInfo.getMessage = registerCode and 1 or 0
                if registerCode then
                    if string.len(registerCode) == 0 then
                        registerErrorcode = 4018
                        EMa:kashang_releasePhone(phone)
                        break
                    elseif self.inputRegisterCode(registerCode) then
                        if EMa.kashang_CallbackPhone then
                            EMa:kashang_CallbackPhone(phone)
                        end
                        bRet = true
                        break
                    elseif not phoneNO and (4016 == registerErrorcode or 4019 == registerErrorcode) then
                        registerErrorcode = 0
                        EMa:kashang_addBlack(phone)
                    elseif 4018 == registerErrorcode and not bRetryed then
                        registerErrorcode = 0
                        bRetryed = true
                        EMa:kashang_releasePhone(phone)
                        failToGetPhone = 0
                    else
                        if not registerErrorcode or 0 == registerErrorcode then
                            registerErrorcode = 4009
                        end
                        EMa:kashang_releasePhone(phone)
                        break
                    end
                end
            end
        end
    end
    if #phoneStatList > 0 then
        local bGotAMsg = false
        for i,v in ipairs(phoneStatList) do
            if v.getMessage > 0 then
                bGotAMsg = true
                break
            end
        end
        if not bGotAMsg then
            getKashangErrorObj():setError(kashangObjIdx, 1)
        end
    elseif failToGetPhone > 0 then
        getKashangErrorObj():setError(kashangObjIdx, 2)
    end
    if not logoutBySelf and EMa then
        EMa:kashang_logout()
        self.bLogin = nil
    end
    return bRet
end
