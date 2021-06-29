--Includes only basic structure of the graphics like lines and logos to be drawn
--before game loads

Partition = {}                   --This is for the line partition

function Partition:load ()
  self.x = 612
  self.y = 2
  self.width = 411
  self.height = 598
end

function Partition:draw ()
  love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end

TurnIndicator = {}               --Indicates whose turn it is to play

function TurnIndicator:load ()
  self.x = 612 + 411/2 - 50
  self.y = 100
  self.width = 101
  self.height = 100
end

function TurnIndicator:draw ()
  love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
  love.graphics.draw(playState, self.x + 0.4, self.y, 0, 0.5, 0.5)
end


winLoseCounter = {}              --To keep the count of who won how many matches

function winLoseCounter:load ()
  self.x = 612
  self.y = 203
  self.width = 411
  self.height = 100
  self.winX = 0
  self.winO = 0
  self.tie = 0
end

function winLoseCounter:draw ()
  love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
  love.graphics.print("Score total:", self.x + 170, self.y + 15)
  love.graphics.print(string.format("X = %02d", self.winX), self.x + 25, self.y + 50, 0, 2, 2)
  love.graphics.print(string.format("Tie = %02d", self.winX), self.x + 150, self.y + 50, 0, 2, 2)
  love.graphics.print(string.format("O = %02d", self.winX), self.x + 300, self.y + 50, 0, 2, 2)
end
