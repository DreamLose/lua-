local activeAppBakPath = 'ActiveAppBak/'
local activeAppBakTimeFile = '/ActiveBakupTime'
AppBaker = {} -- class()
function AppBaker:writeBakTime(bakTimeFile)
    local file = io.open(bakTimeFile, 'w')
    if file then
        file:write('' .. os.time())
        file:close()
        return true
    end
    writeASOLog('AppBaker:writeBakTime() 打开文件失败：' .. bakTimeFile)
    return false
end
function AppBaker:clearDB(adid)
    return ywClearKeyChain(adid)
end
function AppBaker:clearPasteboard()
    os.execute('rm -rf /private/var/mobile/Library/Caches/com.apple.UIKit.pboard/*')
    os.execute('rm -rf /private/var/mobile/Library/Caches/com.apple.Pasteboard/*')
    os.execute('killall -9 pasted')
end
-- function AppBaker:clearPreferences(bid)
  
--     os.execute('rm -rf /private/var/mobile/Library/Preferences/')
--     os.execute('rm -rf /private/var/mobile/Library/Caches/com.apple.Pasteboard/*')
--     os.execute('killall -9 pasted')
-- end
function AppBaker:bakupActiveApp( bundleID, appId, appVer, bNeedClear )
    writeASOLog('bakupActiveApp: ' .. appId .. ', ' .. appVer)
    local dataPath = appDataPath(bundleID)
    if not dataPath then
        writeASOLog('获取app data path 失败')
        return false
    end
    local function backAppDataPath( fromPath, toPath )
        os.execute('cp -af ' .. fromPath .. '/Documents ' .. toPath)
        os.execute('cp -af ' .. fromPath .. '/Library ' .. toPath)
        os.execute('cp -af ' .. fromPath .. '/tmp ' .. toPath)
        os.execute('cp -af ' .. fromPath .. '/StoreKit ' .. toPath)
        local bakTimeFile = toPath .. activeAppBakTimeFile
        AppBaker:writeBakTime(bakTimeFile)
    end

    AppBaker:removeBakedActiveApp(bundleID, appId)
    local backupPath = g_config.appBakPath .. activeAppBakPath .. bundleID .. '/' .. appVer
    -- 第一次下载备份
    if not bNeedClear then
        os.execute('mkdir -p ' .. backupPath)
    end
    local commonBackPath = g_config.appBakPath .. activeAppBakPath .. 'CommonActiveAppBak'
    if bNeedClear then
        if isFileExist(commonBackPath) then
            if not isFileExist(backupPath) then
                os.execute('mkdir -p ' .. backupPath)
            end
            backAppDataPath(commonBackPath, backupPath)
            return true
        else
            local activeBakPath1 = g_config.appBakPath .. activeAppBakPath
            local bidList = getList(activeBakPath1)
            for i, v in ipairs(bidList) do
                local activeBakPath2 = string.format('%s/%s', activeBakPath1, v)
                local verList = getList(activeBakPath2)
                for ii, vv in ipairs(verList) do
                    local verPath = string.format('%s/%s', activeBakPath2, vv)
                    if isFileExist(verPath .. '/Documents') and isFileExist(verPath .. '/Library') and isFileExist(verPath .. '/tmp') and isFileExist(verPath .. '/StoreKit') then
                        if not isFileExist(backupPath) then
                            os.execute('mkdir -p ' .. backupPath)
                        end
                        backAppDataPath(verPath, backupPath)
                        os.execute('mkdir -p ' .. commonBackPath)
                        os.execute('cp -af ' .. verPath .. '/Documents ' .. commonBackPath)
                        os.execute('cp -af ' .. verPath .. '/Library ' .. commonBackPath)
                        os.execute('cp -af ' .. verPath .. '/tmp ' .. commonBackPath)
                        os.execute('cp -af ' .. verPath .. '/StoreKit ' .. commonBackPath)
                        return true
                    end
                end
            end
            return false
        end
    end
    -- 备份沙盒文件
    backAppDataPath(dataPath, backupPath)
    if not isFileExist(commonBackPath) then
        os.execute('mkdir -p ' .. commonBackPath)
        os.execute('cp -af ' .. dataPath .. '/Documents ' .. commonBackPath)
        os.execute('cp -af ' .. dataPath .. '/Library ' .. commonBackPath)
        os.execute('cp -af ' .. dataPath .. '/tmp ' .. commonBackPath)
        os.execute('cp -af ' .. dataPath .. '/StoreKit ' .. commonBackPath)
    end
    return true
