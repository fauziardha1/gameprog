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

function getImageScaleForNewDimensions( image, newWidth, newHeight )
    local currentWidth, currentHeight = image:getDimensions()
    return ( newWidth / currentWidth ), ( newHeight / currentHeight )
end

 

function Ball:render() 
    local scaleX, scaleY = getImageScaleForNewDimensions( ballSkin, self.width, self.height )
 
    love.graphics.draw( ballSkin,self.x, self.y, 0, scaleX, scaleY )
end