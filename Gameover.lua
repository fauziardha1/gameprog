Gameover = Class{}

function Gameover:init()
    background = love.graphics.newImage("/assets/Background.jpg")
    love.graphics.setDefaultFilter('nearest', 'nearest')
    gameOverFont = love.graphics.newFont("/assets/space.ttf", 20)
end
 
 
function Gameover:render(score,isWin) 
    gameOverFont = love.graphics.newFont("/assets/space.ttf", 20)
    love.graphics.setFont(gameOverFont)
    
    love.graphics.printf('Your Score : \n'..score, 0, 300, VIRTUAL_WIDTH, 'center') 

    love.graphics.printf('Press enter to play again!', 0, 350, VIRTUAL_WIDTH, 'center')
    sounds['music']:stop()
   
    if isWin then
        sounds['menang1']:play()
        sounds['menang2']:play()
        love.graphics.printf('You Win!!', 0, 250, VIRTUAL_WIDTH, 'center')
    else
        sounds['gameover']:play()
        love.graphics.printf('Game Over', 0, 250, VIRTUAL_WIDTH, 'center')
    end

end
 