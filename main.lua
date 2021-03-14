require "pads"
require "ball"
require "players"


function love.load()
  player1.score = 0
  player2.score = 0
  
  padLeft.positionX = 0
  padLeft.positionY = 0
  
  padRight.positionX = love.graphics.getWidth() - padRight.width
  padRight.positionY = love.graphics.getHeight() - padRight.height
  
  ballCentring()
end


function love.update(dt)
  -- moving left pad
  if love.keyboard.isDown('a') and padLeft.positionY > 0 then
    padLeft.positionY = padLeft.positionY - padLeft.speedY
  end
  
  if love.keyboard.isDown('q') and (padLeft.positionY + padLeft.height) < love.graphics.getHeight() then
    padLeft.positionY = padLeft.positionY + padLeft.speedY
  end
  
  -- moving right pad
  if love.keyboard.isDown('up') and padRight.positionY > 0 then
    padRight.positionY = padRight.positionY - padRight.speedY
  end
  
  if love.keyboard.isDown('down') and (padRight.positionY + padRight.height) < love.graphics.getHeight() then
    padRight.positionY = padRight.positionY + padRight.speedY
  end
  
  -- ball movement
  ball.positionY = ball.positionY + ball.speedY
  ball.positionX = ball.positionX + ball.speedX
  
  
  -- collisions management with top and bottom walls
  if ball.positionY <= 0 or (ball.positionY + ball.height) >= love.graphics.getHeight() then
    ball.speedY = -ball.speedY
  end
  
  -- collisions management with left and right walls
  if ball.positionX <= 0 then
    player2.score = player2.score + 1
    ballCentring()
  end
  
  if (ball.positionX + ball.width) >= love.graphics.getWidth() then
    player1.score = player1.score + 1
    ballCentring()
  end
  
  -- Pads collisions
  -- if ... and - (the bottom of the ball) is under the top of pad - and - the top of the ball is above (the bottom of the pad)
  if ball.positionX <= (padLeft.positionX + padLeft.width) and (ball.positionY + ball.height) > padLeft.positionY and ball.positionY < (padLeft.positionY + padLeft.height) then
    ball.speedX = -ball.speedX
    
    -- ball repositionning
    ball.positionX = padLeft.positionX + padLeft.width
  end
  
  if (ball.positionX + ball.width) >= padRight.positionX  and (ball.positionY + ball.height) > padRight.positionY and ball.positionY < (padRight.positionY + padRight.height) then
    ball.speedX = -ball.speedX
    
    -- ball repositionning
    ball.positionX = padRight.positionX - ball.width
  end
end


function love.draw()
  love.graphics.rectangle('fill', padLeft.positionX, padLeft.positionY, padLeft.width, padLeft.height)
  love.graphics.rectangle('fill', padRight.positionX, padRight.positionY, padRight.width, padRight.height)
  
  love.graphics.rectangle('fill', ball.positionX, ball.positionY, ball.width, ball.height)
  
  scoreboard = player1.score .. "  -  " .. player2.score
  love.graphics.print(scoreboard, 380, 10)
end