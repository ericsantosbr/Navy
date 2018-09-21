-- base enemy file for navy
-- movement only on y axis first

local enemy = {}

function enemy.new(x, y, width, height, speed)
	local newEnemy = {}
	newEnemy.x = x or 600
	newEnemy.y = y or 400
	newEnemy.width = width or 15
	newEnemy.height = height or 8
	newEnemy.speed = speed or 4
	newEnemy.update = function()
		if newEnemy.speed < 0 and newEnemy.y < 0 then
			newEnemy.speed = newEnemy.speed * (-1)
		elseif  newEnemy.speed > 0 and love.graphics.getHeight > newEnemy.width + newEnemy.y then
			newEnemy.speed = newEnemy.speed * (-1)
		else
			newEnemy.y = newEnemy.y + newEnemy.speed
		end
	end
	newEnemy.draw = love.graphics.rectangle("fill", newEnemy.x, newEnemy.y, newEnemy.width, newEnemy.height)
	return newEnemy
end

--[[function enemy:update()
	if self.speed < 0 and self.y < 0 then
		self.speed = self.speed * (-1)
	elseif self.speed > 0 and love.graphics.getHeight > self.width + self.y
		self.speed = self.speed * (-1)
	else
		self.y = self.y + self.speed
	end
end]]--

return enemy