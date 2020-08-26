local tryPlay = class()
--360, 596, 568, 912
tryPlay.blueTips = {0x007aff, "0|2|0x007aff", 90, 380, 676, 566, 844, 'blue'}

function tryPlay:refreshPage(  )
	click(375, 14)
	moveTo(500, 500, 500, 1000)
	mSleep(1000)
end

function tryPlay:clickItem( )
	-- 点击文章
	local x = math.random(157, 630)
	local y = math.random(458, 1121)
	click(x,y)
	mSleep(3000)
end

function tryPlay:movePageUp( x )
	x = x or 230
	local s = math.random(10,20)
	moveTo(x, 1000, x, 700, s)
	if s > 15 then
		mSleep(math.random(3000,5000) )
	else
		mSleep(math.random(2000,3000) ) 
	end
end

function tryPlay:movePageDown( x )
	x = x or 500
	local s = math.random(10,20)
	moveTo(x, 700, x, 1000, s)
	if s > 15 then
		mSleep(math.random(3000,5000) )
	else
		mSleep(math.random(2000,3000) ) 
	end
end

function tryPlay:readItem( duration )
	duration = duration or math.random(15, 25)
	local endTime = os.time() + duration
	while os.time() < endTime do
		self:movePageUp()
	end
end

function tryPlay:selectItem()
	for i=1,3 do
		self:movePageUp()
		if math.random() <= 8 then
			break
		end
	end
	self:clickItem()
end

function tryPlay:clickBack( )
	click(42, 82)
end

function tryPlay:movePageLeft( y )
	y = y or math.random(460, 1200)
	touchDown(5, 625, y);
	mSleep(29);
	touchMove(5, 621, y);
	mSleep(16);
	touchMove(5, 582, y);
	mSleep(19);
	touchMove(5, 534, y);
	mSleep(16);
	touchMove(5, 458, y);
	mSleep(15);
	touchMove(5, 398, y);
	mSleep(17);
	touchMove(5, 348, y);
	mSleep(17);
	touchMove(5, 304, y);
	mSleep(17);
	touchMove(5, 272, y);
	mSleep(15);
	touchMove(5, 250, y);
	mSleep(17);
	touchMove(5, 238, y);
	mSleep(21);
	touchUp(5, 220, y);
	mSleep(2000)
end

function tryPlay:movePageRight( y )
	y = y or math.random(460, 1200)
	touchDown(5, 220, y);
	mSleep(29);
	touchMove(5, 238, y);
	mSleep(16);
	touchMove(5, 250, y);
	mSleep(19);
	touchMove(5, 272, y);
	mSleep(16);
	touchMove(5, 304, y);
	mSleep(15);
	touchMove(5, 348, y);
	mSleep(17);
	touchMove(5, 398, y);
	mSleep(17);
	touchMove(5, 458, y);
	mSleep(17);
	touchMove(5, 534, y);
	mSleep(15);
	touchMove(5, 582, y);
	mSleep(17);
	touchMove(5, 621, y);
	mSleep(21);
	touchUp(5, 625, y);
	mSleep(2000)
end

-- 阅读文章类型的试玩
function tryPlay:playApp(duration, checkClick, extrOpration, noRefresh)
	duration = duration or 180
	local endTime = os.time() + duration
	local function localReadItem()
		c_pic(self.blueTips)
		if extrOpration then
			extrOpration()
		end
		self:readItem()
	end

	--是否先读一篇文章
	if math.random(1, 10) > 5 then
		self:clickItem()
		if not checkClick or checkClick() then
			localReadItem()
		end
		mSleep(2000)
		self:clickBack()
	end

	while true do
		local nCount = math.random(2, 4)
		for i= 1, nCount do
			self:selectItem()
			if not checkClick or checkClick() then
				if not checkClick then
					mSleep(math.random(1000, 3000))
				end
				localReadItem()
				self:clickBack()
			elseif extrOpration then
				extrOpration()
			end

			if os.time() > endTime then
				return
			end
		end
		-- 刷新
		if not noRefresh then
			self:refreshPage()
		end
		if os.time() > endTime then
			return
		end
	end
end

-- 视频列表类试玩
function tryPlay:watchVideo_1( t, duration, offset )
	duration = duration or 120
	local endTime = os.time() + duration
	while true do
		local nCount = 0
		local randNum = math.random(3, 10)
		repeat
			local x, y = findMultiColorInRegionFuzzy(t[1],t[2],t[3],t[4],t[5],t[6],t[7])
			if x~= -1 and y~= -1 then
				toast('点视频',3)
				nCount = nCount + 1
				if offset then
					click(x + offset[1], y + offset[2])
				else
					click(x + math.random(-100, 0), y - math.random(150, 250))
				end
				mSleep(1000 * math.random(10, 25) )
			end
			if os.time() >= endTime then
				return
			end
			for i=1, 3 do
				self:movePageUp()
				if math.random(1, 10) <= 8 then
					toast('break',1)
					break
				end
			end
			mSleep(2000)
		until(nCount >= randNum)
		self:refreshPage()
		mSleep(2000)
	end
