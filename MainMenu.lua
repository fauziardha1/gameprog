MainMenu = Class{}

function MainMenu:init()
    self.cursor_x1 = 265
    self.cursor_x2 = 450
    self.cursor_now = self.cursor_x1
end

function MainMenu:home()
    background = love.graphics.newImage("/assets/Background.jpg")
    love.graphics.setDefaultFilter('nearest', 'nearest')
    semiLargeFont = love.graphics.newFont("/assets/breakout.ttf", 30)
    homeLogo = love.graphics.newImage("assets/logo.png")
    love.graphics.draw( homeLogo,100, 100, 0, 0.75, 0.75)

    love.graphics.setFont(semiLargeFont)
    love.graphics.printf('Start', 250, 375, VIRTUAL_WIDTH, 'left')
    love.graphics.printf('Exit', 450, 375, VIRTUAL_WIDTH, 'left')
    love.graphics.rectangle('fill',self.cursor_now,400,50,5)

end

function MainMenu:update()
    if love.keyboard.isDown("left") then
       self.cursor_now = self.cursor_x1
    elseif love.keyboard.isDown("right") then
        self.cursor_now = self.cursor_x2
    end
    if love.keyboard.isDown("kpenter") or love.keyboard.isDown("return") then
       if self.cursor_now == self.cursor_x1 then 
            print("Enter : Cursor now = "..self.cursor_now)
            gameState = 'serve'
       else
            print("Quit now!")
            love.event.quit()
       end
    end 
end

function MainMenu:render()
    love.graphics.printf('Press Enter', 0, 250, VIRTUAL_WIDTH, 'center')
end
 