-- DONE: implementar função keyDown e keyReleased no bloco main
local player = {}

p = love.physics
g = love.graphics

function player.new(world, x, y, width, height)
	local player1 = {}
	player1.x = x or 50
	player1.y = y or 400
	player1.width = width or 20
	player1.height = height or 20

	local newPlayer = {}
	newPlayer.body = p.newBody(world, x, y, "dynamic")
	newPlayer.shape = p.newRectangleShape(width, height)
	newPlayer.fixture = p.newFixture(newPlayer.body, newPlayer.shape)

	newPlayer.body:setLinearDamping(5)

	newPlayer.update = function(self, keys)
		if keys.up then self.body:applyForce(0, -600) end
		if keys.down then self.body:applyForce(0, 600) end
		if keys.left then self.body:applyForce(-600, 0) end
		if keys.right then self.body:applyForce(600, 0) end
	end

	newPlayer.draw = function(self)
		love.graphics.polygon("fill", self.body:getWorldPoints(self.shape:getPoints()))
	end

	return newPlayer
end


return player