-- Module creation
local sceneDongeon = {}

-- Module load
local dongeon = require("dongeon")

-- Load donjon scene
function sceneDongeon.load()
	-- Load dongeon
	dongeon.load()
end

-- Update donjon scne
function sceneDongeon.update(dt)
end

-- Draw donjon scene
function sceneDongeon.draw(dt)
	-- Init with 2D dungeon
	love.graphics.print("Dongeon scene")
	dongeon.draw(dt, "2D")
end

-- Keyboard management
function sceneDongeon.keypressed(key)
end

-- Mouse management
function sceneDongeon.mousepressed(x, y, button, istouch)
end

-- Module return
return sceneDongeon
