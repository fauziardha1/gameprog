Mainmenu = Class{}

function Mainmenu:draw()
    background = love.graphics.newImage("/assets/Background.jpg")
    love.graphics.setDefaultFilter('nearest', 'nearest')
    mediumFont = love.graphics.newFont("/assets/flappy.ttf", 20)
end

function Mainmenu:update()

end

function Mainmenu:render()
    love.graphics.printf('Press Enter', 0, 250, VIRTUAL_WIDTH, 'center')
end
 