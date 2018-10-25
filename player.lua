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

	newPlayer.world = world

	player1.update = function(self, keys)
		if keys.up == true then
			if player1.y > 0 then
				player1.y = player1.y - 4
			else
				player1.y = 0
			end
		end
		
		if keys.down == true then
			if player1. y < (love.graphics.getHeight() - player1.height) then
				player1.y = player1.y + 4
			else
				player1.y = love.graphics.getHeight() - player1.height
			end
		end

		if keys.left == true then
			if player1.x > 0 then
				player1.x = player1.x - 4
			else
				player1.x = 0
			end
		end

		if keys.right == true then
			if player1.x + player1.width < love.graphics.getWidth() then
				player1.x = player1.x + 4
			else
				player1.x = love.graphics.getWidth() - player1.width
			end
		end
	end

	player1.draw = function(self)
		-- love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
	end

	return player1, newPlayer
end


return player