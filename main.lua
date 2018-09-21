-- main file for Navy game
-- DONE: implementar melhoria nas funções de keyDown e keyUp usando callbacks Lua

local threadPile = {}
local drawPile = {}
local player = require("player")
local downKeys = {up = false, down = false, left = false, right = false}

function love.load(args)
	player.x = 50
	player.y = 50
	player.width = 50
	player.height = 50
end

function love.update(dt)
	player:update(downKeys)
	if love.keyboard.isDown("escape") then love.event.quit() end
end

function love.draw()
	love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
end

function love.keypressed(key)
	if key == "up" then downKeys.up = true end
	if key == "down" then downKeys.down = true end
	if key == "left" then downKeys.left = true end
	if key == "right" then downKeys.right = true end
end

function love.keyreleased(key)
	if key == "up" then downKeys.up = false end
	if key == "down" then downKeys.down = false end
	if key == "left" then downKeys.left = false end
	if key == "right" then downKeys.right = false end
end