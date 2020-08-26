g_config = {
	taskTimeLimit = 1740,
    VPNDesc = '--youwei',
    appStore = 'com.apple.AppStore',
    applePreferences = 'com.apple.Preferences',
    appBakPath = '/User/Media/YouWeiBackup/',
	log_path = '/User/Media/YouWei/log/',
    tokenTableFile = '/User/Media/YouWei/log/kashangTokens',
    httpAddress = 'http://c.wwaso.com/CpaPollingSever/updateActiveLog',
    getTaskApi = 'http://c.wwaso.com/CpaPollingSever/getData',
    getAppleIdApi = 'http://c.wwaso.com/CpaPollingSever/getAppleInfo',
    disableAppid = 'http://c.wwaso.com/CpaPollingSever/updateAppleStatus',
    UserAgent = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36',
   
    ipServer = 'http://pv.sohu.com/cityjson?ie=utf-8', 
    -- pluginList = {
    --     {pluginURL = 'http://yqz.oss-cn-shanghai.aliyuncs.com/script/YWBasTweak.dylib', localPath = '/Library/MobileSubstrate/DynamicLibraries/YWBasTweak.dylib', pluginMD5 = 'a9e1ae59f8474610b9c71d99c25d0323'},
    --     {pluginURL = 'http://yqz.oss-cn-shanghai.aliyuncs.com/script/yi_tools.deb', localPath = '/User/Media/YouWei/res/yi_tools.deb', pluginMD5 = '403b6f6d25030fdc57a186fe00b37408'},
    --     {pluginURL = 'http://yqz.oss-cn-shanghai.aliyuncs.com/script/YWFakeTweak.dylib', localPath = '/Library/MobileSubstrate/DynamicLibraries/YWFakeTweak.dylib', pluginMD5 = '14959d6a936370b8c1e323f491c50693'},
    --     {pluginURL = 'http://yqz.oss-cn-shanghai.aliyuncs.com/script/yw.so', localPath = '/var/mobile/Media/YouWei/plugin/yw.so', pluginMD5 = 'cfcbe816d968e29258f57110c58f7c1d'},
    --     {pluginURL = 'http://yqz.oss-cn-shanghai.aliyuncs.com/script/YWVPN.dylib', localPath = '/Library/MobileSubstrate/DynamicLibraries/YWVPN.dylib', pluginMD5 = '4028a8753704baa1a14fc0fe7aa1c5e3'},
    --     {pluginURL = 'http://yqz.oss-cn-shanghai.aliyuncs.com/script/zip', localPath = '/usr/bin/zip', pluginMD5 = 'c302aefd912342792cd02195d0a4ab76'},
    --     {pluginURL = 'http://yqz.oss-cn-shanghai.aliyuncs.com/script/unzip', localPath = '/usr/bin/unzip', pluginMD5 = '6c634f12b228d516293281bc4ea45abd'},
    --     {pluginURL = 'http://yqz.oss-cn-shanghai.aliyuncs.com/script/ping', localPath = '/usr/bin/ping', pluginMD5 = '228d80b230696cce53c5060b05b54191'},
    -- },
    checkCodeList = {
        -- {platform = 'yundama', account = '332439409', password = '159987', softid = '4094', codetype = "4105", appkey = 'e0d4cb413410adc5b5aee77cae0916b1' },
        -- {platform = 'lianzhong', account = 'apple2020', password = 'qwer@1234', softid = 'q332439409', codetype = "1115" },
        -- {platform = 'cjy', account = '332439409', password = 'ab0ac389dc0ad7a7266ad4a2ca67cdc2', softid = '893911', codetype = '4005'},
    },
    kashangList = {
        {platform = 'jindouyun', APIAdress = 'http://openapi.92jindou.com/api', userName = 'apple2000', password = 'apple2020', developer = 'apple2000'},
       
        -- {platform = 'xinyima', APIAdress = 'http://203.195.147.231:8000', userName = 'yw2018', password = 'yw123123', developer = 'yw2018'},
        -- {platform = 'jindouyun', APIAdress = 'http://openapi.92jindou.com/api', userName = 'yw2018', password = 'yw123123', developer = 'yw2018'},
        -- {platform = 'zhijingma', APIAdress = 'http://api.zhijing888.com', userName = 'yw2018', password = '123123', developer = 'yw2018'},
        -- {platform = 'guaima', APIAdress = 'http://14.29.50.91:8080/api.php', userName = 'vTHjRVJ05474-EVrJw', password = 'yw123123', developer = 'yw2018'},
        -- {platform = 'dingdongma', APIAdress = 'http://49.234.69.192:8001', userName = 'yw2018', password = 'yw123123', developer = 'yw2018'},
        -- {platform = 'liebaoma', APIAdress = 'http://154.202.13.56:8000', userName = 'yw2018', password = 'yw123123', developer = 'yw2018'},
        -- {platform = 'kekema', APIAdress = 'http://dkh.hfsxf.com:81/service.asmx', userName = 'yw2018', password = 'yw123123', developer = ''},
        -- {platform = 'gongxiangyun', APIAdress = 'http://www.gxyjm.com/yhapi.ashx', userName = 'api_yw2018_e88', password = 'yw123123', developer = 'yw2018'},
        
        
    },
    -- chaorenyunCfg = {platform = 'chaorenyun', account = 'q332439409', password = '1599877', softid = '68617', codetype = ''}, --仅支持滑块验证码，单独配置
   
}
--[[
    试玩配置，是否有独立的试玩脚本，是否支持plus，是否支持iPhoneX
--]]
g_config.testPlayScript = {
    [1523426423] = true,                 -- 乌合之众
    [1525825614] = true,                 -- Deep Water Adventures
    [1526248376] = true,                 --Cute Bird Jelly
}
function g_config.getRegisterRatio( appBid )
    return g_config.registerRatioServer or 0
