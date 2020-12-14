Ball = Class{}

function Ball:init(x, y, width, height)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.dy = math.random(2) == 1 and math.random(-160, -200) or math.random(160, 200)
    self.dx = math.random(2) == 1 and -200 or 200
end

function Ball:collides(paddle)
    if self.x > paddle.x + paddle.width or paddle.x > self.x + self.width then 
        return false
    end
    if self.y > paddle.y + paddle.height or paddle.y > self.y + self.height then 
        return false
    end 
    
    return true
end

function Ball:collidesWithBrick(brick)
    if self.x > brick.x + brick.widthBricks or brick.x > self.x + self.width then 
        return false
    end
    if self.y > brick.y + brick.heightBricks or brick.y > self.y + self.height then 
        return false
    end 
    
    return true
end 

function Ball:reset()
    self.x = VIRTUAL_WIDTH / 2 - self.width/2
    self.y = VIRTUAL_HEIGHT / 2 - self.height/2
    self.dy = math.random(2) == 1 and -200 or 200
    self.dx = math.random(-100, 100)
end

function Ball:update(dt)
    self.x = self.x + 2*self.dx * dt
    self.y = self.y + 2*self.dy * dt 
end

function Ball:bounce()
    if ball.y <= 0 then
        ball.y = 0
        ball.dy = -ball.dy
    end

    if ball.y >= VIRTUAL_HEIGHT - ball_width then
        -- ball.y = VIRTUAL_HEIGHT - ball_width
        -- ball.dy = -ball.dy
        gameState = 'done'
    end

    if ball.x <= 0 then
        ball.x = 0
        ball.dx = -ball.dx
    end

    if ball.x >= VIRTUAL_WIDTH - ball_width then
        ball.x = VIRTUAL_WIDTH - ball_width
        ball.dx = -ball.dx
        
    end
end

-- Function to get Scale Dimansion of new Image
function getImageScaleForNewDimensions( image, newWidth, newHeight )
    local currentWidth, currentHeight = image:getDimensions()
    return ( newWidth / currentWidth ), ( newHeight / currentHeight )
end 

function Ball:render() 
    local scaleX, scaleY = getImageScaleForNewDimensions( ballSkin, self.width, self.height )
 
    love.graphics.draw( ballSkin,self.x, self.y, 0, scaleX, scaleY )
end