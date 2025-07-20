-- Imports
local sceneDongeon = require("sceneDongeon")
local sceneEditor = require("sceneEditor")

-- Inits
local sceneCurrent = sceneDongeon

-- Core pdate is executed each frame based on dt
function love.update(dt)
	sceneCurrent.update(dt)
end

-- Draw update is executed each frame based on dt
function love.draw(dt)
	sceneCurrent.draw(dt)
end

-- Is executed each time a key is pressed
function love.keypressed(key)
	sceneCurrent.keypressed(key)
end

-- Is executed each time mouse button is pressed
function love.mousepressed(x, y, button, istouch)
	sceneCurrent.moussepressed(x, y , button, istouch)
end