end


function g_config.supportPlusDevice( appId )
    local tt = g_config.testPlayScript[appId]
    if 'table' == type(tt) and tt.PlusDevice then
        return true
    end
    return false
end

function g_config.supportIphoneX( appId )
    local tt = g_config.testPlayScript[appId]
    if 'table' == type(tt) and tt.iPhoneX then
        return true
    end
    return false
end

function g_config.supportIphoneXR( appId )
    local tt = g_config.testPlayScript[appId]
    if 'table' == type(tt) and tt.iPhoneXR then
        return true
    end
    return false
end

function g_config.supportIphoneXSMax( appId )
    local tt = g_config.testPlayScript[appId]
    if 'table' == type(tt) and tt.iPhoneXSMax then
        return true
    end
    return false
end
g_config.openURLSuccess = {
    -- [1113268900] = {0xfe6736, "64|-7|0xff6a33,75|20|0xf85d24,63|71|0xe54b1b,131|-5|0xfe6e2a,123|71|0xfb4518,173|67|0xe74b16,217|-9|0xff6f29,216|70|0xf3470f,277|65|0xf24e0f", 90, 103, 162, 683, 498, '趣头条H5点击'},
    -- [561859697] = {0xed0000, "22|17|0xfffee6,22|20|0xf20000,22|27|0xf5fff1,53|36|0xf7f9ee,57|36|0xed0000,69|36|0xffffeb,103|36|0xfffffd,109|36|0xf10000,113|36|0xf1fff4", 90, 446, 43, 749, 261, '丝芙兰H5点击'},
    -- [1473821983] = {0x000000, "24|3|0x02b24e,26|8|0xff6d00,28|18|0xf7b500,38|32|0x231815,44|33|0xf5b400,27|43|0x231815,23|48|0xf6b400,34|47|0xf7b500", 90, 36, 75, 323, 320, '看球大师H5点击'},
    -- [1475056193] = {0x000000, "24|3|0x02b24e,26|8|0xff6d00,28|18|0xf7b500,38|32|0x231815,44|33|0xf5b400,27|43|0x231815,23|48|0xf6b400,34|47|0xf7b500", 90, 36, 75, 323, 320, '去看球H5点击'},
    [1275442509] = {0xf9712a, "1|2|0xffffff,-3|24|0xffffff,0|24|0xf9712a,5|24|0xfff8f5,15|29|0xffffff,18|29|0xf9712a,112|16|0xf9712a,112|21|0xffffff,121|27|0xf9712a", 90, 44, 712, 728, 974,'水滴保险商城'},
}
g_config.iosVersionCfg = {
    [1235469329] = {7, 9},
    [942443472] = {1,6},  --最右ios12
    [1093693053] = {1,6},   --荔枝FM
    [387682726] = {10,10},
    -- [395133418] = {1,3},
    [1152363753] = {7,10},
    [502804922] = {10,10}, ---折800
    -- [559977766] = {2,10}, ---懒人听书
    -- [1322331084] = {2,10}, --新氧
    -- [592331499] = {2,10}, --美颜相机
    -- [395133418] = {2,10}, --凤凰新闻
    -- [566258991] = {2,10}, --kk直播
    -- [1308838222] = {2,10},
    -- [1016323413] = {2,10}, --得到
    [1195055909] = {1,9}, --绿叶浏览器
    -- [582204969] = {2,10},
    [1466592993] = {10,10}, --兔几直播
    -- [510909506] = {10,10}, --咸鱼
    -- [487608658] = {2,10},   --qq阅读
    -- [987381870] = {2,10},
    -- [1454487240] = {2,10}, --得间小说
    -- [1037589370] = {2,10}, --无忧行
    -- [1228049107] = {2,10}, --畅阅小说
    -- [1467183280] = {2,10}, --游戏云咖
    -- [432274380] = {2,10},  --知乎
    -- [1423061888] = {2,10}, --皮皮搞笑
    -- [1468422875] = {2,10}, --小蓝本
    -- [1261299076] = {2,10}, --饭团追书
    -- [379395415] = {2,10},  --携程
    -- [1142490639] = {2,10}, --青果
    -- [733689509] = {2, 10}, --书旗小说
    -- [668533031] = {2, 10}, --洋码头
    -- [1422277670] = {2, 10}, --百瓶
    -- [1440737046] = {2, 10}, --爱看小说阅读器
    -- [1441757824] = {2, 10}, --一伴
    -- [597364850] = {2,10},  --英语流利说
    -- [1181251682] = {2,10}, --屈臣氏
    
     -- [1435478035] = {10,10},  --流利阅读
    
    
}
g_config.deviceSystemInfo = {
    ['10.0']    = {DarwinVersion = '16.0.0', DarwinBuild = 'Darwin Kernel Version 16.0.0: Wed Aug 10 22:33:10 PDT 2016; root:xnu-3789.2.2~3/RELEASE_ARM64', BuildVersion = '14A346', UASafariVer = '602.1', UAAppleWebKitVer = '602.1.38', UAFirmwareVer = '14A300', UAMobileVer = '10.0'},
    ['10.0.1']  = {DarwinVersion = '16.0.0', DarwinBuild = 'Darwin Kernel Version 16.0.0: Sun Aug 28 20:36:54 PDT 2016; root:xnu-3789.2.4~3/RELEASE_ARM64', BuildVersion = '14A403', UASafariVer = '602.1', UAAppleWebKitVer = '602.1.50', UAFirmwareVer = '14A403', UAMobileVer = '10.0'},
    ['10.0.2']  = {DarwinVersion = '16.0.0', DarwinBuild = 'Darwin Kernel Version 16.0.0: Sun Aug 28 20:36:54 PDT 2016; root:xnu-3789.2.4~3/RELEASE_ARM64', BuildVersion = '14A456', UASafariVer = '602.1', UAAppleWebKitVer = '602.1.50', UAFirmwareVer = '14A456',  UAMobileVer = '10.0'},
    ['10.0.3']  = {DarwinVersion = '16.0.0', DarwinBuild = 'Darwin Kernel Version 16.0.0: Sun Aug 28 20:36:54 PDT 2016; root:xnu-3789.2.4~3/RELEASE_ARM64', BuildVersion = '14A551', UASafariVer = '602.1', UAAppleWebKitVer = '602.1.50', UAFirmwareVer = '14A551', UAMobileVer = '10.0'},
    ['10.1']    = {DarwinVersion = '16.1.0', DarwinBuild = 'Darwin Kernel Version 16.1.0: Thu Sep 29 21:56:12 PDT 2016; root:xnu-3789.22.3~1/RELEASE_ARM64', BuildVersion = '14B72/14B72C', UASafariVer = '602.1', UAAppleWebKitVer = '602.2.14', UAFirmwareVer = '14B72/14B72C', UAMobileVer = '10.0'},
    ['10.1.1']  = {DarwinVersion = '16.1.0', DarwinBuild = 'Darwin Kernel Version 16.1.0: Thu Sep 29 21:56:12 PDT 2016; root:xnu-3789.22.3~1/RELEASE_ARM64', BuildVersion = '14B100/14B150', UASafariVer = '602.1', UAAppleWebKitVer = '602.2.14', UAFirmwareVer = '14B100/14B150', UAMobileVer = '10.0'},
    ['10.2']    = {DarwinVersion = '16.3.0', DarwinBuild = 'Darwin Kernel Version 16.3.0: Tue Nov 29 21:40:09 PST 2016; root:xnu-3789.32.1~4/RELEASE_ARM64', BuildVersion = '14C92', UASafariVer = '602.1', UAAppleWebKitVer = '602.3.12', UAFirmwareVer = '14C92', UAMobileVer = '10.0'},
    ['10.2.1']  = {DarwinVersion = '16.3.0', DarwinBuild = 'Darwin Kernel Version 16.3.0: Thu Dec 15 22:41:46 PST 2016; root:xnu-3789.42.2~1/RELEASE_ARM64', BuildVersion = '14D27', UASafariVer = '602.1', UAAppleWebKitVer = '602.4.6',  UAFirmwareVer = '14D27', UAMobileVer = '10.0'},
    ['10.3']    = {DarwinVersion = '16.5.0', DarwinBuild = 'Darwin Kernel Version 16.5.0: Thu Feb 23 23:22:54 PST 2017; root:xnu-3789.52.2~7/RELEASE_ARM64', BuildVersion = '14E277', UASafariVer = '602.1', UAAppleWebKitVer = '603.1.30', UAFirmwareVer = '14E277', UAMobileVer = '10.0'},
    ['10.3.1']  = {DarwinVersion = '16.5.0', DarwinBuild = 'Darwin Kernel Version 16.5.0: Thu Feb 23 23:22:54 PST 2017; root:xnu-3789.52.2~7/RELEASE_ARM64', BuildVersion = '14E304', UASafariVer = '602.1', UAAppleWebKitVer = '603.1.30', UAFirmwareVer = '14E304', UAMobileVer = '10.0'},
    ['10.3.2']  = {DarwinVersion = '16.6.0', DarwinBuild = 'Darwin Kernel Version 16.6.0: Mon Apr 17 17:33:34 PDT 2017; root:xnu-3789.60.24~24/RELEASE_ARM64', BuildVersion = '14F89/14F90/14F91', UASafariVer = '602.1', UAAppleWebKitVer = '603.2.4 ', UAFirmwareVer = '14F89/14F90/14F91', UAMobileVer = '10.0'},
    ['10.3.3']  = {DarwinVersion = '16.7.0', DarwinBuild = 'Darwin Kernel Version 16.7.0: Thu Jun 15 18:33:36 PDT 2017; root:xnu-3789.70.16~4/RELEASE_ARM64', BuildVersion = '14G60', UASafariVer = '602.1', UAAppleWebKitVer = '603.3.8', UAFirmwareVer = '14G60', UAMobileVer = '10.0'},
    ['11.0']    = {DarwinVersion = '17.0.0', DarwinBuild = 'Darwin Kernel Version 17.0.0: Fri Sep 1 14:59:17 PDT 2017; root:xnu-4570.2.5~167/RELEASE_ARM64', BuildVersion = '15A372', UASafariVer = '602.1', UAAppleWebKitVer = '604.1.38', UAFirmwareVer = '15A372', UAMobileVer = '11.0'},
    ['11.0.1']  = {DarwinVersion = '17.0.0', DarwinBuild = 'Darwin Kernel Version 17.0.0: Fri Sep 1 14:59:17 PDT 2017; root:xnu-4570.2.5~167/RELEASE_ARM64', BuildVersion = '15A402/15A403/15A8391', UASafariVer = '604.1', UAAppleWebKitVer = '604.1.38', UAFirmwareVer = '15A402/15A403/15A8391', UAMobileVer = '11.0'},
    ['11.0.2']  = {DarwinVersion = '17.0.0', DarwinBuild = 'Darwin Kernel Version 17.0.0: Fri Sep 1 14:59:17 PDT 2017; root:xnu-4570.2.5~167/RELEASE_ARM64', BuildVersion = '15A421', UASafariVer = '604.1', UAAppleWebKitVer = '604.1.38', UAFirmwareVer = '15A421', UAMobileVer = '11.0'},
    ['11.0.3']  = {DarwinVersion = '17.0.0', DarwinBuild = 'Darwin Kernel Version 17.0.0: Fri Sep 1 14:59:17 PDT 2017; root:xnu-4570.2.5~167/RELEASE_ARM64', BuildVersion = '15A432', UASafariVer = '604.1', UAAppleWebKitVer = '604.1.38', UAFirmwareVer = '15A432', UAMobileVer = '11.0'},
    ['11.1']    = {DarwinVersion = '17.2.0', DarwinBuild = 'Darwin Kernel Version 17.2.0: Fri Sep 29 18:14:51 PDT 2017; root:xnu-4570.20.62~4/RELEASE_ARM64', BuildVersion = '15B93/15B101', UASafariVer = '604.1', UAAppleWebKitVer = '604.3.5 ', UAFirmwareVer = '15B93', UAMobileVer = '11.0'},
    ['11.1.1']  = {DarwinVersion = '17.2.0', DarwinBuild = 'Darwin Kernel Version 17.2.0: Fri Sep 29 18:14:51 PDT 2017; root:xnu-4570.20.62~4/RELEASE_ARM64', BuildVersion = '15B150', UASafariVer = '604.1', UAAppleWebKitVer = '604.3.5', UAFirmwareVer = '15B150', UAMobileVer = '11.0'},
    ['11.1.2']  = {DarwinVersion = '17.2.0', DarwinBuild = 'Darwin Kernel Version 17.2.0: Fri Sep 29 18:14:51 PDT 2017; root:xnu-4570.20.62~4/RELEASE_ARM64', BuildVersion = '15B202', UASafariVer = '604.1', UAAppleWebKitVer = '604.3.5', UAFirmwareVer = '15B202', UAMobileVer = '11.0'},
    ['11.2']    = {DarwinVersion = '17.3.0', DarwinBuild = 'Darwin Kernel Version 17.3.0: Mon Nov 6 21:19:16 PST 2017; root:xnu-4570.32.1~1/RELEASE_ARM64', BuildVersion = '15C114', UASafariVer = '604.1', UAAppleWebKitVer = '604.4.7', UAFirmwareVer = '15C114', UAMobileVer = '11.0'},
    ['11.2.1']  = {DarwinVersion = '17.3.0', DarwinBuild = 'Darwin Kernel Version 17.3.0: Mon Nov 6 21:19:16 PST 2017; root:xnu-4570.32.1~1/RELEASE_ARM64', BuildVersion = '15C153', UASafariVer = '604.1', UAAppleWebKitVer = '604.4.7', UAFirmwareVer = '15C153', UAMobileVer = '11.0'},
    ['11.2.2']  = {DarwinVersion = '17.3.0', DarwinBuild = 'Darwin Kernel Version 17.3.0: Mon Nov 6 21:19:16 PST 2017; root:xnu-4570.32.1~1/RELEASE_ARM64', BuildVersion = '15C202', UASafariVer = '604.1', UAAppleWebKitVer = '604.4.7', UAFirmwareVer = '15C202', UAMobileVer = '11.0'},
    ['11.2.5']  = {DarwinVersion = '17.4.0', DarwinBuild = 'Darwin Kernel Version 17.4.0: Fri Dec 8 19:35:51 PST 2017; root:xnu-4570.40.9~1/RELEASE_ARM64', BuildVersion = '15D60', UASafariVer = '604.1', UAAppleWebKitVer = '604.5.6', UAFirmwareVer = '15D60', UAMobileVer = '11.0'},
    ['11.2.6']  = {DarwinVersion = '17.4.0', DarwinBuild = 'Darwin Kernel Version 17.4.0: Fri Dec 8 19:35:51 PST 2017; root:xnu-4570.40.9~1/RELEASE_ARM64', BuildVersion = '15D100', UASafariVer = '604.1', UAAppleWebKitVer = '604.5.6', UAFirmwareVer = '15D100', UAMobileVer = '11.0'},
    ['11.3']    = {DarwinVersion = '17.5.0', DarwinBuild = 'Darwin Kernel Version 17.5.0: Tue Mar 13 21:32:11 PDT 2018; root:xnu-4570.52.2~8/RELEASE_ARM64', BuildVersion = '15E216/15E218', UASafariVer = '604.1', UAAppleWebKitVer = '605.1.15', UAFirmwareVer = '15E148', UAMobileVer = '11.0'},
    ['11.3.1']  = {DarwinVersion = '17.5.0', DarwinBuild = 'Darwin Kernel Version 17.5.0: Tue Mar 13 21:32:11 PDT 2018; root:xnu-4570.52.2~8/RELEASE_ARM64', BuildVersion = '15E302', UASafariVer = '604.1', UAAppleWebKitVer = '605.1.15', UAFirmwareVer = '15E148', UAMobileVer = '11.0'},
    ['11.4']    = {DarwinVersion = '17.6.0', DarwinBuild = 'Darwin Kernel Version 17.6.0: Mon Apr 30 18:48:32 PDT 2018; root:xnu-4570.60.21~3/RELEASE_ARM64', BuildVersion = '15F79', UASafariVer = '604.1', UAAppleWebKitVer = '605.1.15', UAFirmwareVer = '15E148', UAMobileVer = '11.0'},
    ['11.4.1']  = {DarwinVersion = '17.7.0', DarwinBuild = 'Darwin Kernel Version 17.7.0: Mon Jun 11 19:06:27 PDT 2018; root:xnu-4570.70.24~3/RELEASE_ARM64', BuildVersion = '15G77', UASafariVer = '604.1', UAAppleWebKitVer = '605.1.15', UAFirmwareVer = '15E148', UAMobileVer = '11.0'},
    ['12.0']    = {DarwinVersion = '18.0.0', DarwinBuild = 'Darwin Kernel Version 18.0.0: Tue Aug 14 22:07:16 PDT 2018; root:xnu-4903.202.2~1/RELEASE_ARM64', BuildVersion = '16A366', UASafariVer = '604.1', UAAppleWebKitVer = '605.1.15', UAFirmwareVer = '15E148', UAMobileVer = '12.0'},
    ['12.0.1']  = {DarwinVersion = '18.0.0', DarwinBuild = 'Darwin Kernel Version 18.0.0: Tue Aug 14 22:07:16 PDT 2018; root:xnu-4903.202.2~1/RELEASE_ARM64', BuildVersion = '16A404/16A405', UASafariVer = '604.1', UAAppleWebKitVer = '605.1.15', UAFirmwareVer = '15E148', UAMobileVer = '12.0'}, 
    ['12.1']    = {DarwinVersion = '18.2.0', DarwinBuild = 'Darwin Kernel Version 18.2.0: Tue Oct 16 21:02:33 PDT 2018; root:xnu-4903.222.5~1/RELEASE_ARM64', BuildVersion = '16B92/16B93/16B94', UASafariVer = '604.1', UAAppleWebKitVer = '605.1.15', UAFirmwareVer = '15E148', UAMobileVer = '12.0'},
    ['12.1.1']  = {DarwinVersion = '18.2.0', DarwinBuild = 'Darwin Kernel Version 18.2.0: Mon Nov 12 20:32:01 PST 2018; root:xnu-4903.232.2~1/RELEASE_ARM64', BuildVersion = '16C50', UASafariVer = '604.1', UAAppleWebKitVer = '605.1.15', UAFirmwareVer = '15E148', UAMobileVer = '12.0'},
    ['12.1.2']  = {DarwinVersion = '18.2.0', DarwinBuild = 'Darwin Kernel Version 18.2.0: Mon Nov 12 20:32:01 PST 2018; root:xnu-4903.232.2~1/RELEASE_ARM64', BuildVersion = '16C101', UASafariVer = '604.1', UAAppleWebKitVer = '605.1.15', UAFirmwareVer = '15E148', UAMobileVer = '12.0'},
    ['12.1.3']  = {DarwinVersion = '18.2.0', DarwinBuild = 'Darwin Kernel Version 18.2.0: Wed Dec 19 20:28:53 PST 2018; root:xnu-4903.242.2~1/RELEASE_ARM64', BuildVersion = '16D39/16D40', UASafariVer = '604.1', UAAppleWebKitVer = '605.1.15', UAFirmwareVer = '15E148', UAMobileVer = '12.0'},
    ['12.1.4']  = {DarwinVersion = '18.2.0', DarwinBuild = 'Darwin Kernel Version 18.2.0: Wed Dec 19 20:28:53 PST 2018; root:xnu-4903.242.2~1/RELEASE_ARM64', BuildVersion = '16D57', UASafariVer = '604.1', UAAppleWebKitVer = '605.1.15', UAFirmwareVer = '15E148', UAMobileVer = '12.0'},
    ['12.2']    = {DarwinVersion = '18.5.0', DarwinBuild = 'Darwin Kernel Version 18.5.0: Tue Mar 5 19:52:18 PST 2019; root:xnu-4903.252.2~1/RELEASE_ARM64', BuildVersion = '16E227', UASafariVer = '604.1', UAAppleWebKitVer = '605.1.15', UAFirmwareVer = '15E148', UAMobileVer = '12.1'},
    ['12.3']    = {DarwinVersion = '18.6.0', DarwinBuild = 'Darwin Kernel Version 18.6.0: Thu Apr 25 22:14:10 PDT 2019; root:xnu-4903.262.2~2/RELEASE_ARM64', BuildVersion = '16F156', UASafariVer = '604.1', UAAppleWebKitVer = '605.1.15', UAFirmwareVer = '15E148', UAMobileVer = '12.1.1'},
    ['12.3.1']  = {DarwinVersion = '18.6.0', DarwinBuild = 'Darwin Kernel Version 18.6.0: Thu Apr 25 22:14:10 PDT 2019; root:xnu-4903.262.2~2/RELEASE_ARM64', BuildVersion = '16F203', UASafariVer = '604.1', UAAppleWebKitVer = '605.1.15', UAFirmwareVer = '15E148', UAMobileVer = '12.1.1'},
    ['12.3.2']  = {DarwinVersion = '18.6.0', DarwinBuild = 'Darwin Kernel Version 18.6.0: Thu Apr 25 22:14:08 PDT 2019; root:xnu-4903.262.2~2/RELEASE_ARM64', BuildVersion = '16F250', UASafariVer = '604.1', UAAppleWebKitVer = '605.1.15', UAFirmwareVer = '15E148', UAMobileVer = '12.1.1'},
    ['12.4']    = {DarwinVersion = '18.7.0', DarwinBuild = 'Darwin Kernel Version 18.7.0: Fri Jun 21 22:24:16 PDT 2019; root:xnu-4903.270.47~7/RELEASE_ARM64', BuildVersion = '16G77', UASafariVer = '604.1', UAAppleWebKitVer = '605.1.15', UAFirmwareVer = '15E148', UAMobileVer = '12.1.2'},
    ['12.4.1']  = {DarwinVersion = '18.7.0', DarwinBuild = 'Darwin Kernel Version 18.7.0: Mon Aug 19 22:24:08 PDT 2019; root:xnu-4903.272.1~1/RELEASE_ARM64', BuildVersion = '16G102', UASafariVer = '604.1', UAAppleWebKitVer = '605.1.15', UAFirmwareVer = '15E148', UAMobileVer = '12.1.2'},
    ['12.4.2']  = {DarwinVersion = '18.7.0', DarwinBuild = 'Darwin Kernel Version 18.7.0: Mon Aug 19 22:24:08 PDT 2019; root:xnu-4903.272.1~1/RELEASE_ARM64', BuildVersion = '16G114', UASafariVer = '604.1', UAAppleWebKitVer = '605.1.15', UAFirmwareVer = '15E148', UAMobileVer = '12.1.2'},
    ['12.4.5']  = {DarwinVersion = '18.7.0', DarwinBuild = 'Darwin Kernel Version 18.7.0: Mon Aug 19 22:24:08 PDT 2019; root:xnu-4903.272.1~1/RELEASE_ARM64', BuildVersion = '16G161', UASafariVer = '604.1', UAAppleWebKitVer = '605.1.15', UAFirmwareVer = '15E148', UAMobileVer = '12.1.2'},
    ['13.0']    = {DarwinVersion = '19.0.0', DarwinBuild = 'Darwin Kernel Version 19.0.0: Tue Sep 3 21:52:10 PDT 2019; root:xnu-6153.2.3~2/RELEASE_ARM64', BuildVersion = '17A577', UASafariVer = '604.1', UAAppleWebKitVer = '605.1.15', UAFirmwareVer = '15E148', UAMobileVer = '13.0'},
    ['13.1']    = {DarwinVersion = '19.0.0', DarwinBuild = 'Darwin Kernel Version 19.0.0: Tue Sep 3 21:52:10 PDT 2019; root:xnu-6153.2.3~2/RELEASE_ARM64', BuildVersion = '17A844', UASafariVer = '604.1', UAAppleWebKitVer = '605.1.15', UAFirmwareVer = '15E148', UAMobileVer = '13.0.1'},
    ['13.1.1']  = {DarwinVersion = '19.0.0', DarwinBuild = 'Darwin Kernel Version 19.0.0: Tue Sep 3 21:52:10 PDT 2019; root:xnu-6153.2.3~2/RELEASE_ARM64', BuildVersion = '17A854', UASafariVer = '604.1', UAAppleWebKitVer = '605.1.15', UAFirmwareVer = '15E148', UAMobileVer = '13.0.1'},
    ['13.1.2']  = {DarwinVersion = '19.0.0', DarwinBuild = 'Darwin Kernel Version 19.0.0: Tue Sep 3 21:52:14 PDT 2019; root:xnu-6153.2.3~2/RELEASE_ARM64', BuildVersion = '17A861', UASafariVer = '604.1', UAAppleWebKitVer = '605.1.15', UAFirmwareVer = '15E148', UAMobileVer = '13.0.1'},
    ['13.1.3']  = {DarwinVersion = '19.0.0', DarwinBuild = 'Darwin Kernel Version 19.0.0: Tue Sep 3 21:52:10 PDT 2019; root:xnu-6153.2.3~2/RELEASE_ARM64', BuildVersion = '17A878', UASafariVer = '604.1', UAAppleWebKitVer = '605.1.15', UAFirmwareVer = '15E148', UAMobileVer = '13.0.1'},
    ['13.3']    = {DarwinVersion = '19.2.0', DarwinBuild = 'Darwin Kernel Version 19.2.0: Mon Nov 4 17:45:11 PST 2019; root:xnu-6153.60.66~39/RELEASE_ARM64', BuildVersion = '17C54', UASafariVer = '604.1', UAAppleWebKitVer = '605.1.15', UAFirmwareVer = '15E148', UAMobileVer = '13.0.4'},
    ['13.3.1']  = {DarwinVersion = '19.3.0', DarwinBuild = 'Darwin Kernel Version 19.3.0: Tue Jan 9 21:11:29 PST 2020; root:xnu-6153.82.3~1/RELEASE_ARM64', BuildVersion = '17D50', UASafariVer = '604.1', UAAppleWebKitVer = '605.1.15', UAFirmwareVer = '15E148', UAMobileVer = '13.0.5'},
}

