-- Module creation
local sceneDungeon = {}

-- Module load
local dungeon = require("dungeon")

-- Load dungeon scene
function sceneDungeon.load()
	-- Load dungeon
	dungeon.load()
end

-- Update dungeon scne
function sceneDungeon.update(dt)
end

-- Draw dungeon scene
function sceneDungeon.draw(dt)
	-- Init with 2D dungeon
	dungeon.draw(dt, "2D")
end

-- Keyboard management
function sceneDungeon.keypressed(key)
end

-- Mouse management
function sceneDungeon.mousepressed(x, y, button, istouch)
end

-- Module return
return sceneDungeon
