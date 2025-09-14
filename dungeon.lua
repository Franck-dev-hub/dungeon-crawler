-- Module creation
local dungeon = {}

-- Variables
local map = {}
dungeon.width = 0
dungeon.height = 0
dungeon.sizeCase = 9

-- Player directions
dungeon.NORTH = 1
dungeon.EAST = 2
dungeon.SOUTH  = 3
dungeon.WEST = 4

-- Player position
dungeon.playerX = 0
dungeon.playerY = 0
dungeon.playerDirection = 0

-- Load arrow's images
local imgNORTH = love.graphics.newImage("assets/arrow/north.png")
local imgSOUTH = love.graphics.newImage("assets/arrow/south.png")
local imgEAST = love.graphics.newImage("assets/arrow/east.png")
local imgWEST = love.graphics.newImage("assets/arrow/west.png")

-- Graphic variables
local FOV = {}
local xDungeon = 10
local yDungeon = 10
local widthDungeon = 150
local heightDungeon = 150
local sizeWall1 = 20
local sizeWall2 = 30
local column1Left = sizeWall1
local column1Right = widthDungeon - column1Left
local column2Left = sizeWall1 + sizeWall2
local column2Right = widthDungeon - column2Left
local row1Top = sizeWall1
local row1Bottom = heightDungeon - row1Top
local row2Top = sizeWall1 + sizeWall2
local row2Bottom = heightDungeon - row2Top

