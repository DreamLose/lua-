-------------------------------------------- FakeInfoManager -----------------------------------------------
FakeInfoManager = class()

function FakeInfoManager:ctor()
    self.IOS_VERSION_LIST = {
        {'13.3.1',  3050},
        {'13.3',    3500},
        {'13.1.3',   500},
        {'13.1.2',   320},
        {'12.4.1',   600},
        {'12.4',     280},
        {'12.3.1',   400},
        {'12.2',     250},
        {'12.1.4',   200},
        {'11.4.1',   300},
        {'12.4.2',   200},
        {'12.4.5',   400},
    }
    self.IOS_VERSION_LIST_2 = {
        {'12.2', 1120},
        {'12.1.4', 4000},
        {'12.1.2', 1080},
        {'12.1', 600},
        {'12.0', 550},
        {'12.0.1', 500},
        {'11.4.1', 930},
        {'11.4',400},
        {'11.3.1',350},
        {'10.3.3', 470},
    }

    self.IOS_VERSION_Ratio = 10000

    self.PRODUCT_TYPE_LIST = 
    {
        {'iPhone7,2',   500},        --iPhone 6
        {'iPhone8,1',   630},        --iPhone 6s
        {'iPhone9,1',   741},        --iPhone 7
        {'iPhone10,1',  300},        --iPhone 8
        {'iPhone7,1',   450},        --iPhone 6Plus
        {'iPhone8,2',   784},        --iPhone 6sPlus
        {'iPhone9,2',   1037},       --iPhone 7Plus
        {'iPhone10,2',  800},        --iPhone 8 Plus
        {'iPhone10,3',  1200},       --iPhone X
        {'iPhone11,2',  500}, 		 ---iPhone XS
        {'iPhone11,8',  800},        --iPhone XR
        {'iPhone11,6',  800},        --iPhone XS max
    }
    
    self.charSet = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'
end

function FakeInfoManager:randomFakeINodeInfo( fakeInfo )
    -- body
    fakeInfo = fakeInfo or {}
    fakeInfo['/dev/null'] = math.random(-6, 6)
    fakeInfo['/etc/hosts'] = math.random(-300, 300)
    fakeInfo['/System/Library/CoreServices/SystemVersion.pluginList'] = math.random(-500, 500)
    fakeInfo['/var/mobile/Containers/Data'] = math.random(-20, 20)
    fakeInfo['/var/mobile/Containers/Data/Application'] = fakeInfo['/var/mobile/Containers/Data'] + 1
end

function FakeInfoManager:randomIosVersion(appId, bNeedCFNetworkVersion, iphoneType)
    -- if bNeedCFNetworkVersion then
    --     local rNum = math.random(1, 100)
    --     for k, v in pairs(g_config.CFNetworkVersions) do
    --         if rNum < v[2] then
    --             return k
    --         else
    --             rNum = rNum - v[2]
    --         end
    --     end
    --     return getOSVer() or '12.3.1'
    -- end
    local begIdx = 1
    local endIdx = 12

    if g_config.iosVersionCfg[appId] then
        self.IOS_VERSION_LIST = self.IOS_VERSION_LIST_2
        begIdx = g_config.iosVersionCfg[appId][1]
        endIdx = g_config.iosVersionCfg[appId][2]
    else
        if 'iPhone11,2' == iPhoneType or 'iPhone11,6' == iPhoneType or 'iPhone11,8' == iPhoneType then -- XS/XS max/XR
            endIdx = 9
        elseif 'iPhone7,2' == iPhoneType or 'iPhone7,1' == iPhoneType then --6/6P
            begIdx = 5
        else    -- 6s/6sp/7s/7sp 8/8P/X
            endIdx = 10
        end
    end
    local ratioNum = 0
    for i=begIdx,endIdx do
        ratioNum = ratioNum + self.IOS_VERSION_LIST[i][2]
    end
    local rVal = math.random(1, ratioNum)
    local counter = 0
    for i=begIdx,endIdx do
        local v = self.IOS_VERSION_LIST[i]
        counter = counter + v[2]
        if counter >= rVal then
            return v[1]
        end
    end
    return '11.4.1'
end

function FakeInfoManager:_randomString(len, i, j)
    i = i or 1
    j = j or string.len(self.charSet)
    local ret = ''
    for k=1,len do
        local idx = math.random(i, j)
        ret = ret .. string.sub(self.charSet, idx, idx)
    end
    return ret
end

function FakeInfoManager:randomCarrierName()
    local randNum = math.random(1, 100)
    if randNum > 30 then
        return '中国移动'
    elseif randNum > 10 then
        return '中国联通'
    else
        return '中国电信'
    end
