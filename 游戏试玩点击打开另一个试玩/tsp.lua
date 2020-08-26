local sz = require("sz")        --使用苏泽库前一定要在开头插入这一句
local http_i82 = sz.i82.http
szocket_http = require("szocket.http")

local ts = require("ts")

cjson = {} -- sz.json
cjson.decode = function( jsonStr )
    if jsonStr then
        jsonStr = string.trim(jsonStr)
        local nLen = string.len(jsonStr)
        if '{' ~= string.sub(jsonStr, 1, 1) or '}' ~= string.sub(jsonStr, nLen, nLen) then
            return nil
        end
        return sz.json.decode(jsonStr)
    end
end

cjson.encode = function( t )
    if 'table' == type(t) then
        return sz.json.encode(t)
    else
        return nil
    end
end

function getSnapshotFileName(errorCode)
    local snapshotFile = nil
    if (1017 == errorCode) then
        snapshotFile = DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_login.png'
    elseif 1018 == errorCode then
        snapshotFile = DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_search.png'
    elseif 1019 == errorCode then
        snapshotFile = DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_purchaseAppFail.png'
    elseif 1016 == errorCode then
        snapshotFile = DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_download.png'
    elseif 1003 == errorCode then
        snapshotFile = DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_cantOpenSetting.png'
    elseif 1004 == errorCode then
        snapshotFile = DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_notFound.png'
    elseif 1005 == errorCode or 1006 == errorCode or 1007 == errorCode then
        snapshotFile = DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_cantAppstore.png'
    elseif 1008 == errorCode then
        snapshotFile = DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_downFail.png'
    elseif 1009 == errorCode then
        snapshotFile = DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_getFail.png'
    elseif 1015 == errorCode then
        snapshotFile = DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_cantitune.png'
    -- elseif 1020 == errorCode then
    --     snapshotFile = DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_hasDownloaded.png'
    -- elseif 1021 == errorCode then
    --     snapshotFile = DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_appleIdForbidden.png'
    -- elseif 1022 == errorCode then
    --     snapshotFile = DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_appleIdNoUse.png'
    -- elseif 1023 == errorCode then
    --     snapshotFile = DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_appleIdNotChecked.png'
    -- elseif 1024 == errorCode then
    --     snapshotFile = DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_appleIdLocked.png'
    -- elseif 1025 == errorCode then
    --     snapshotFile = DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_appleIdNotExisted.png'
    -- elseif 1026 == errorCode then
    --     snapshotFile = DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_passwordError.png'
    -- elseif 1027 == errorCode then
    --     snapshotFile =  DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_briefValidation.png'
    -- elseif 1028 == errorCode then
    --     snapshotFile = DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_confirmPayInfo.png'
    -- elseif 1029 == errorCode then
    --     snapshotFile = DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_pauseDownloadApp.png'
    elseif 1030 == errorCode then
        snapshotFile = DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_cantConnectVPN.png'
    elseif 1031 == errorCode then
        snapshotFile = DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_configVPNTimeout.png'
    elseif 1032 == errorCode then
        snapshotFile = DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_appleIdNotInChina.png'
    elseif 1033 == errorCode then
        snapshotFile = DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_clearAppstoreCacheFail.png'
    elseif 1036 == errorCode then
        snapshotFile = DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_canntDownload.png'
    elseif 1045 == errorCode then
        snapshotFile = DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_unexpectedVPNPop.png'
    elseif 1061 == errorCode then
        snapshotFile = DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_appleIdNotActived.png'
    elseif 1097 == errorCode then
        snapshotFile = DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_appleIdNeedValidateWithMsg.png'
    elseif 1999 == errorCode then
        snapshotFile = DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_undefinedError.png'
    elseif 4010 == errorCode then
        snapshotFile = DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_deviceNeedActive.png'
    elseif 4005 == errorCode then
        snapshotFile = DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_registFail.png'
    elseif 4009 == errorCode then
        snapshotFile = DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_registFindImageFail.png'
    elseif 1043 == errorCode or 1044 == errorCode then
        snapshotFile = DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_switchToAppStoreFail.png'
    end
    return snapshotFile
