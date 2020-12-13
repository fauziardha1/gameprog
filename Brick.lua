Brick = Class{}

function Brick:init()

    self.gBricks = {
        [0]= love.graphics.newImage("assets/box0.png"),
        [1]= love.graphics.newImage("assets/box1.png"),
        [2]= love.graphics.newImage("assets/box2.png"),
        [3]= love.graphics.newImage("assets/box3.png"),
        [4]= love.graphics.newImage("assets/box4.png"),
        [5]= love.graphics.newImage("assets/box5.png"),
        [6]= love.graphics.newImage("assets/box6.png"),
        [7]= love.graphics.newImage("assets/box7.png"),
        [8]= love.graphics.newImage("assets/box8.png"),
        [9]= love.graphics.newImage("assets/box9.png"),
        [10]= love.graphics.newImage("assets/box10.png"),
        [11]= love.graphics.newImage("assets/box11.png"),
        [12]= love.graphics.newImage("assets/box12.png"),
        [13]= love.graphics.newImage("assets/box13.png"),
        [14]= love.graphics.newImage("assets/box14.png")
    }
    -- tinggi dan lebar brick dikecilin jadi setengah dan ditambah gap 5
    
    gapBricks = 5
<<<<<<< Updated upstream
    self.heightBricks = gBricks[0]:getHeight()/4 + gapBricks
    self.widthBricks = gBricks[0]:getWidth()/4 + gapBricks
=======
    self.heightBricks = self.gBricks[0]:getHeight()/4 + gapBricks
    self.widthBricks = self.gBricks[0]:getWidth()/4 + gapBricks
>>>>>>> Stashed changes
    skalaBricks = 0.25
    rotasiBricks = 0
    self.x = self.widthBricks
    self.y = 60
    
end 



function Brick:render()
    love.graphics.draw(
        self.gBricks[0],
        self.x,
        self.y,
        rotasiBricks,
        skalaBricks,
        skalaBricks
    )
end