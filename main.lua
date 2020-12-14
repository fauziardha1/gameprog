Class = require 'class' 
require 'Ball'
require 'Paddle'
require 'Brick'
require 'MainMenu'
require 'Gameover'

WINDOW_WIDTH = 800
WINDOW_HEIGHT = 600
VIRTUAL_WIDTH = 800
VIRTUAL_HEIGHT = 600 
ball_width = 20

function love.load()
    love.window.setMode(800, 600)
    love.window.setTitle('Break Out')
    math.randomseed(os.time())
    ballSkin = love.graphics.newImage("/assets/ball.png")
    background = love.graphics.newImage("/assets/Background.jpg")
    love.graphics.setDefaultFilter('nearest', 'nearest')
    mediumFont = love.graphics.newFont("/assets/breakout.ttf", 20) 

    mainMenu = MainMenu()
    ball = Ball(VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, ball_width, ball_width)
    paddle = Paddle()  
    loadBricks()

    score = 0
    gameState = 'start' 
end

function love.update(dt) 
    if gameState == 'start' then
        mainMenu:update(dt)

    elseif gameState == 'serve' then 

        ball.dx = math.random(-50, 50)
        
    elseif gameState == 'play' then  
        ball:update(dt)
        paddle:update(dt)
        -- collution of ball and paddle
        if ball:collides(paddle) then
            ball.dy = -ball.dy * 1.0
            ball.y = paddle.y - ball_width

            if ball.dx < 0 then
                ball.dx = -math.random(10, 150)
            else
                ball.dx = math.random(10, 150)
            end 

        else 
            -- collution ball and bricks
            checkBallCollidesWithBricks()   
        end 

       ball:bounce()
			 
	end 
     
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    elseif key == 'enter' or key == 'return' then
        if gameState == 'serve' then
            gameState = 'play'
        elseif gameState == 'done' then
            gameState = 'serve'
            ball:reset()
            loadBricks()
            renderAllBricks()

        end
    end
    if key == 'delete' then 
        gameState = 'done'
    end
end

function love.draw() 
    love.graphics.clear(40/255, 45/255, 52/255, 255/255) 
    love.graphics.draw(background, 0, 0)
    love.graphics.setFont(mediumFont) 
    
    if gameState == 'start' then
        mainMenu:home() 
    elseif gameState == 'done' then
        Gameover:render(score)
    elseif gameState == 'serve' then
        mainMenu:render()
        loadMainGameView()
    else 
        loadMainGameView()
    end
    
end 

function loadMainGameView()
    love.graphics.printf('Score : ', 20, 20, VIRTUAL_WIDTH, 'left')
    love.graphics.printf(score, 100, 20, VIRTUAL_WIDTH, 'left')
    ball:render() 
    paddle:render() 
    renderAllBricks() 
end

function renderAllBricks()
    for k,v in pairs(listOfBricks) do 
            v:render() 
    end
end

function loadBricks()  
    
    allImage = getAllImage() -- get all image

    listOfBricks = {} -- create empty tabel for alot of brick
    bricksWidth = allImage[0]:getWidth()/4 + 10 
    bricksHeight = allImage[0]:getHeight()/4 +5
    start_x = bricksWidth -- starting x coordinate to draw brick
    start_y = 60          -- starting y coordinate to draw brick
 
    --  generate 60  bricks and load it to table before
    for i = 1, 60 do 
        listOfBricks[i] = Brick(allImage[math.random (0, 14)],start_x,start_y)
        start_x = start_x + bricksWidth

        if i%10 == 0 then 
            start_y = start_y + bricksHeight
            start_x = bricksWidth
        end  
    end

end

-- funtion to check collution between ball and brick
function checkBallCollidesWithBricks()
    for k,v in pairs(listOfBricks) do
        if ball:collidesWithBrick(v) and v.isShows then 
            ball.dy = -ball.dy 
            ball.dx = -math.random(10, 150)  
            
            -- hide the brick
            v.isShows = false

            incrementScore()
        end
    end
end

function incrementScore()
    score = score + 1
end 