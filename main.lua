require "pads"
require "ball"


function love.load()
  ballCentring()
end


function love.update(dt)
  -- moving pads
  if love.keyboard.isDown('up') and padLeft.positionY > 0 then
    padLeft.positionY = padLeft.positionY - 4
  end
  
  if love.keyboard.isDown('down') and (padLeft.positionY + padLeft.height) < love.graphics.getHeight() then
    padLeft.positionY = padLeft.positionY + 4
  end
  
  -- ball movement
  ball.positionY = ball.positionY + ball.speedY
  ball.positionX = ball.positionX + ball.speedX
  
  
  -- collisions management with the 4 walls
  if ball.positionY > (love.graphics.getHeight() - ball.height) then
    ball.speedY = -ball.speedY
  end
  
  if ball.positionY <= 0 then
    ball.speedY = -ball.speedY
  end
    
  if ball.positionX > (love.graphics.getWidth() - ball.width) then
    ball.speedX = -ball.speedX
  end
  
  if ball.positionX <= 0 then
    ballCentring()
  end
  
  -- left pad collision
  -- if ... and - (the bottom of the ball) is under the top of pad - and - the top of the ball is above (the bottom of the pad)
  if ball.positionX <= (padLeft.positionX + padLeft.width) and (ball.positionY + ball.height) > padLeft.positionY and ball.positionY < (padLeft.positionY + padLeft.height) then
    ball.speedX = -ball.speedX
    
    -- ball repositionning
    ball.positionX = padLeft.positionX + padLeft.width
  end
end


function love.draw()
  love.graphics.rectangle('fill', padLeft.positionX, padLeft.positionY, padLeft.width, padLeft.height)
  love.graphics.rectangle('fill', padRight.positionX, padRight.positionY, padRight.width, padRight.height)
  
  love.graphics.rectangle('fill', ball.positionX, ball.positionY, ball.width, ball.height)
end