-- DONE: implementar função keyDown e keyReleased no bloco main
local player = {}

function player.new()
	local player1 = {}
	player1.x = 50
	player1.y = 400
	player1.width = 20
	player1.height = 20

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
		love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
	end

	return player1
end


return player