end

function FakeInfoManager:randomDeviceUUID( )
    return string.format('%s-%s-%s-%s-%s', self:_randomString(8, 1, 16), self:_randomString(4, 1, 16), self:_randomString(4, 1, 16), self:_randomString(4, 1, 16), self:_randomString(12, 1, 16))
end

function FakeInfoManager:randomDeviceUDID( )
    return string.format('%s%s%s%s', self:_randomString(10, 1, 16), self:_randomString(10, 1, 16), self:_randomString(10, 1, 16), self:_randomString(10, 1, 16))
end

function FakeInfoManager:randomDeviceSerial( )
    return self:_randomString(12, 1, 36)
end

function FakeInfoManager:randomDeviceIDFA( ) -- 1B09ACA5-7A43-4AF6-BE1F-6517A15582DE
    return string.format('%s-%s-4%s-%s-%s', self:_randomString(8, 1, 16), self:_randomString(4, 1, 16), self:_randomString(3, 1, 16), self:_randomString(4, 1, 16), self:_randomString(12, 1, 16))
end

function FakeInfoManager:randomDeviceIDFV( )
    return string.format('%s-%s-%s-%s-%s', self:_randomString(8, 1, 16), self:_randomString(4, 1, 16), self:_randomString(4, 1, 16), self:_randomString(4, 1, 16), self:_randomString(12, 1, 16))
end

function FakeInfoManager:randomDeviceUTDID( )
    return string.format('WZ%s%s', self:_randomString(1, 11, 36), self:_randomString(21, 1, 62))
end

function FakeInfoManager:randomProductType( appId )
	local PRODUCT_TYPE_LIST = {}
    for i=1, 4 do
        table.insert(PRODUCT_TYPE_LIST, self.PRODUCT_TYPE_LIST[i])
    end
    if g_config.supportPlusDevice(appId) then
        for i=5, 8 do
            table.insert(PRODUCT_TYPE_LIST, self.PRODUCT_TYPE_LIST[i])
        end
    end
    if g_config.supportIphoneX(appId) then
        for i=9,10 do
            table.insert(PRODUCT_TYPE_LIST, self.PRODUCT_TYPE_LIST[i])
        end
    end
    if g_config.supportIphoneXR(appId) then
        table.insert(PRODUCT_TYPE_LIST, self.PRODUCT_TYPE_LIST[11])
    end
    if g_config.supportIphoneXSMax(appId) then
        table.insert(PRODUCT_TYPE_LIST, self.PRODUCT_TYPE_LIST[12])
    end

	local nCount = 0
	local typeCount = #PRODUCT_TYPE_LIST
	for i,v in ipairs(PRODUCT_TYPE_LIST) do
		nCount = nCount + PRODUCT_TYPE_LIST[i][2]
	end

    local rdmNum = math.random(1, nCount)
    for j=1, typeCount do
        if rdmNum <= PRODUCT_TYPE_LIST[j][2] then
            return PRODUCT_TYPE_LIST[j][1]
        else
            rdmNum = rdmNum - PRODUCT_TYPE_LIST[j][2]
        end
    end
    return 'iPhone9,1'
end

function FakeInfoManager:randomLocalIp( )
    return string.format('192.168.%d.%d', math.random(0, 48), math.random(2, 254))
end

function FakeInfoManager:randomWifiName( )
    local str = string.format('%s%s', self:_randomString(2, 11, 62), self:_randomString(math.random(1, 10), 1, 62) )
    if math.random(1, 2) > 1 then
        return 'TP-Link_' .. str
    else
        return str
    end
end

function FakeInfoManager:randomWifiAddress( )
    return string.format('%s:%s:%s:%s:%s:%s', self:_randomString(2, 2, 16), self:_randomString(2, 2, 16), self:_randomString(2, 2, 16), self:_randomString(2, 2, 16), self:_randomString(2, 2, 16), self:_randomString(2, 1, 16) )
end

function FakeInfoManager:randomBatteryState( )
    local randNum = math.random(1, 100)
    if randNum > 30 then
        return "1"
    elseif randNum > 10 then
        return "2"
    else
        return "3"
    end
end

function FakeInfoManager:randomBatteryLevel()
    if math.random(1, 100) > 70 then
        return nil
    else
        return tostring(math.random(30, 100) )
    end
end

function FakeInfoManager:randomAcceleromet()
    local x = tostring(-math.random()/100)
    local y = tostring(math.random()/10 - 1)
    local z = tostring(-math.random()/10)
    return string.format("%s,%s,%s", x, y, z)
