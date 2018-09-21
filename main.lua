-- main file for Navy game
-- DONE: implementar melhoria nas funções de keyDown e keyUp usando callbacks Lua

local threadPile = {}
local drawPile = {}
local player = require("player")
local shot = require("shots")
local downKeys = {up = false, down = false, left = false, right = false, spacebar = false}
local shots = {}

function love.load(args)
	table.insert(drawPile, player)
	-- shoot = shot.new(player)
end

-- TODO: atualizar função de tiros pra adicionar cadência
function love.update(dt)
	player:update(downKeys)
	if love.keyboard.isDown("escape") then love.event.quit() end
	if downKeys.spacebar then
		-- local shoot = shot.new(player, 2)
		table.insert(shots, {x = player.x + (player.width / 2), y = player.y + (player.height / 2), speed = 3})
	end
	for i in pairs(shots) do
		if shots[i].x > love.graphics.getWidth() then table.remove(shots, i)
		else shots[i].x = shots[i].x + shots[i].speed end
	end
end

function love.draw()
	for i in pairs(drawPile) do
		drawPile[i]:draw()
	end
	for i in pairs(shots) do
		love.graphics.rectangle("fill", shots[i].x, shots[i].y, 15, 8)
	end
	if downKeys.spacebar then love.graphics.print("pew pew", 10, 20, 0) end
end

function love.keypressed(key)
	if key == "up" then downKeys.up = true end
	if key == "down" then downKeys.down = true end
	if key == "left" then downKeys.left = true end
	if key == "right" then downKeys.right = true end
	if key == "space" then downKeys.spacebar = true end
end

function love.keyreleased(key)
	if key == "up" then downKeys.up = false end
	if key == "down" then downKeys.down = false end
	if key == "left" then downKeys.left = false end
	if key == "right" then downKeys.right = false end
	if key == "space" then downKeys.spacebar = false end
end