-------------------------------------------- 子任务基类:ASOSubTask -----------------------------------------------
-- g_taskData = nil
local TASK_RETRY_LIMIT = 2 		--任务出现网络慢时，重新开始的次数上限 const

ASOSubTask = class()
function ASOSubTask:ctor(endTaskCall)
	self.endTaskCall = endTaskCall
	self.nextStep = nil
	self.firstStep = nil
end

function ASOSubTask:init()
	g_timeoutDetector:init(180, g_taskData.startTime)
end

function ASOSubTask:executeNextStep()
	writeASOLog('ASOSubTask:executeNextStep')
	if self.nextStep then
		self.nextStep:init()
		self.nextStep: execute()
	end
end

function ASOSubTask:triggerCallback(errorCode, snapshotFile)
	if self.endTaskCall then
		self.endTaskCall(errorCode, snapshotFile)
	end
end

function ASOSubTask:isTimeout(errorCode, snapFilePath)
	if g_timeoutDetector:isTimeout() then
		writeASOLog(ERROR_MSG[errorCode] or '')
		self:reTryTask(errorCode, snapFilePath)
		return true
	end
	return false
end

function ASOSubTask:otherPopWind()
	local errorCode = g_pictureInterfase.otherPopWind(g_taskData.password, self.stepName )
	if errorCode > 0 then
		writeASOLog('otherPopWind return ' .. errorCode)
		if 1015 == errorCode or 1009 == errorCode or 1008 == errorCode then --or 1027 == errorCode 1015:无法连接到iTunes， 1009: 无法购买, 1008: 无法下载, 1027: 简短验证
			self:reTryTask(errorCode, getSnapshotFileName(errorCode))
		else
			self:triggerCallback(errorCode, getSnapshotFileName(errorCode))
		end
	end
	return errorCode
end

function ASOSubTask:xieyiProcess()
	local errorCode = g_pictureInterfase.xieyiProcess()
	if errorCode and errorCode > 0 then
		self:triggerCallback(errorCode)
	end
	return errorCode
end

function ASOSubTask:needRetryTask()
	writeASOLog('ASOSubTask:needRetryTask')
	return (TASK_RETRY_TIMES < TASK_RETRY_LIMIT) and (os.time() - g_taskData.startTime < g_config.taskTimeLimit)
end

function ASOSubTask:reTryTask(errorCode, snapFilePath)
	if (self.firstStep and self:needRetryTask() ) then
		closeApp(frontAppBid())                 	--关闭前台应用
		closeApp(g_config.applePreferences)
		closeApp(g_config.appStore)                 --关闭appstore
		TASK_RETRY_TIMES = TASK_RETRY_TIMES + 1
		self.firstStep:init()
		self.firstStep:execute()
	else
		self:triggerCallback(errorCode, snapFilePath)
	end
end

--[[
	检测网络连接, 登录AppleId 之前和连接VPN之后检测网络情况
--]]
CheckNetStatus = class(ASOSubTask)

function CheckNetStatus:ctor(endTaskCall)
	self.retry_interval = 5
end

function CheckNetStatus:init(timeLimit)
	g_timeoutDetector:init(timeLimit or 360)
end

function CheckNetStatus:execute()
	writeASOLog('CheckNetStatus: execute')
	toast('检测网络连接',1)
	while not TASK_END do
		if getNetTime()>0 then
			self:executeNextStep()
			return true
		else
			writeASOLog('网络错误~等待网络正常')
			toast('网络错误~等待网络正常',1)
			delay(self.retry_interval)
			self.retry_interval = self.retry_interval + 5
		end
		if self:isTimeout(1002) then
			return false
		end
	end
end

function CheckNetStatus:isTimeout(errorCode)
	if (g_timeoutDetector:isTimeout() ) then
		writeASOLog('检测网络连接超时')
		self:triggerCallback(errorCode)
		return true
	end
	return false
end