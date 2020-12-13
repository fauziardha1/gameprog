Class = require 'class' 
require 'Ball'
require 'Paddle'
require 'Brick'
WINDOW_WIDTH = 800
WINDOW_HEIGHT = 600
VIRTUAL_WIDTH = 800
VIRTUAL_HEIGHT = 600 
ball_width = 20

function love.load()
    love.window.setMode(800, 600)
    love.window.setTitle('BreakIT')
    math.randomseed(os.time())
    ballSkin = love.graphics.newImage("/assets/ball.png")
 
     
    ball = Ball(VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, ball_width, ball_width)
    paddle = Paddle() 
    brick = Brick()
    gameState = 'start'
end

function love.update(dt) 
    if gameState == 'serve' then 

        ball.dx = math.random(-50, 50)
        
    elseif gameState == 'play' then  
        -- collution of ball and paddle
        if ball:collides(paddle) then
            ball.dy = -ball.dy * 1.0
            ball.y = paddle.y - ball_width

            if ball.dx < 0 then
                ball.dx = -math.random(10, 150)
            else
                ball.dx = math.random(10, 150)
            end
        end
 

    -- TODO : detect bricks collution over ball
    --        change ball direction
    --        destroy particular bricks

       ball:mantul()
			 
	end
    
    -- simulate update update
    if gameState == 'play' then
        ball:update(dt)
	end
    paddle:update(dt)
     
     
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    elseif key == 'enter' or key == 'return' then
        if gameState == 'start' then
            gameState = 'serve'
        elseif gameState == 'serve' then
            gameState = 'play'
        elseif gameState == 'done' then
            gameState = 'serve'
            ball:reset()
            player1Score = 0
            player2Score = 0
            if winningPlayer == 1 then
                servingPlayer = 2
            else
                servingPlayer = 1
            end
        end
    end
end

function love.draw()
    
    love.graphics.clear(40/255, 45/255, 52/255, 255/255) 
    
    ball:render() 
    paddle:render()
    brick:render()
end

function displayFPS()
     
end
 
function displayScore()
    
end
