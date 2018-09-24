-- main file for Navy game
-- DONE: implementar melhoria nas funções de keyDown e keyUp usando callbacks Lua
-- DONE: atualizar função de tiros pra adicionar cadência

-- table piles that will be used on iteratons
local threadPile = {}
local drawPile = {}
local updatePile = {}

-- player object
local player = require("player")
local shot = require("shots")

-- enemy things
local enemy = require("enemy")
local enemyPile = {}

-- local downKeys = {up = false, down = false, left = false, right = false, spacebar = false}
local downKeys = dofile("keys.lua")
local shots = {}

-- shot variables
local shotCadency = 0.11
local shotSpeed = 8

-- seconds from the running game
local timer = 0
local secs = 0

-- defines if the shoot action can be performed
local time = 0
local shoootable = true

function love.load(args)
	local enemy1 = enemy.new()
	table.insert(drawPile, enemy1)
	table.insert(drawPile, player)
	-- shoot = shot.new(player)
end

function love.update(dt)
	-- timing questions updates
	timer = timer + dt
	time = time + dt
	if time >= shotCadency then shootable = true
	else shootable = false end
	secs = timer - (timer % 1)

	-- player update
	player:update(downKeys)

	-- if escape is pressed during game
	if love.keyboard.isDown("escape") then love.event.quit() end

	-- checks if a shot is performed
	if downKeys.spacebar and shootable then
		table.insert(shots, {x = player.x + (player.width / 2), y = player.y + (player.height / 2), speed = shotSpeed})
		time = 0
	end

	-- update the shot table
	for i in pairs(shots) do
		if shots[i].x > love.graphics.getWidth() then table.remove(shots, i)
		else shots[i].x = shots[i].x + shots[i].speed end
	end
end

function love.draw()
	love.graphics.clear()
	love.graphics.print(tostring(secs), 10, 10, 0)
	for i in pairs(drawPile) do
		drawPile[i]:draw()
	end
	-- test: enemy draw
	for i in pairs(enemyPile) do
		enemyPile[i]:draw()
	end

	for i in pairs(shots) do
		love.graphics.rectangle("fill", shots[i].x, shots[i].y, 15, 8)
	end
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