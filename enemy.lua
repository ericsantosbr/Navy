-- base enemy file for navy
-- movement only on y axis first

local enemy = {}

function enemy.new(x, y, width, height, speed)
	local newEnemy = {}
	newEnemy.x = x or 600
	newEnemy.y = y or 400
	newEnemy.width = width or 10
	newEnemy.height = height or 10
	newEnemy.speed = speed or 4
	newEnemy.update = function(self)
		-- if self.speed < 0 and self.y < 0 then
		-- 	self.speed = self.speed * (-1)
		-- elseif self.speed > 0 and love.graphics.getHeight() > self.width + self.y then
		-- 	self.speed = newEnemy.speed * (-1)
		-- else
		-- 	newEnemy.y = newEnemy.y + newEnemy.speed
		-- end
	end
	newEnemy.draw = function(self)
		love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
	end
	return newEnemy
end

return enemy