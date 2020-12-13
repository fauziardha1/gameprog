Gameover = Class{}

function Gameover:init()
    background = love.graphics.newImage("/assets/Background.jpg")
    love.graphics.setDefaultFilter('nearest', 'nearest')
    mediumFont = love.graphics.newFont("/assets/flappy.ttf", 20)
end

function Mainmenu:update()

 end
 
function Gameover:render()

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Game Over', 0, 250, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('Your Score :', 0, 300, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('0', 80, 300, VIRTUAL_WIDTH, 'center')
    

end
 