-- file for the shots
local shot = {}

function shot.new(shooter, speed)
	local shot = {}
	shot.x = shooter.x + (shooter.width / 2)
	shot.y = shooter.y + (shooter.height / 2)
	shot.width = 15
	shot.height = 7
	shot.speed = speed or 5
	return shot
end

function shot:update()
	self.x = self.x + 4
end

function shot:draw()
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

return shot