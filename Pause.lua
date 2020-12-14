Pause = Class{}

function Pause:render()
    pauseImage = love.graphics.newImage("assets/Break.png") 
    love.graphics.draw( pauseImage,150, 150, 0, 0.75, 0.75 )
end