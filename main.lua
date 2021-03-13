padLeft = {}
padLeft.positionX = 0
padLeft.positionY = 0
padLeft.width = 10
padLeft.height = 80

padRight = {}
padRight.positionX = 789
padRight.positionY = 519
padRight.width = 10
padRight.height = 80

ball = {}
ball.positionX = 0
ball.positionY = 0
ball.width = 10
ball.height = 10
ball.speedX = 4
ball.speedY = 4

function love.load()
  -- centring of the ball
  ball.positionX = (love.graphics.getWidth() / 2) - (ball.width / 2)
  ball.positionY = (love.graphics.getHeight() / 2) - (ball.height / 2)
end

function love.update(dt)
  
  if love.keyboard.isDown('up') and padLeft.positionY > 0 then
    padLeft.positionY = padLeft.positionY - 4
  end
  
  if love.keyboard.isDown('down') and (padLeft.positionY + padLeft.height) < love.graphics.getHeight() then
    padLeft.positionY = padLeft.positionY + 4
  end
  
  ball.positionY = ball.positionY + ball.speedY
  ball.positionX = ball.positionX + ball.speedX
  
  if ball.positionY > (love.graphics.getHeight() - ball.height) then
    ball.speedY = -ball.speedY
  end
  
  if ball.positionY <= 10 then
    ball.speedY = -ball.speedY
  end
    
  if ball.positionX > (love.graphics.getWidth() - ball.width) then
    ball.speedX = -ball.speedX
  end
  
  if ball.positionX <= 10 then
    ball.speedX = -ball.speedX
  end
  
end

function love.draw()
  love.graphics.rectangle('fill', padLeft.positionX, padLeft.positionY, padLeft.width, padLeft.height)
  love.graphics.rectangle('fill', padRight.positionX, padRight.positionY, padRight.width, padRight.height)
  
  love.graphics.circle('fill', ball.positionX, ball.positionY, ball.width, ball.height)
end