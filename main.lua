require("basicDraw")

function love.load()
  Partition:load ()
  TurnIndicator:load ()
  winLoseCounter:load ()
  GridSize = 600
  scaleFac = 0.5
  assets = {grid = love.graphics.newImage("tictacgrid.png"),                    -- Assets table is created for easy indexing in future for all assets
            knot = love.graphics.newImage("knot.png"),
            cross = love.graphics.newImage("cross.png")}
  drawBlock = {}
  playState = assets.cross
end

function love.mousereleased(x, y, button)                                       -- mousereleased used instead of update in order to save computation power
   if button == 1 then                                                          -- This block will update the game state only when mouse is released
      returnBlock()
      changePlayState()
   end
end

function love.draw()
  Partition:draw ()
  love.graphics.draw(assets.grid, 0, 0)
  for i,v in ipairs(drawBlock) do                                               -- ipairs is used to bring in iterator without creating one explicitly
    love.graphics.draw(v[3], v[1]+(((GridSize/3)*scaleFac)/2),                  -- Asset to be drawn is decided at the run-time just by passing drawable through tables
                        v[2]+(((GridSize/3)*scaleFac)/2), 0,
                        scaleFac, scaleFac)
  end
  TurnIndicator:draw ()
  winLoseCounter:draw ()
end

function returnBlock ()                                                         -- Will store the position of table {x,y} of mouse position in global table drawBlock
  local x = math.floor(love.mouse.getX() / (GridSize/3))
  local y = math.floor(love.mouse.getY() / (GridSize/3))
  local drawxy = {}
  if x*(GridSize/3) < GridSize and y*(GridSize/3) < GridSize then               -- Multiply local x and y with the size of one block in the grid and compare it with gridsize to make sure block to be returned is within limits
    table.insert(drawxy, x*(GridSize/3))
    table.insert(drawxy, y*(GridSize/3))
    table.insert(drawBlock, drawxy)
    table.insert(drawxy, playState)
  end
end

function changePlayState()                                                      -- To rotate control between player1 and player2 for knots and crosses
  if playState == assets.cross then
    playState = assets.knot
  else
    playState = assets.cross
  end
end