-- Load the dungeon
function dungeon.load()
	map = {
		{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
		{1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1},
		{1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1},
		{1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1},
		{1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1},
		{1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1},
		{1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1},
		{1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1},
		{1, 0, 1, 0, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1},
		{1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1},
		{1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1},
		{1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1},
		{1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1},
		{1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1},
		{1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1},
		{1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		{1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1},
		{1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1},
		{1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1, 0, 1},
		{1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1},
		{1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1},
		{1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1},
		{1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1, 1, 1},
		{1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1},
		{1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1},
		{1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1},
		{1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1},
		{1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1},
		{1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1},
		{1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1},
		{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
	}

-- Get map size
dungeon.width = #map[1]
dungeon.height = #map
end

-- Load player position
function dungeon.changePlayerPosition(x, y, direction)
	dungeon.playerX = x
	dungeon.playerY = y
	dungeon.playerDirection = direction
end

function dungeon.case(row, column)
	return map[row][column]
end

function changeFOV(vrow, vcolumn, maprow,mapcolumn)
	if maprow > 0 and mapcolumn > 0 and mapcolumn <=#map[1] and maprow <= #map then
		FOV[vrow][vcolumn] = map[maprow][mapcolumn]
	end
end

function dungeon.calculateFOV()
	FOV = {}
	for row = 1, 3 do
		FOV[row] = {0, 0, 0}
	end

	local x = dungeon.playerX
	local y = dungeon.playerY

	-- 7  8  9
	-- 4  5  6
	-- 1 (2) 3
	if dungeon.playerDirection == dungeon.NORTH then
		changeFOV(1, 1, y, x - 1)
		changeFOV(1, 2, y, x)
		changeFOV(1, 3, y, x + 1)
		changeFOV(2, 1, y - 1, x - 1)
		changeFOV(2, 2, y - 1, x)
		changeFOV(2, 3, y - 1, x + 1)
		changeFOV(3, 1, y - 2, x - 1)
		changeFOV(3, 2, y - 2, x)
		changeFOV(3, 3, y - 2, x + 1)
	end
	--  1  4  7
	-- (2) 5  8
	--  3  6  9
	if dungeon.playerDirection == dungeon.EAST then
		changeFOV(1, 1, y - 1, x)
		changeFOV(1, 2, y, x)
		changeFOV(1, 3, y + 1, x)
		changeFOV(2, 1, y - 1, x + 1)
		changeFOV(2, 2, y, x + 1)
		changeFOV(2, 3, y + 1, x + 1)
		changeFOV(3, 1, y - 1, x + 2)
		changeFOV(3, 2, y, x + 2)
		changeFOV(3, 3, y + 1, x + 2)
	end
	-- 3 (2) 1
	-- 6  5  4
	-- 9  8  7
	if dungeon.playerDirection == dungeon.SOUTH then
		changeFOV(1, 1, y, x + 1)
		changeFOV(1, 2, y, x)
		changeFOV(1, 3, y, x - 1)
		changeFOV(2, 1, y + 1, x + 1)
		changeFOV(2, 2, y + 1, x)
		changeFOV(2, 3, y + 1, x - 1)
		changeFOV(3, 1, y + 2, x + 1)
		changeFOV(3, 2, y + 2, x)
		changeFOV(3, 3, y + 2, x - 1)
	end
	-- 9  6  3
	-- 8  5 (2)
	-- 7  4  1
	if dungeon.playerDirection == dungeon.WEST then
		changeFOV(1, 1, y + 1, x)
		changeFOV(1, 2, y, x)
		changeFOV(1, 3, y - 1, x)
		changeFOV(2, 1, y + 1, x - 1)
		changeFOV(2, 2, y, x - 1)
		changeFOV(2, 3, y - 1, x - 1)
		changeFOV(3, 1, y + 1, x - 2)
		changeFOV(3, 2, y, x - 2)
		changeFOV(3, 3, y - 1, x - 2)
	end
end

function drawWall(vertices)
	love.graphics.setColor(0.5, 0.5, 0.5)
	love.graphics.polygon("fill", vertices)
	love.graphics.setColor(0, 0, 0)
	love.graphics.polygon("line", vertices)
end

function draw2D()
	-- Draw map
	for row = 1, dungeon.height do
		for column = 1, dungeon.width do
			local x = (column - 1) * dungeon.sizeCase
			local y = (row - 1) * dungeon.sizeCase
			local case = map[row][column]
			if case == 1 then
				love.graphics.setColor(1, 1, 1)
			else
				love.graphics.setColor(0.3, 0.3, 0.3)
			end
			love.graphics.rectangle("fill", x, y, dungeon.sizeCase, dungeon.sizeCase)
			if row == dungeon.playerY and column == dungeon.playerX then
				love.graphics.setColor(0, 1, 1)
				-- Draw image in function of the player direction
				if dungeon.playerDirection == dungeon.NORTH then
					love.graphics.draw(imgNORTH, x, y)
				elseif dungeon.playerDirection == dungeon.EAST then
					love.graphics.draw(imgEAST, x, y)
				elseif dungeon.playerDirection == dungeon.SOUTH then
					love.graphics.draw(imgSOUTH, x, y)
				elseif dungeon.playerDirection == dungeon.WEST then
					love.graphics.draw(imgWEST, x, y)
				end
			end
		end
	end
end

function draw3D()
	dungeon.calculateFOV()

	love.graphics.translate(xDungeon, yDungeon)
	love.graphics.setColor(0, 0, 0)
	love.graphics.rectangle("line", 0, 0, widthDungeon, heightDungeon)

	if FOV[3][1] ~= 0 then
		drawWall(
			{
				0, row2Top,
				column2Left, row2Top,
				column2Left, row2Bottom,
				0, row2Bottom
			}
		)
	end
	if FOV[3][2] ~= 0 then
		drawWall(
			{
				column2Left, row2Top,
				column2Right, row2Top,
				column2Right, row2Bottom,
				column2Left, row2Bottom
			}
		)
	end
	if FOV[3][3] ~= 0 then
		drawWall(
			{
				column2Right, row2Top,
				widthDungeon, row2Top,
				widthDungeon, row2Bottom,
				column2Right, row2Bottom
			}
		)
	end
	if FOV[2][1] ~= 0 then
		drawWall(
			{
				0, row1Top,
				column1Left, row1Top,
				column1Left, row1Bottom,
				0, row1Bottom
			}
		)
		drawWall(
			{
				column1Left, row1Top,
				column2Left, row2Top,
				column2Left, row2Bottom,
				column1Left, row1Bottom,
			}
		)
	end
	if FOV[2][3] ~= 0 then
		drawWall(
			{
				column1Right, row1Top,
				widthDungeon, row1Top,
				widthDungeon, row1Bottom,
				column1Right, row1Bottom
			}
		)
		drawWall(
			{
				column2Right, row2Top,
				column1Right, row1Top,
				column1Right, row1Bottom,
				column2Right, row2Bottom,
			}
		)
	end
	if FOV[2][2] ~= 0 then
		drawWall(
			{
				column1Left, row1Top,
				column1Right, row1Top,
				column1Right, row1Bottom,
				column1Left, row1Bottom
			}
		)
	end
	if FOV[1][1] ~= 0 then
		drawWall(
			{
				0, 0,
				column1Left, row1Top,
				column1Left, row1Bottom,
				0, heightDungeon
			}
		)
	end
	if FOV[1][3] ~= 0 then
		drawWall(
			{
				column1Right, row1Top,
				widthDungeon, 0,
				widthDungeon, heightDungeon,
				column1Right, row1Bottom
			}
		)
	end
end

function dungeon.changeCase(row, column, value)
	map[row][column] = value
end

-- Draw the dungeon
function dungeon.draw(dt, mode)
	love.graphics.setBackgroundColor(0.5, 0.5, 0.5)
	if mode == "2D" then
		draw2D()
	elseif mode == "3D" then
		draw3D()
	end
end

-- Return module
return dungeon
