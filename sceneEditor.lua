-- Module creation
local sceneEditor = {}

-- Load editor scene
function sceneEditor.load()
end

-- Update editor scne
function sceneEditor.update(dt)
end

-- Draw editor scene
function sceneEditor.draw(dt)
	love.graphics.print("Editor scene")
end

-- Keyboard management
function sceneEditor.keypressed(key)
end

-- Mouse management
function sceneEditor.mousepressed(x, y, button, istouch)
end

-- Module return
return sceneEditor
