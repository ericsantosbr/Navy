-- base enemy file for navy

local enemy = {}

function enemy.new(x, y, width, height, speed)
	local newEnemy = {}
	newEnemy.x = x or 600
	newEnemy.y = y or 400
	newEnemy.width = width or 10
	newEnemy.height = height or 10
	newEnemy.speed = speed or 2

	newEnemy.update = function(self)
		if self.y <= 0 then
			self.speed = self.speed * (-1)
		elseif self.y + self.height >= love.graphics.getHeight() then
			self.speed = self.speed * (-1)
		end
		self.y = self.y + self.speed
	end

	newEnemy.draw = function(self)
		love.graphics.setColor(0, 0, 255)
		love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
	end

	return newEnemy
end

return enemy