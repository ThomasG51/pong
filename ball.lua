ball = {}
ball.positionX = 0
ball.positionY = 0
ball.width = 15
ball.height = 15
ball.speedX = 4
ball.speedY = 4

function ballCentring()
  ball.positionX = (love.graphics.getWidth() / 2) - (ball.width / 2)
  ball.positionY = (love.graphics.getHeight() / 2) - (ball.height / 2)
  ball.speedX = 4
  ball.speedY = 4
end