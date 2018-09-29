-- collision check file for Navy
local collision = {}

function collision.check(obj1, obj2)
	--local k = {x = 600, y = 400, width = 10, height = 10}
	--obj2 = obj2 or k
	if obj1.x >= obj2.x and obj1.x <= obj2.x + obj2.width and obj1.y >= obj2.y and obj1.y <= obj2.y + obj2.height then
		return true
	elseif obj1.x + obj1.width >= obj2.x and obj1.x + obj1.width <= obj2.x + obj2.width and obj1.y + obj1.height >= obj2.y and obj1.y + obj1.height <= obj2.y + obj2.height then
		return true
	elseif obj1.x + obj1.width >= obj2.x and obj1.x + obj1.width <= obj2.x + obj2.width and obj1.y >= obj2.y and obj1.y <= obj2.y + obj2.height then
		return true
	elseif obj1.x >= obj2.x and obj1.x <= obj2.x and obj1.y + obj1.height >= obj2.y and obj1.y + obj1.height <= obj2.y + obj2.height then
		return true
	elseif obj2.x >= obj1.x and obj2.x <= obj1.x + obj1.width and obj2.y >= obj1.y and obj2.y <= obj1.y + obj1.height then
		return true
	elseif obj2.x + obj2.width >= obj1.x and obj2.x + obj2.width <= obj1.x + obj1.width and obj2.y + obj2.height >= obj1.y and obj2.y + obj2.height <= obj1.y + obj1.height then
		return true
	elseif obj2.x + obj2.width >= obj1.x and obj2.x + obj2.width <= obj1.x + obj1.width and obj2.y >= obj1.y and obj2.y <= obj1.y + obj1.height then
		return true
	elseif obj2.x >= obj1.x and obj2.x <= obj1.x and obj2.y + obj2.height >= obj1.y and obj2.y + obj2.height <= obj1.y + obj1.height then
		return true
	else
		return false
	end

end

return collision