-- background file for Navy
local bg = {}

function bg.new()
	local newBg = {}
	local objects = objGen(800, 600, 64)
	newBg.speed = 8
	newBg.objects = objects

	newBg.getObjNum = function(self)
		return #self.objects
	end

	newBg.update = function(self)
		for i, k in pairs(self.objects) do
			if k.x < 0 then
				k.x = love.graphics.getWidth() + 10
			else
				k.x = k.x - self.speed
			end
		end
	end
	newBg.draw = function(self)
		for i, k in pairs(self.objects) do
			love.graphics.rectangle("fill", k.x, k.y, 5, 5)
		end
	end
	return newBg
end

function objGen(height, width, objCount)
	local objList = {}

	math.randomseed(os.time())
	for i = 1, objCount do
		local star = {}
		star.x = math.random(1, height)
		star.y = math.random(1, width)
		table.insert(objList, star)
	end
	
	return objList
end

return bg