Gameover = Class{}

function Gameover:init()
    background = love.graphics.newImage("/assets/Background.jpg")
    love.graphics.setDefaultFilter('nearest', 'nearest')
    mediumFont = love.graphics.newFont("/assets/flappy.ttf", 20)
end

function Gameover:update()

end
 
function Gameover:render(score) 
    love.graphics.setFont(mediumFont)
    love.graphics.printf('Game Over', 0, 250, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('Your Score :', 0, 300, VIRTUAL_WIDTH, 'center')
    love.graphics.printf(score, 80, 300, VIRTUAL_WIDTH, 'center') 
end
 