end

function FakeInfoManager:randomGyroscope( )
    local x = tostring(math.random()/100 + 0.01)
    local y = tostring(math.random()/100 - 1)
    local z = tostring(-math.random()/100 - 0.01)
    return string.format("%s,%s,%s", x, y, z)
end

function FakeInfoManager:randomMagnet( )
    local x = tostring(math.random() + math.random(100, 150))
    local y = tostring(math.random() + math.random(100, 150))
    local z = tostring(-math.random() - math.random(500, 700) )
    return string.format("%s,%s,%s", x, y, z)
end

-- function FakeInfoManager:randomIsCharing( )
--     return math.random(1, 100) > 80
-- end

function FakeInfoManager:randomDUDeviceId( )
    return string.format('%s:%s:%s:%s00', self:_randomString(6, 1, 16), self:_randomString(6, 1, 16), self:_randomString(6, 1, 16), self:_randomString(2, 1, 16) )
end

function FakeInfoManager:randomDiskInfo( infoTable, diskSpace )
    infoTable = infoTable or {}
    if '16' == diskSpace then
        infoTable['diskTotalSpace'] = tostring(12109299712 + math.random(-500000, 500000) * 4)
        infoTable['diskFreeSpace'] = tostring(math.random(536870912, 1342177280)* 4) --4294967296, 6442450994, 
    elseif '32' == diskSpace then
        infoTable['diskTotalSpace'] = tostring(29,313,151,700 + math.random(-500000, 500000) * 4)
        infoTable['diskFreeSpace'] = tostring(math.random(536870912, 5368709120)* 4)
    elseif '128' == diskSpace then -- 119.20G
        infoTable['diskTotalSpace'] = tostring(127990025420 + math.random(-500000, 500000) * 4)
        infoTable['diskFreeSpace'] = tostring(math.random(644450944, 26843545600)* 4)
    elseif '256' == diskSpace then -- 238.35G
        infoTable['diskTotalSpace'] = tostring(255926363752 + math.random(-500000, 500000) * 4)
        infoTable['diskFreeSpace'] = tostring(math.random(16106127360, 53687091200)* 4)
    else -- 59.59
        infoTable['diskTotalSpace'] = tostring(63984275292 + math.random(-500000, 500000) * 4)
        infoTable['diskFreeSpace'] = tostring(math.random(1342177280, 10737418240)* 4)
    end
end
function FakeInfoManager:randomMemoryInfo( infoTable, memorySpace )
    infoTable = infoTable or {}
    if infoTable['memoryTotal'] then
        memorySpace = string.sub(infoTable['memoryTotal'], 1, 1)
    end
    if '1' == memorySpace then
        infoTable['memoryTotal'] = '1037041664'
        infoTable['memoryUsed'] = tostring(155566080 + math.random(-60000, 500000) * 4)
        infoTable['memoryAvailable'] = tostring(273776640 + math.random(-100000, 100000) * 4 - infoTable['memoryUsed'])
    else
        infoTable['memoryTotal'] = '2102919168'
        infoTable['memoryUsed'] = tostring(218136576 + math.random(-500000, 500000) * 4)
        infoTable['memoryAvailable'] = tostring(410,670,720 + math.random(-100000, 100000) * 4- infoTable['memoryUsed'])
    end
end

function FakeInfoManager:randomScreenBrightness( )
    if math.random(1, 100) > 50 then
        return
    end
    local brightness = math.random()
    for i=1,3 do
        if brightness < 0.55 then
            brightness = brightness + 0.2
        else
            break
        end
    end
    return brightness
end

function FakeInfoManager:randomMacInfo(infoTable)
    infoTable = infoTable or {}
    local wifiAddress = infoTable.wifiAddress
    local wifiIP = infoTable.wifiIP
    if wifiAddress then
        infoTable["gatewayMac"] = string.format("%s:%s:%s:%s", string.sub(wifiAddress, 1, 8), self:_randomString(2, 2, 16), self:_randomString(2, 2, 16), self:_randomString(2, 1, 16))
        infoTable["localMac"] = string.format("%s:%s:%s:%s:%s:%s", self:_randomString(2, 2, 16), self:_randomString(2, 2, 16), self:_randomString(2, 2, 16), self:_randomString(2, 2, 16), self:_randomString(2, 2, 16), self:_randomString(2, 1, 16) )
    end
    if wifiIP then
        local reverseIp = string.reverse(wifiIP)
        local _beg, _ = string.find(reverseIp, '%.')
        infoTable["gatewayIP"] = string.reverse(string.sub(reverseIp, _beg)) .. '1'
    end
end
