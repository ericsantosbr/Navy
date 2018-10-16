-- background file for Navy

local bg = {}

function bg.new()
	local newBg = {}
<<<<<<< HEAD
	local objects = objGen(800, 600, 64)
=======
	local objects = {}
>>>>>>> master
	newBg.objects = objects
	newBg.getObjNum = function(self)
		return #self.objects
	end
<<<<<<< HEAD
	newBg.update = function(self)
		
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
	newWidth = 0
	newHeight = 0
	math.randomseed(os.time())
	for i = 1, objCount do
		local star = {}
		star.x = math.random(0, height)
		star.y = math.random(0, width)
		table.insert(objList, star)
	end
	print(#objList)
	return objList
end

=======
	return newBg
end

>>>>>>> master
return bg