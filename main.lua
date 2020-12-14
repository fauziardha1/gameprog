Class = require 'class' 
require 'Ball'
require 'Paddle'
require 'Brick'
require 'MainMenu'
require 'Gameover'
require 'Pause'

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
    mediumFont = love.graphics.newFont("/assets/assistant.ttf", 20)  
    sounds = {
        ['home'] = love.audio.newSource('/sounds/home.mp3', 'static'),
        ['cursor'] = love.audio.newSource('/sounds/cursor3.wav', 'static'),
        ['start'] = love.audio.newSource('/sounds/start.mp3', 'static'),
        ['break_hit'] = love.audio.newSource('/sounds/break_hit.mp3', 'static'),
        ['music'] = love.audio.newSource('/sounds/music.mp3', 'static'),
        ['mantul'] = love.audio.newSource('/sounds/mantul.mp3', 'static'),
        ['gameover'] = love.audio.newSource('/sounds/gameover.wav', 'static'),
        ['menang1'] = love.audio.newSource('/sounds/menang1.wav', 'static'),
        ['menang2'] = love.audio.newSource('/sounds/menang2.wav', 'static'),
    }
    sounds['home']:setLooping(true)
    sounds['home']:play()

    mainMenu = MainMenu()
    ball = Ball(VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, ball_width, ball_width)
    paddle = Paddle()  
    loadBricks()

    isPause = false
    time = 120
    isWin = false
    score = 0
    gameState = 'start' 
end

function love.update(dt) 
      

    if gameState == 'start' then
        mainMenu:update(dt)

    elseif gameState == 'serve' then 

        ball.dx = math.random(-50, 50)
        
    elseif gameState == 'play' and not(isPause) then  
        time = time - 1*dt
        sounds['music']:play()
        ball:update(dt)
        paddle:update(dt) 
        
        if ball:collides(paddle) then
            ball.dy = -ball.dy * 1.0
            ball.y = paddle.y - ball_width

            if ball.dx < 0 then
                ball.dx = -math.random(10, 150)
            else
                ball.dx = math.random(10, 150)
            end 
            sounds['mantul']:play()
        elseif time <=0 then
            gameState = 'done'
        else 
            -- collution ball and bricks
            checkBallCollidesWithBricks()
             
        end 
        
       ball:bounce()
        
    elseif isPause then
        sounds['music']:stop()
    end
      
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    elseif key == 'enter' or key == 'return' then
        if gameState == 'serve' then
            gameState = 'play'
            sounds['start']:play()
        elseif gameState == 'done' then
            gameState = 'serve'
            isPause = false
            score = 0
            ball:reset()
            loadBricks()
            renderAllBricks() 
        end
    end
    if key == 'space' then
        isPause = not(isPause)
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
        isWin = checkIsWin()
        
        if isWin then 
            sounds['menang1']:play()
            sounds['menang2']:play()
        else
            sounds['gameover']:play() 
        end
        
        Gameover:render(score,isWin)
        sounds['music']:stop()
    elseif gameState == 'serve' then
        mainMenu:render()
        loadMainGameView()
         
            sounds['music']:setLooping(true)
            sounds['music']:play()
        
    else 
        loadMainGameView()
    end
    
end 

function loadMainGameView()
    love.graphics.printf('Score : ', -80, 20, VIRTUAL_WIDTH, 'right')
    love.graphics.printf(score, -50, 20, VIRTUAL_WIDTH, 'right')
    love.graphics.printf('Time : ', 20, 20, VIRTUAL_WIDTH, 'left')
    love.graphics.printf(math.floor(time), 80, 20, VIRTUAL_WIDTH, 'left')
    ball:render() 
    paddle:render() 
    renderAllBricks() 
    if isPause then
        Pause:render()
    end
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
            sounds['break_hit']:play() 
            incrementScore()
        end
    end
end

function incrementScore()
    score = score + 1
end

function checkIsWin()
    for k,v in pairs(listOfBricks) do
        if  v.isShows then 
             return false
        end
    end
    return true
end