end
-------------------------------------------- error msg -----------------------------------------------
ERROR_MSG = {}
local Errors_UploadLog = {}
function initErrorMsg(...)
    ERROR_MSG = {
        [1002] = '网络错误',
        [1003] = '打不开系统设置',
        [1004] = '找不到应用',
        [1005] = 'App Store打不开',
        [1006] = 'App Store无法连接',
        [1007] = 'App Store crash',
        [1008] = '应用下载失败',
        [1009] = '应用获取失败',
        [1015] = 'iTunes Store无法连接',
        [1016] = '下载应用超时',
        [1017] = '登录超时',
        [1018] = '搜索应用超时',
        [1019] = 'App 购买失败',
        [1020] = '账户已经下载过该应用',
        [1021] = '账户被禁用',
        [1022] = '账户停用',
        [1023] = '账户未过检',
        [1024] = '账户锁定',
        [1025] = '账户不存在',
        [1026] = '密码错误',
        [1027] = '下载应用需要验证',
        [1028] = '需要验证付款信息',
        [1029] = '暂停下载应用',
        [1030] = 'vpn 鉴定失败',
        [1031] = 'vpn 配置超时',
        [1032] = '账号地区不是中国',
        [1033] = '清除Appstore缓存失败',
        [1034] = 'Appstore验证输入次数过多',
        [1035] = '验证码gif不存在',
        [1036] = '无法下载应用',
        [1037] = '该设备无可用ip段',
        [1041] = '伪装地理位置错误',
        [1042] = 'VPN网络不可用',
        [1045] = 'VPN弹窗点不掉',
        [1097] = '下载需要短信验证',
        [1098] = 'AppleId不在激活状态',
        [4011] = '储存空间不足',
        [4033] = '下载成功未激活',
        [1999] = '未知错误',
        [4044] = '点击上报出错',
        [4006] = '应用打开失败',
        [4010] = '设备激活中断脚本运行',
        [4007] = '应用打开闪退',
        [4000] = '跳转appStore完成,并下载游戏成功',
        [4015] = '设备黑屏',
        [5000] = 'app不存在,需手动下载',
        [5005] = '跳转appStore失败',
        [5006] = '跳转appStore完成',

        [5007] = '开屏未下载',
        [5008] = '开屏下载激活成功',
        [5009] = '开屏下载激活失败',
        [5014] = '账号禁用无法下载,开屏下载激活失败',

        [5010] = 'app只看视频',
        [5011] = 'app点击未下载',
        [5012] = 'app点击下载激活成功',
        [5013] = 'app点击下载激活失败',
        [5015] = '账号禁用无法下载,app点击下载激活失败'

    }
    Errors_UploadLog = {
        [1003] = true,
        [1004] = true,
        [1005] = true,
        [1006] = true,
        [1007] = true,
        [1008] = true,
        [1009] = true,
        [1015] = true,
        [1016] = true,
        [1017] = true,
        [1018] = true,
        [1019] = true,
        [1030] = true,
        [1031] = true,
        [1032] = true,
        [1033] = true,
        [1034] = true,
        [1035] = true,
        [1036] = true,
        [1037] = true,
        [1041] = true,
        [1042] = true,
        [1043] = true,
        [1044] = true,
        [1045] = true,
        [1097] = true,
        [1098] = true,
        [3002] = true,
        [4002] = true,
        [4003] = true,
        [4004] = true,
        [4005] = true,
        [4006] = true,
        [4007] = true,
        [4008] = true,
        [4009] = true,
        [4010] = true,
        [4011] = true,
        [4012] = true,
        [4013] = true,
        [4015] = true,
        [4021] = true,
        [4022] = true,
        [4023] = true,
        [4024] = true,
        [4027] = true,
        [4029] = true,
        [4040] = true,
        [4032] = true,
        [4033] = true,
        [4034] = true,
        [5000] = true,

        [5007] = true,
        [5008] = true,
        [5009] = true,

        [5010] = true,
        [5011] = true,
        [5012] = true,
        [5013] = true,
       
    }
end


-------------------------------------------- device info -----------------------------------------------
DEVICE_INFO = {} -- 设备信息
function initDeviceInfo(...)
    -- body
    DEVICE_INFO = {}
    DEVICE_INFO.deviceID = getDeviceID()
    local width, height = getScreenSize()
    DEVICE_INFO.width = width
    DEVICE_INFO.height = height
    if width == 750 and 1334 == height then
        delay(5)
        DEVICE_INFO.type = 'iPhone6'
    else
        toast('暂不支持该设备',3)
        delay(5)
        return false
    end
    return true
end



-------------------------------------------- log -----------------------------------------------
LOG_FILE_PATH = nil -- 日志文件目录
local LOG_BUFFER = {} -- 日志缓存
function initLogFile(deviceId, deviceType)
    -- body
    if not isFileExist(g_config.log_path) then
        os.execute('mkdir -p ' .. g_config.log_path)   
    end
    assert(deviceId and deviceType, 'initLogFile Fail, please init device info first')
    LOG_FILE_PATH = g_config.log_path .. deviceType .. '_' .. deviceId .. '_script.log'
    LOG_BUFFER = {}
    return  LOG_FILE_PATH