g_config.CFNetworkVersions = {
    ['10.0']    = nil, 
    ['10.0.1']  = {'808.0.2', 3}, 
    ['10.0.2']  = nil, 
    ['10.0.3']  = nil, 
    ['10.1']    = {'808.1.4', 3}, 
    ['10.1.1']  = nil, 
    ['10.2']    = nil, 
    ['10.2.1']  = nil, 
    ['10.3']    = nil, 
    ['10.3.1']  = nil, 
    ['10.3.2']  = nil, 
    ['10.3.3']  = nil, 
    ['11.0']    = nil, 
    ['11.0.1']  = nil, 
    ['11.0.2']  = nil, 
    ['11.0.3']  = nil, 
    ['11.1']    = {'889.9', 4}, 
    ['11.1.1']  = nil, 
    ['11.1.2']  = nil, 
    ['11.2']    = nil, 
    ['11.2.1']  = nil, 
    ['11.2.2']  = nil, 
    ['11.2.5']  = nil, 
    ['11.2.6']  = nil, 
    ['11.3']    = nil, 
    ['11.3.1']  = nil, 
    ['11.4']    = nil, 
    ['11.4.1']  = nil, 
    ['12.0']    = {'974.2.1', 7}, 
    ['12.0.1']  = nil, 
    ['12.1']    = {'975.0.3', 6}, 
    ['12.1.1']  = nil, 
    ['12.1.2']  = nil, 
    ['12.1.3']  = nil, 
    ['12.1.4']  = nil, 
    ['12.2']    = {'978.0.7', 10},
    ['12.4.1']  = {'978.0.7', 10}, -- MQQBrowser/9.7.1 (iOS 6p; U; CPU like Mac OS X; zh-cn)
    ['12.4.2']  = {'978.0.7', 7},
    ['13.3']    = {'1121.2.2', 20},
    ['13.3.1']  = {'1121.2.2', 30},
}
g_config.hardwareInfo = {
    ['iPhone7,2']   = {ProcessType = 'T7000', machineModel = 'N61AP', CPUCount = "2", memoryInfo = "1", diskInfo = "16/64",},    --iPhone 6
    ['iPhone8,1']   = {ProcessType = 'T7000', machineModel = 'N71AP', CPUCount = "2", memoryInfo = "2", diskInfo = "16/32/64",},    --iPhone 6s
    ['iPhone9,1']   = {ProcessType = 'T7000', machineModel = 'D10AP', CPUCount = "4", memoryInfo = "2", diskInfo = "32/128/256",},    --iPhone 7
    ['iPhone10,1']  = {ProcessType = 'T7000', machineModel = 'D20AP', CPUCount = "6", memoryInfo = "2", diskInfo = "64/256",},   --iPhone 8  
    ['iPhone7,1']   = {ProcessType = 'T7000', machineModel = 'N56AP', CPUCount = "2", memoryInfo = "1", diskInfo = "16/64", },   --iPhone 6Plus
    ['iPhone8,2']   = {ProcessType = 'S8000', machineModel = 'N66AP', CPUCount = "2", memoryInfo = "2", diskInfo = "16/64", },   --iPhone 6sPlus
    ['iPhone9,2']   = {ProcessType = 'T8010', machineModel = 'D11AP', CPUCount = "4", memoryInfo = "3", diskInfo = "32/128/256", },   --iPhone 7Plus
    ['iPhone10,2']  = {ProcessType = 'T8015', machineModel = 'D21AP', CPUCount = "6", memoryInfo = "3", diskInfo = "64/256", },  --iPhone 8 Plus
    ['iPhone10,3']  = {ProcessType = 'T8015', machineModel = 'D22AP', CPUCount = "6", memoryInfo = "3", diskInfo = "64/256", },  --iPhone X  
    ['iPhone11,8']  = {ProcessType = 'T8020', machineModel = 'N841AP', CPUCount = "6", memoryInfo = "4", diskInfo = "64/256/512", },  --iPhone XR 
    ['iPhone11,2']  = {ProcessType = 'T8020', machineModel = 'D321AP', CPUCount = "6", memoryInfo = "4", diskInfo = "64/256/512", },  --iPhone XS
    ['iPhone11,6']  = {ProcessType = 'T8020', machineModel = 'D331pAP', CPUCount = "6", memoryInfo = "3", diskInfo = "64/256", },  --iPhone XS max

}
g_config.MNCInfo = {
    ['中国移动'] = {'02', '07'}, -- 00
    ['中国联通'] = {'06', '09'}, -- 02
    ['中国电信'] = {'05', '11'}, -- 03
}

function g_config.getHardwareInfo(iPhoneType)
    local infoTable = g_config.hardwareInfo[iPhoneType]
    if infoTable and infoTable.diskInfo then
        local tt = split(infoTable.diskInfo, '/')
        infoTable.diskInfo = tt[math.random(1, #tt)]
    end
    return infoTable
end

function getDeviceSystemInfo(deviceVersion)
    local sysInfo = g_config.deviceSystemInfo[deviceVersion]
    if not sysInfo then
        return
    end
    local buildVers = sysInfo.BuildVersion
    local firmwareVers = sysInfo.UAFirmwareVer
    if string.find(buildVers, '/') then
        local tt = split(buildVers, '/')
        sysInfo.BuildVersion = tt[math.random(1, #tt)]
    end
    if string.find(firmwareVers, '/') then
        local tt = split(buildVers, '/')
        sysInfo.UAFirmwareVer = tt[math.random(1, #tt)]
    end
    return sysInfo
end

g_config.appsDownloadWithoutVpn = {
    -- [414603431] = true,     -- QQ音乐
    -- [1134496215] = true,    -- 西瓜视频
}
return g_config