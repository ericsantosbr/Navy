-- DONE: implementar função keyDown e keyReleased no bloco main
local player = {}

function new()
	player.x = 50
	player.y = 400
	player.width = 20
	player.height = 20
end

function player:update(keys)
	if keys.up == true then
		if player.y > 0 then
			player.y = player.y - 4
		else
			player.y = 0
		end
	end
	
	if keys.down == true then
		if player. y < (love.graphics.getHeight() - player.height) then
			player.y = player.y + 4
		else
			player.y = love.graphics.getHeight() - player.height
		end
	end

	if keys.left == true then
		if player.x > 0 then
			player.x = player.x - 4
		else
			player.x = 0
		end
	end

	if keys.right == true then
		if player.x + player.width < love.graphics.getWidth() then
			player.x = player.x + 4
		else
			player.x = love.graphics.getWidth() - player.width
		end
	end
end

function player:draw()
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

new()
return player