-- file for the shots
local shot = {}

shot.numShot = 0

function shot.new(originX, originY, originWidth, originHeight, speed, width, height)
	local shoot = {}
	shoot.x = originX
	shoot.y = originY
	shoot.width = width or 15
	shoot.height = height or 8
	shoot.speed = speed or 10
	shoot.update = function(self)
		if love.graphics.getWidth() < self.x then
			shot.numShot = shot.numShot + 1
		else self.x = self.x + self.speed end
	end
	shoot.draw = function(self)
		love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
	end
	return shoot
end

return shot