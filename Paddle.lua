Paddle = Class{}

function Paddle:init()
    self.x = love.graphics.getWidth()/2
    self.y = WINDOW_HEIGHT -30
    self.width = 100
    self.height = 20
    self.speed = 500
end

function Paddle:update(dt)
   if love.keyboard.isDown("left") then
   	self.x = self.x - self.speed * dt
   elseif love.keyboard.isDown("right") then
   	self.x = self.x + self.speed * dt
   end
   if self.x < 0 then
   	self.x = 0
   elseif self.x + self.width > love.graphics.getWidth() then
   	self.x = love.graphics.getWidth() - self.width 
   end
end

function Paddle:render()
    rounded = 3
    love.graphics.setLineWidth(rounded )
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height,rounded,rounded)
end
 