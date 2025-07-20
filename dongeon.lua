-- Module creation
local dongeon = {}

-- Load the dongeon
function donjon.load()
end

function draw2D()
end

function draw3D()
end

-- Draw the dungon
function donjon.draw(dt, mode)
	if mode == "2D" then
		draw2D()
	elseif mode == "3D" then
		draw3D()
	end
end

-- Return module
return donjon