end
-- 类似抖音推荐视频类型的试玩
function tryPlay:watchVideo_2( duration, watchTime )
	duration = duration or 120
	watchTime = watchTime or 10
	local endTime = os.time() + duration
	local function switchVideo()
		touchDown(7, 263, 1051);
		mSleep(76);
		touchMove(7, 270, 1025);
		mSleep(23);
		touchMove(7, 270, 1010);
		mSleep(10);
		touchMove(7, 272, 990);
		mSleep(17);
		touchMove(7, 275, 956);
		mSleep(19);
		touchMove(7, 276, 906);
		mSleep(15);
		touchMove(7, 276, 847);
		mSleep(16);
		touchMove(7, 272, 768);
		mSleep(28);
		touchMove(7, 260, 687);
		mSleep(8);
		touchMove(7, 247, 613);
		mSleep(20);
		touchMove(7, 236, 545);
		mSleep(12);
		touchMove(7, 223, 478);
		mSleep(17);
		touchMove(7, 206, 401);
		mSleep(15);
		touchUp(7, 202, 396);
		mSleep(2000)
	end
	while true do
		local num = math.random(3, 5)
		for i=1, num do
			local time = math.random(watchTime,watchTime+10) * 1000
			if math.random(1, 10) <= 7 then
				mSleep(time)
			else
				mSleep(2000)
			end
			if os.time() >= endTime then
				return
			end
			self:movePageUp()
		end
		switchVideo()
	end
end

-- 类似快手 九宫格 视频类型的试玩
function tryPlay:watchVideo_3(duration,watchTime, checkClick, extrOpration, noRefresh)
	duration = duration or 120
	watchTime = watchTime or 10
	local endTime = os.time() + duration
	local function clickItemLocal( )
		local y = math.random(458, 1121)
		if 1 == math.random(1, 2) then
			click(math.random(170, 310),y)
		else
			click(math.random(425, 580),y)
		end
		mSleep(2000)
	end
	local function watchVideoLocal(watchDuration)
		if math.random(1, 10) > 7 then
			mSleep(2000)
			return
		end
		toast('watchVideoLocal',1)
		local eTime = os.time() + watchDuration
		local bOpration = false
		while (true) do
			if c_pic(self.blueTips) then
				toast('blueTips',1)
				return
			elseif extrOpration and not bOpration and extrOpration() then
				bOpration = true
			else
				delay(1)
			end
			if os.time() >= eTime then
				return
			end
		end
	end

	while true do
		local num = math.random(3, 5)
		for i=1, num do
			clickItemLocal()
			if not checkClick or checkClick() then
				watchVideoLocal(math.min(watchTime, endTime - os.time()) )
			end
			self:clickBack()
			c_pic(self.blueTips)
			if os.time() >= endTime then
				return
			end
			for i=1, 3 do
				self:movePageUp()
				if math.random(1, 10) <= 7 then
					break
				end
			end
		end
		if not noRefresh then
			self:refreshPage()
		end
	end
end

-- 类似趣头条，泡泡圈类型的图文浏览试玩
function tryPlay:playApp_2( t, offset, duration)
	offset = offset or {0, 0}
	duration = duration or 60
	local endTime = os.time() + duration
	local function clickItemLocal( )
		local x, y = findMultiColorInRegionFuzzy(t[1],t[2],t[3],t[4],t[5],t[6],t[7])
		if x~= -1 and y~= -1 then
			click(x + offset[1], y + offset[2])
			mSleep(2000)
			return true
		else
			return false
		end
	end

	local function selectItemLocal( )
		for i=1,3 do
			self:movePageUp()
			if math.random() <= 8 then
				break
			end
		end
		return clickItemLocal()
	end

	--是否先读一篇文章
	if math.random(1, 10) > 5 then
		if clickItemLocal() then
			self:readItem()
			mSleep(2000)
			self:clickBack()
		end
	end
	while true do
		local nCount = math.random(2, 5)
		for i= 1, nCount do
			if selectItemLocal() then
				mSleep(math.random(1000, 3000))
				self:readItem()
				self:clickBack()
			else
				mSleep(math.random(1000, 3000))
			end
			if os.time() > endTime then
				return
			end
		end
		-- 刷新
		self:refreshPage()
	end
end

-- 视频类app 试玩
function tryPlay:playVideoApp( checkVideoPlay, duration )
	duration = duration or 180
	local endTime = os.time() + duration

	while true do
		local nCount = math.random(0, 4)
		for i= 1, nCount do
			self:selectItem()
			if checkVideoPlay() then
				toast('观看一会',1)
				local leftTime = endTime - os.time()
				mSleep(math.random(math.min(10, leftTime),   math.min(120,  leftTime) ) * 1000)
			end
			self:clickBack()
			if os.time() > endTime then
				return
			end
		end
		-- 刷新
--		self:refreshPage()
		if os.time() > endTime then
			return
		end
	end
end


return tryPlay

