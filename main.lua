 
Class = require 'class' 
require 'Ball'
require 'Paddle'
WINDOW_WIDTH = 800
WINDOW_HEIGHT = 600
VIRTUAL_WIDTH = WINDOW_WIDTH
VIRTUAL_HEIGHT = WINDOW_HEIGHT 

function love.load()
    love.window.setMode(800, 600, {resizable=false, vsync=false, minwidth=VIRTUAL_WIDTH, minheight=VIRTUAL_HEIGHT})
    love.window.setTitle('BreakIT')
    math.randomseed(os.time())
    ballSkin = love.graphics.newImage("/assets/ball.png")
 
     
    ball = Ball(VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 20, 20)
	gameState = 'start'
end

function love.update(dt)
    if gameState == 'serve' then 

        ball.dx = math.random(-50, 50)
        if servingPlayer == 1 then
            ball.dy = math.random(140, 200)
        else
            ball.dy = -math.random(140, 200)
        end
    elseif gameState == 'play' then
          
        if ball.y <= 0 then
            ball.y = 0
            ball.dy = -ball.dy
        end

        if ball.y >= VIRTUAL_HEIGHT - 4 then
            ball.y = VIRTUAL_HEIGHT - 4
            ball.dy = -ball.dy
        end

        if ball.x <= 0 then
            ball.x = 0
            ball.dx = -ball.dx
        end

        if ball.x >= VIRTUAL_WIDTH - 4 then
            ball.x = VIRTUAL_WIDTH - 4
            ball.dx = -ball.dx
        end
			 
	end
  
    if gameState == 'play' then
        ball:update(dt)
	end
     
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
end

function displayFPS()
     
end
 
function displayScore()
    
end