end

function writeASOLog(logMsg, forceWrite)
    -- body
    forceWrite = true
    if 'table' == type(logMsg) then
        logMsg = cjson.encode(logMsg)
    end
    if(not LOG_FILE_PATH) then
        toast(logMsg,1)
        delay(5)
        return
    end
    assert(LOG_FILE_PATH, 'write log fail, please init log before call this function')
    if logMsg and #logMsg > 0  then
        table.insert(LOG_BUFFER, os.date('[%Y-%m-%d %X]', os.time() ) .. logMsg .. '\n')
    end

    if (#LOG_BUFFER >= 10 or forceWrite) then
        local file = io.open(LOG_FILE_PATH, 'a')
        if file then
            for i= 1, #LOG_BUFFER do
                -- body
                file:write(LOG_BUFFER[i])
            end
            file:close()
            LOG_BUFFER = {}
        else
            toast('打开日志文件失败',1)
        end
    end
end

--解锁屏幕
function unlockMyDevice()
    if 0 ~= deviceIsLock() then
        unlockDevice() --解锁屏幕
    end
    pressHomeKey(0)
    mSleep(100)
    pressHomeKey(1)
end

--启动App
function active(app,t)
    t = t or 0.5
    local bid = frontAppBid()    --获取前台应用的Bounld ID
    if bid ~= app then       --ENDD前台应用是不是 你想要的应用 
        writeASOLog(tostring(app).."，准备启动") --不是 我要的应用
        closeApp(app)
        runApp(app)          --启动应用
        mSleep(t*1000)       --等待
        return true          -- 前台应用不是我想要的应该 返回true 否则 flase
    end
    return false
end

--点击一个点 
--点击后等待的时间
function click(x,y,times)
    times = times or 1
    touchDown(x, y)
    mSleep(50)
    touchMove(x, y)
    touchUp(x, y)
    mSleep(1000*times)
end

--休眠x秒
function delay(times)
    times = times or 1
    mSleep(times*1000)
end

--输入---
function input(txt)
    inputText(txt)
    delay(2)
end


---------------------------------------------------------------找图/找色函数---------------------------------------------------------------
--多点找色  并且点击
-- 找到并点击 才返回 true
-- 找不到颜色  返回 flase
function c_pic(t,name)
    name = name or t[8] or ' '
    local x,y = findMultiColorInRegionFuzzy(t[1],t[2],t[3],t[4],t[5],t[6],t[7])
    if x > 0 and y > 0 then
        click(x,y)
        writeASOLog("点色-->"..tostring(name)..'  坐标'.. tostring(x)..','..tostring(y))
        return true
    end
    return false
end

--多点找色
function f_pic(t,name)
    if not t then
        return false
    end
    name = name or t[8] or ' '
    local x,y = findMultiColorInRegionFuzzy(t[1],t[2],t[3],t[4],t[5],t[6],t[7])
    if x > 0 and y > 0 then
        writeASOLog("找色-->"..name..'  坐标'..x..','..y)
        return true
    end
    return false
end

--区域模糊找色  6个值
function f_p(t,name)
    name = name or ' '
    local x,y= findColorInRegionFuzzy(t[1],t[2],t[3],t[4],t[5],t[6])
    if x >0 and y >0 then
        log("单点-->"..name)
        return true
    else
        log('没有-->'..name)
        return false
    end
end

--区域模糊找色 并点击 6个值
function c_p(t,name)
    name = name or ' '
    local x,y= findColorInRegionFuzzy(t[1],t[2],t[3],t[4],t[5],t[6])
    if x >0 and y >0 then
        log("单点-->"..name)
        click(x,y)
        return true
    end
    return false
end

-- 找图
function f_tu(t)
    if t[6] == nil then
        t[6]=40000000
    end
    local x, y = findImage(t[1],t[2],t[3],t[4],t[5],t[6])
    if x ~= -1 and y ~= -1 then
        writeASOLog('f_tu 找到 '..t[1]..':'..x..','..y)
        return true                   
    else 
        writeASOLog('f_tu 没有找到图: '..t[1])
       return false        
    end
end

--找图点击
function c_tu(t)
    if t[6] == nil then
        t[6]=40000000
    end
    local x, y = findImage(t[1],t[2],t[3],t[4],t[5],t[6])
    if x ~= -1 and y ~= -1 then
        writeASOLog('c_tu 找到 '..t[1]..':'..x..','..y)
        click(x+20,y+20)
        return true                   
    else 
        writeASOLog('c_tu 没有找到图: '..t[1])
       return false        
    end
end

--单点模糊比色
--x,y   是点的坐标  根据坐标来取相对应的颜色
--c     是要比较的颜色
--s     是模糊值
function isColor(x,y,c,s)
    s = s or 90
    local fl,abs = math.floor,math.abs
    s = fl(0xff*(100-s)*0.01)
    local r,g,b = fl(c/0x10000),fl(c%0x10000/0x100),fl(c%0x100)
    local rr,gg,bb = getColorRGB(x,y)
    if abs(r-rr)<s and abs(g-gg)<s and abs(b-bb)<s then
        return true
    end
    return false
end

--多点验证比色
function done(tables,name,s)
    name = name or ' '
    s = s or 95
    for i,v in ipairs(tables) do
        if isColor(v[1],v[2],v[3],s) ~=true then
            return false
        end
    end
    log(name or '未命名')
    return true
end
---------------------------------------------------------------滑动屏幕---------------------------------------------------------------
function moveUp_one(x1,y1,x2,y2)
    touchDown(1, x1, y1)
    mSleep(30)
    for i = 0, math.abs(y1 - y2), 300 do    
        touchMove(1, x1,y1-i) 
        mSleep(20)    
    end
    touchUp(1, x1, y1-math.abs(y1 - y2))
end

function moveto(h,w)
    touchDown(1, h/2, w/2)      --在 (150, 550) 按下
    for i = 0, 50, 1 do         --使用for循环从起始点连续横向移动到终止点
        touchMove(1, h/2,w/2-i)
        mSleep(20)              --延迟
    end
    touchUp(1, h/2, w/2-100)    --在 (350, 550) 抬起
end

function moveXY(x1,y1,x2,y2)
    touchDown(1, x1, y1)
    mSleep(math.random(20,50))
    touchMove(1, x1,y1-math.abs(y1 - y2))
    mSleep(50)
    touchUp(1, x1, y1-math.abs(y1 - y2))
end

function movexy(x1,y1,x2,y2)
    touchDown(1, x1, y1)
    mSleep(math.random(20,50))
    touchMove(1, x2, y2)
    mSleep(math.random(20,50))
    touchUp(1, x2, y2)
end

function moveUp(x1,y1,x2,y2)
    touchDown(1, x1, y1)
    mSleep(20)
    for i = 0, math.abs(y1 - y2), 18 do    
        touchMove(1, x1,y1-i)
        mSleep(20)   
    end
    touchUp(1, x1, y1-math.abs(y1 - y2))
end

function moveDown( x1, y1, x2, y2, step )
    step = step or 18
    touchDown(1, x1, y1)
    mSleep(20)
    for i = 0, math.abs(y1 - y2), step do
        touchMove(1, x1,y1 + i)
        mSleep(20)
    end
    touchUp(1, x1, y1+math.abs(y1 - y2))
end

function movetoL(x,x1,y)
    log("左滑一下")
    touchDown(1, x, y)
    mSleep(20)
    for i = 0,math.abs(x1 - x), 5 do   
        touchMove(1, x - i ,y)
        mSleep(20)
    end
    touchUp(1, x1, y)
    delay(1)
end

function movetoR(x,x1,y)
    log("右滑一下")
    touchDown(1, x, y)                  --在 (150, 550) 按下
    mSleep(20)
    for i = 0,math.abs(x1 - x), 5 do    --使用for循环从起始点连续横向移动到终止点
        touchMove(1, x + i ,y)
        mSleep(20)                      --延迟
    end
    touchUp(1, x1, y)                    --在 (350, 550) 抬起
    delay(1)
end
function isBlackScreen( )
    local yList = {30, 80, 130, 180, 230, 280, 330, 380, 430, 480, 530, 580, 630, 680, 730, 780, 830, 880, 930, 980, 1030, 1080, 1130, 1180}
    for i=1, 2 do
        local x = math.random(10, 740)
        for i, v in ipairs(yList) do
            if not isColor(x, v, 0x000000, 99) then
                return false
            end
        end
    end
    return true
end
---------------------------------------------------------------文件操作---------------------------------------------------------------
function fileLength(filename)
    local fh = io.open(filename, "rb")
    toast(fh,1)
    local len = 0
    if fh then
        len = assert(fh:seek("end"))
        fh:close()
    end
    return len
end
function isFileBig(filePath)
    if isFileExist(filePath) then
        local length = fileLength(filePath)
        if length > 3145728 then
            toast('文件大于3M 删除')
            delFile(filePath)
            delay(2)
        end
    else
--        writeASOLog('找到不到该文件')
    end
end


--[[
    随机伪装设备信息
--]]
local _fakeInfoManager = nil
function getFakeInfoManagerObj( )
    if not _fakeInfoManager then
        require 'FakeInfoManager'
        _fakeInfoManager = FakeInfoManager.new()
    end
    return _fakeInfoManager
end


function fakeCFNetworkVersion( strVer )
    local cfInfoTmpPath = '/System/Library/Frameworks/CFNetwork.framework/InfoTmp.plist'
    local cfInfoPath = '/System/Library/Frameworks/CFNetwork.framework/Info.plist'
    if strVer then
        if not isFileExist(cfInfoTmpPath) then
            os.execute(string.format('mv %s %s', cfInfoPath, cfInfoTmpPath) )
        end
        
        local plist = (require 'sz').plist
        local plistInfo = plist.read(cfInfoTmpPath)
        plistInfo.CFBundleVersion = strVer
        plistInfo.CFBundleShortVersionString = strVer
        plist.write(cfInfoPath, plistInfo)
    elseif isFileExist(cfInfoTmpPath) then
        os.execute(string.format('mv %s %s', cfInfoTmpPath, cfInfoPath) )
    end
end
--[[
    操作改机信息文件
--]]
function fakeDeviceInfo(tab, isKeepTask)
    --[[现在只支持 name = 'hahahahah'
                 model = 'iPad'
                 localizedModel = '....'
                 systemName = '苹果OS'
                 systemVersion = '1.1.1'
                 identifierForVendor = 'A111A1A1-A11A-111A-11AA-1A111A1A1A1A'
    ]]
    if type(tab) ~= 'table' then
        return false
    end
    if not tab.UASafariVer and tab.deviceVersion then
        local UAInfo = getDeviceSystemInfo(tab.deviceVersion)
        for k, v in pairs(UAInfo) do
            tab[k] = v
        end
    end

    -- if not tab.ProcessType and tab.ProductType then
    --     tab.ProcessType = g_config.processInfo[tab.ProductType]
    -- end
    if not tab.CPUCount and tab.ProductType then
        local hardwareInfo = g_config.getHardwareInfo(tab.ProductType)
        if hardwareInfo then
            local fakeInfoManager = getFakeInfoManagerObj()
            fakeInfoManager:randomDiskInfo(hardwareInfo, hardwareInfo.diskInfo or '')
            hardwareInfo.diskInfo = nil
            fakeInfoManager:randomMemoryInfo(hardwareInfo, hardwareInfo.memoryInfo or '2')
            hardwareInfo.memoryInfo = nil
            for k, v in pairs(hardwareInfo) do
                tab[k] = v
            end
        end
    elseif tab.memoryTotal then
        getFakeInfoManagerObj():randomMemoryInfo(tab)
    end
    if not tab.CarrierMNCode and tab.CarrierName then
        local mncList = g_config.MNCInfo[tab.CarrierName]
        tab.CarrierMNCode = mncList[math.random(1, 2)]
    end
    -- if 1059274584 == g_taskData.appId then
    --     local fakeInfoManager = getFakeInfoManagerObj()
    --     tab.batteryState = fakeInfoManager:randomBatteryState()
    --     tab.batteryLevel = fakeInfoManager:randomBatteryLevel()
    --     tab.deviceAccelerometer = fakeInfoManager:randomAcceleromet()
    --     tab.deviceGyroscope = fakeInfoManager:randomGyroscope()
    --     tab.deviceMagnet = fakeInfoManager:randomMagnet()
    -- end

    local str = ''
    for k,v in pairs(tab) do
        if 'identifierForVendor' == k then
            str = str..'<key>deviceIDFA</key><string>'..v..'</string>'
        elseif 'deviceName' == k then
            setDeviceName(v)
        elseif 'CFNetworkVersion' == k then
            fakeCFNetworkVersion(v)
        elseif 'ScreenBrightness' == k then
            setBacklightLevel(v)
        else
            str = str..'<key>'..k..'</key><string>'..v..'</string>'
        end
    end
    local strPlist = [[<?xml version="1.0" encoding="UTF-8"?>
                <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
                <plist version="1.0">
                <dict>]]..str..[[</dict>
                </plist>]]
    writeFileString('/var/mobile/Library/Preferences/ywfake.plist', strPlist)
    return true
end
function removeFakeDeviceInfo( )
    delFile('/var/mobile/Library/Preferences/ywfake.plist')
    delFile('/Library/MobileSubstrate/DynamicLibraries/YWFakeTweak.plist')
    fakeCFNetworkVersion()
end
--[[
    class
--]]
local _class = {}
function class(super)
    local class_type={}
    class_type.ctor=false
    class_type.super=super
    class_type.new=function(...) 
        local obj={}
        do
            local create
            create = function(c,...)
                if c.super then
                    create(c.super,...)
                end
                if c.ctor then
                    c.ctor(obj,...)
                end
            end
            create(class_type,...)
        end
        setmetatable(obj,{ __index=_class[class_type] })
        return obj
    end
    local vtbl={}
    _class[class_type] = vtbl
    setmetatable(class_type,{__index= vtbl, __newindex=
            function(t,k,v)
                vtbl[k]=v
            end
        })
    if super then
        setmetatable(vtbl,{__index=
                function(t,k)
                    local ret=_class[super][k]
                    vtbl[k]=ret
                    return ret
                end
            })
    end
    return class_type
end

--[[
    class timeout detector
--]]
TimeoutDetector = class()
function TimeoutDetector: ctor()
    -- body
    self.timeLimit = nil
    self.startTime = nil
end

function TimeoutDetector:init(timeLimit, startTime)
    -- body
    self.timeLimit = timeLimit
    self.startTime = startTime or os.time()
end

function TimeoutDetector: isTimeout()
    -- body
    assert(self.timeLimit and self.startTime, 'TimeoutDetector not completed')
    return os.time() - self.startTime >= self.timeLimit
end
--[[
    注册回掉函数
--]]
local weak = {__mode ="kv"}
local funcPool = {}
function makeCall(func, target)
    if not func then return nil end
    if not target then return func end

    if not funcPool[func] then
        funcPool[func] = {}
        setmetatable(funcPool[func],weak)
    end

    if not funcPool[func][target] then
        funcPool[func][target] = function (...)
                                  return func(target,...)
                               end
    end

     return funcPool[func][target]
end

--[[
    yw.so 插件提供的接口
--]]
local yw = nil
function initYwso()
    if not yw then
        yw = require 'yw'
    end
    return yw
end

function ywClearKeyChain(adid)
    if 'YIXIA.YXLiveVideoApp.XKTV' == adid then
       local status, msg = yw.YWKeychainClearNew()
       return status > 0
    end
    local status, msg = yw.YWKeychainClear()
    return status > 0
end

function ywRestoreKeyChain(dbPath, adid)
    local status, msg
    if 'YIXIA.YXLiveVideoApp.XKTV' == adid then
       status, msg = yw.YWRestoreDBNew(dbPath)
    else
        status, msg = yw.YWRestoreDB(dbPath)
    end
    if status > 0 then
        writeASOLog('恢复keychaine成功')
        return true
    else
        writeASOLog('恢复keychaine失败(' .. (msg or 'nil') .. ')')
        return false
    end
end

function createVPNConfig( vpnInfo )
    if yw and vpnInfo then
        yw.YWCreatVPN(vpnInfo)
        return true
    else
        return false
    end
end

function deleteVPNConfig( vpnDesc )
    if yw and vpnDesc then
        yw.YWDeleteVPN(vpnDesc)
        return true
    else
        return false
    end
end

function getMemoryAvailable()
    return yw.YWFreeDiskSpace()
end

function clearAppstoreCache()
    os.execute('rm -rf /private/var/mobile/Media/Downloads/*')
    if 1 == yw.YWAppStoreClear() then
        writeASOLog('清理AppStore 成功')
        return true
    else
        writeASOLog('清理AppStore 失败')
        return false
    end
end

function doHttpGet(url, args)
    local argsStr = ''
    if args then
        local conjStr = '?'
        for k, v in pairs(args) do
            argsStr = argsStr .. conjStr .. k .. '=' .. v
            conjStr = '&'
        end
    end
    local requestUrl = url .. argsStr
    writeASOLog('requestUrl ==='..requestUrl)
    for i=1,5 do
        local res, code = szocket_http.request(requestUrl)
        writeASOLog('上报返回===res:'.. (res or 'nil'))
        if code == 200 then
            return res
        else
            delay(3)
        end
    end
    return nil
end
-- function doHttpPost(postParams, timeLimit)
--     writeASOLog('doHttpPost')

--     headers = {}
--     headers['User-Agent'] = g_config.UserAgent
--     headers['Referer'] = g_config.getTaskApi
--     headers_send = cjson.encode(headers) --采用 cjson 构造请求内容，并进行 escape

--     if 'table' == type(postParams) then
--         postParams = cjson.encode(postParams)
--     end

--     writeASOLog('doHttpPost.postParams: '..postParams)
--     local retry_times = 0       --重试次数
--     local retry_interval = 20   --重试间隔

--     local function sendPostData()
--         local status_resp, headers_resp, body_resp = http_i82.post(g_config.getTaskApi, 90, headers_send, postParams)

--         if (200 == status_resp) then
--             writeASOLog('服务器返回信息: '..body_resp)
--             serverData = cjson.decode(body_resp)
--             return serverData
--         elseif not timeLimit and retry_times >= 5 then
--             writeASOLog('HTTPPost失败，重试次数: ' .. retry_times)
--             return nil
--         elseif retry_times>=1 and timeLimit and os.time() + retry_interval > timeLimit then
--             writeASOLog('HTTPPost失败，脚本将要超时')
--             return nil
--         else
--             writeASOLog('服务器返回: '..tostring(status_resp) .. ', ' .. tostring(body_resp) )
--             delay(retry_interval)
--             retry_times = retry_times + 1
--             return sendPostData()
--         end
--     end
--     return sendPostData()
-- end
function getDeviceNetIp( )
    for i=1,5 do
        local res = doHttpGet(g_config.ipServer)
        writeASOLog('获取地址===res:'.. (res or 'nil'))
        if res then
            -- res = "var returnCitySN = {"cip": "106.8.235.42", "cid": "130000", "cname": "河北省"};"
            if string.find(res, '=') then
                local tt = split(res, '=')
                if string.find(tt[#tt], ";") then
                    local jsonStrtab = split(tt[#tt], ';')
                    local jsonStr = cjson.decode(jsonStrtab[1])
                    writeASOLog('iPjsonStr : ' .. jsonStrtab[1])
                    return jsonStr.cip
                end
            end
        end
    end
    return nil
    

    -- return doHttpGet(g_config.ipServer)
end
function getGDPostionByIp(ip)
    ip = ip or getDeviceNetIp()
    if not ip then
        return nil
    end
    writeASOLog('getGDPostionByIp： ' .. tostring(ip))
    local res, code = szocket_http.request('http://restapi.amap.com/v3/ip?key=4bb1117fa5134f8bca4632911f01dcb6&ip='..ip)
    if code == 200 then
        writeASOLog('getGDPostionByIp res:' .. tostring(res) )
        local tmp = cjson.decode(res)
        if tmp then
            if tonumber(tmp.status) == 1 then
                local rectangle  = tmp.rectangle
                if rectangle and 'string' == type(rectangle) then
                     local tab = stoastSplit(rectangle, ';')
                     local pos1 = stoastSplit(tab[1], ',')
                     local pos2 = stoastSplit(tab[2], ',')
                     return (tonumber(pos1[1]) + tonumber(pos2[1]) ) / 2, (tonumber(pos1[2]) + tonumber(pos2[2]) )/2
                else
                    writeASOLog('getGDPostion 返回空值')
                end
            else
                if tmp.info then
                    writeASOLog('getGDPostion 高德错误:'..tmp.info)
                else
                    writeASOLog('getGDPostion tmp.info 为空')
                end
            end
        end
    end
    res, code = szocket_http.request(string.format('http://api.map.baidu.com/location/ip?ip=%s&ak=iiwjC012pArROkfjCOZSGci03jX7Vlov&coor=bd09ll', ip) )
    if 200 == code  then
        writeASOLog('api.map.baidu res:' .. tostring(res) )
        local tmp = cjson.decode(res)
        if tmp then
            if 0 == tmp.status then
                local pos = tmp.content and tmp.content.point
                if pos then
                    return tonumber(pos.x), tonumber(pos.y)
                else
                    writeASOLog('api.map.baidu 返回空值')
                end
            else
                writeASOLog('tmp.status = ' .. tostring(tmp.status) )
            end
        end
    end
end
function fakeMyPosition( pos )
    writeASOLog('fakeMyPosition')
    if pos then
        fakeGPS(pos.x, pos.y, 1)
        return pos
    end
    pos = {}
    for i=1,2 do
        local x, y = getGDPostionByIp()
        if x and y then
            writeASOLog('x = ' .. tostring(x) .. ', y = ' .. tostring(y))
            if x and y and 'number' == type(x) and y > 0 then
                fakeGPS(x, y, 1)
                pos.x = x
                pos.y = y
                return pos
            else
                return nil
            end
        end
    end
    return nil

end
function cancelFakeMyPosition( )
    fakeGPS()
end
--[[
    点击到激活的delay时间
--]]
local ActiveDelayDistribution = {
    {60180, 90},
    {180210, 7},
    {210240, 3},
}
function getActiveDelayTime( appSize )
    local function randomDelayByAppSize( appSize )
        if not appSize or appSize < 200 then
            return math.random(0, 60)
        elseif appSize < 300 then
            return math.random(20, 60)
        elseif appSize < 500 then
            return math.random(40, 60)
        else
            return math.random(60, 100)
        end
    end
    local function randomBaseDelay( )
        -- local rNum = math.random(1, 100)
        -- for i=1,#ActiveDelayDistribution do
        --     if rNum <= ActiveDelayDistribution[i][2] then
        --         local tt = ActiveDelayDistribution[i][1]
        --         return math.random(math.floor(tt/1000), tt % 1000 )
        --     else
        --         rNum = rNum - ActiveDelayDistribution[i][2]
        --     end
        -- end
        return math.random(20, 60)
    end
    return randomBaseDelay() + randomDelayByAppSize(appSize)
end
--<生成文本内容>
--字符串分割
--以指定字符分割字符串
function str_cut(str, split_char)
    local sub_str_tab = {}
    str_no = 1
    for str_id in string.gmatch(str, "(%w+)"..split_char.."*") do
        sub_str_tab[str_no] = str_id
        str_no = str_no + 1
    end
    return sub_str_tab
end
 
function split(str,delim)
    if type(delim) ~= "string" or string.len(delim) <= 0 then
        return
    end
    local start = 1
    local t = {}
    while true do
        local pos = string.find (str, delim, start, true) -- plain find
        if not pos then
            break
        end
        table.insert (t, string.sub (str, start, pos - 1))
        start = pos + string.len (delim)
    end
    table.insert (t, string.sub (str, start))
    return t
end

function stoastSplit(str, sepStr)
    writeASOLog('stoastSplit begin')
    local res = {}
    if not str then
        return res
    end
    local subBeg = 1
    while(true) do
        local posBeg, posEnd = string.find(str, sepStr, subBeg)
        if posBeg then
            table.insert(res, string.sub(str, subBeg, posBeg - 1) )
            subBeg = posEnd + 1
        else
            if subBeg <= string.len(str) then
                table.insert(res, string.sub(str, subBeg))
            end
            break
        end
    end
    return res
end
function snapshotScreen( errorCode )
    local snapshotFile = getSnapshotFileName(errorCode)
    if snapshotFile then
        snapshotFile = g_config.log_path ..  snapshotFile
        snapshot(snapshotFile)
        delay(2)
        -- uploadError(snapshotFile)
        return true
    end
    return false
end
function getList(path)
    local a = io.popen("ls "..path);
    local f = {};
    if a then
        for l in a:lines() do
            table.insert(f,l)
        end
        a:close()
    end
    return f
end

function isInstalledApp(bid)
    writeASOLog('isInstalledApp '.. bid)
    local bRet = false
    local bidList  = getInstalledApps()
    if not bidList then
        return bRet
    else
        for k,v in pairs(bidList) do
            if v == bid then
                bRet = true
                break
            end
        end
    end
    return bRet
end
function readAppVersionFromInfoplist( bid )
    if not bid then
        return nil
    end
    writeASOLog('readAppVersionFromInfoplist'..bid)
    local bundlePath = appBundlePath(bid)
    if not bundlePath then
        return nil
    end
    writeASOLog('readAppVersionFromInfoplist  bundlePath '..bundlePath)
    local infoPath = bundlePath .. '/Info.plist'
     if isFileExist(infoPath) then
        local plist = (require 'sz').plist
        local plistInfo = plist.read(infoPath)
        return plistInfo and plistInfo.CFBundleShortVersionString
    end
end
function readFromJsonFile( filePath )
    if isFileExist(filePath) then
        local file = io.open(filePath, 'r')
        if file then
            local t = file:read('*all')
            file:close()
            return cjson.decode(t)
        end
    end
end
function saveToJsonFile( filePath, tabInfo )
    if 'table' == type(tabInfo) then
        tabInfo = cjson.encode(tabInfo)
    end
    writeASOLog('saveToJsonFile: ' .. tostring(tabInfo) )
    if not tabInfo or '' == tabInfo then
        return
    end

    local file = io.open(filePath, 'w')
    if file then
        file:write(tabInfo)
        file:close()
        return true
    end
    return false
end
