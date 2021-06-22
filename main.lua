function love.load()
  GridSize = 600
  scaleFac = 0.5
  grid = love.graphics.newImage("tictacgrid.png")
  knot = love.graphics.newImage("knot.png")
  cross = love.graphics.newImage("cross.png")
  drawBlock = {}
  playState = cross
end

function love.mousereleased(x, y, button)
   if button == 1 then
      returnBlock()
   end
end

function love.draw()
  love.graphics.draw(grid, 0, 0)
  for i,v in ipairs(drawBlock) do
    love.graphics.draw(v[3], v[1]+(((GridSize/3)*scaleFac)/2),
                        v[2]+(((GridSize/3)*scaleFac)/2), 0,
                        scaleFac, scaleFac)
  end
end

function returnBlock ()
  local x = math.floor(love.mouse.getX() / 200)
  local y = math.floor(love.mouse.getY() / 200)
  local drawxy = {}
  if x*200 < 600 and y*200 < 600 then
    table.insert(drawxy, x*200)
    table.insert(drawxy, y*200)
    table.insert(drawBlock, drawxy)
    table.insert(drawxy, playState)
    changePlayState()
  end
end

function changePlayState()
  if playState == cross then
    playState = knot
  else
    playState = cross
  end
end