end
function AppBaker:isBakedActiveApp(bundleID, appVer)
    local backupPath = g_config.appBakPath .. activeAppBakPath .. bundleID .. '/' .. appVer
    
    return isFileExist(backupPath)
end
function AppBaker:restoreBakedActiveApp( bundleID, appId, appVer, bBakEveryDay )
    writeASOLog('restoreActiveApp: ' .. appId .. ', ' .. appVer)
    local dataPath = appDataPath(bundleID)
    if not dataPath then
        writeASOLog('获取app data path 失败')
        return false
    end
    local backupPath = g_config.appBakPath .. activeAppBakPath .. bundleID .. '/' .. appVer

    if not isFileExist(backupPath) then
        writeASOLog('备份目录不存在')
        return false
    end
    if bBakEveryDay then
        local activeBakTimeFile = backupPath .. activeAppBakTimeFile
        local activeBakTime = self:getBakTime(activeBakTimeFile)
        local strToday = os.date('[%Y-%m-%d]', os.time() )
        local strBakTime = os.date('[%Y-%m-%d]', activeBakTime)
        if strToday ~= strBakTime then
            return false
        end
    end

    -- 删除原沙盒文件
    os.execute('rm -rf ' .. dataPath .. '/Documents')
    os.execute('rm -rf ' .. dataPath .. '/Library')
    os.execute('rm -rf ' .. dataPath .. '/tmp')
    os.execute('rm -rf ' .. dataPath .. '/StoreKit')
    
    -- 还原沙盒文件
    os.execute('touch ' .. backupPath .. '/Documents')
    os.execute('touch ' .. backupPath .. '/Library')
    os.execute('touch ' .. backupPath .. '/Library/Caches')
    os.execute('touch ' .. backupPath .. '/Library/Preferences')
    os.execute('touch ' .. backupPath .. '/tmp')
    os.execute('touch ' .. backupPath .. '/StoreKit')
    os.execute('cp -af ' .. backupPath .. '/Documents ' .. dataPath)
    os.execute('cp -af ' .. backupPath .. '/Library ' .. dataPath)
    os.execute('cp -af ' .. backupPath .. '/tmp ' .. dataPath)
    os.execute('cp -af ' .. backupPath .. '/StoreKit ' .. dataPath)
    return true
end
function AppBaker:removeBakedActiveApp( bundleID, appId, appVer )
    writeASOLog('AppBaker:removeBakedActiveApp')
    if appVer then
        if appId then
            os.execute('rm -rf ' .. g_config.appBakPath .. activeAppBakPath .. appId .. '/' .. appVer)
        end
        os.execute('rm -rf ' .. g_config.appBakPath .. activeAppBakPath .. bundleID .. '/' .. appVer)
    else
        if appId then
            os.execute('rm -rf ' .. g_config.appBakPath .. activeAppBakPath .. appId .. '*' )
        end
        os.execute('rm -rf ' .. g_config.appBakPath .. activeAppBakPath .. bundleID )
    end
end
-- 删除沙盒
function AppBaker:removeSandbox(bundleID,appId)
     writeASOLog('removeSandbox: ' .. bundleID .. ', ' .. appId)
    local dataPath = appDataPath(bundleID)
    if not dataPath then
        writeASOLog('获取app data path 失败')
        return true
    end
    os.execute('rm -rf ' .. dataPath)
    return true
end




