-- Module creation
local sceneEditor = {}

local dungeon = require("dungeon")

-- Load editor scene
function sceneEditor.load()
	dungeon.load()
end

-- Update editor scne
function sceneEditor.update(dt)
end

-- Draw editor scene
function sceneEditor.draw(dt)
	dungeon.draw(dt, "2D")
end

-- Keyboard management
function sceneEditor.keypressed(key)
end

-- Mouse management
function sceneEditor.mousepressed(x, y, button, istouch)
    -- Transpose mouse position because of the scale
    x = x / 2
    y = y / 2
    -- Get position
    if button == 1 then
        local row = math.floor(y / dungeon.sizeCase) + 1
        local column = math.floor(x / dungeon.sizeCase) + 1
        -- Switch value
        if dungeon.case(row, column) == 1 then
            dungeon.changeCase(row, column, 0)
        else
            dungeon.changeCase(row, column, 1)
        end
    end
end

-- Module return
return sceneEditor
