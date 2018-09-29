-- main file for Navy game
-- DONE: implementar melhoria nas funções de keyDown e keyUp usando callbacks Lua
-- DONE: atualizar função de tiros pra adicionar cadência
-- DONE: implementar arquivos de colisão para checar colisão entre tiros e inimigos
-- DONE: definir as pilhas e o método que será usado para definir as colisões, fazendo uso dessas pilhas
-- DONE: Implementar behavior simples de inimigos

-- TODO: Implementar behavior avançado de inimigos
-- TODO: Implementar reset dos padrões de draw
-- TODO: Implementar sprites básicos do personagem
-- TODO: Implementar sprites de inimigos
-- TODO: Implementar geração do fundo estrelado

-- table piles that will be used on iteratons
local objectPile = {}
local threadPile = {}
local drawPile = {}
local updatePile = {}

-- collision checker
local collision = require("collision")

-- player object
local player = require("player")
local playerPile = {}
local points = 0

-- enemy things
local enemy = require("enemy")
local enemyPile = {}

-- local downKeys = {up = false, down = false, left = false, right = false, spacebar = false}
local downKeys = dofile("keys.lua")

-- shot variables
local shot = require("shots")
local shotCadency = 0.10
local shotSpeed = 20
local shotPile = {}

-- seconds from the running game
local timer = 0
local secs = 0

-- defines if the shoot action can be performed
local time = 0
local shoootable = true

-- test variables
local stats = ""
local enemy1 = enemy.new()
local enemy2 = enemy.new(400, 300, 20, 12)

function love.load(args)
	-- Player props
	table.insert(playerPile, player)
	table.insert(objectPile, playerPile)

	-- Shot props
	table.insert(objectPile, shotPile)

	-- Enemies props
	table.insert(objectPile, enemyPile)

	-- test inserts
	table.insert(enemyPile, enemy1)
	table.insert(enemyPile, enemy2)
end

function love.update(dt)
	-- timing questions updates
	timer = timer + dt
	time = time + dt
	if time >= shotCadency then shootable = true
	else shootable = false end
	secs = timer - (timer % 1)
	-- stats = stats .. secs

	-- if escape is pressed during game
	if love.keyboard.isDown("escape") then love.event.quit() end

	-- checks if a shot is performed
	if downKeys.spacebar and shootable then
		local shot = shot.new(player, shotSpeed)
		time = 0
		table.insert(shotPile, shot)
	end

	-- General object updater
	for i, j in pairs(objectPile) do
		for k, l in pairs(j) do
			l:update(downKeys)
		end
	end

	-- Collision checker
	for i, j in pairs(enemyPile) do
		for k, l in pairs(shotPile) do
	 		if collision.check(j, l) then
	 			enemyPile[i] = nil
	 			shotPile[k] = nil
	 			points = points + 1
	 		end
		end
	end

	-- shows player points
	stats = "Pontos: " .. points
end

function love.draw()
	love.graphics.clear()
	love.graphics.print(tostring(stats), 10, 10, 0)

	-- Draw objects
	for i, j in pairs(objectPile) do
		for k, l in pairs(j) do
			l:draw()
		end
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