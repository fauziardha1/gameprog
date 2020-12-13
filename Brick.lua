Brick = Class{}

function Brick:init(image,x,y)
    self.image = image
    self.x = x 
    self.y = y
    self.isShows = true
    self.heightBricks = image:getHeight()/4 + 5
    self.widthBricks    = image:getWidth()/4 + 5

    -- self.gBricks = {
    --     [0]= love.graphics.newImage("assets/box0.png"),
    --     [1]= love.graphics.newImage("assets/box1.png"),
    --     [2]= love.graphics.newImage("assets/box2.png"),
    --     [3]= love.graphics.newImage("assets/box3.png"),
    --     [4]= love.graphics.newImage("assets/box4.png"),
    --     [5]= love.graphics.newImage("assets/box5.png"),
    --     [6]= love.graphics.newImage("assets/box6.png"),
    --     [7]= love.graphics.newImage("assets/box7.png"),
    --     [8]= love.graphics.newImage("assets/box8.png"),
    --     [9]= love.graphics.newImage("assets/box9.png"),
    --     [10]= love.graphics.newImage("assets/box10.png"),
    --     [11]= love.graphics.newImage("assets/box11.png"),
    --     [12]= love.graphics.newImage("assets/box12.png"),
    --     [13]= love.graphics.newImage("assets/box13.png"),
    --     [14]= love.graphics.newImage("assets/box14.png")
    -- }
    -- -- tinggi dan lebar brick dikecilin jadi setengah dan ditambah gap 5
    
    -- gapBricks = 5
    -- self.heightBricks = self.gBricks[0]:getHeight()/4 + gapBricks
    -- self.widthBricks = self.gBricks[0]:getWidth()/4 + gapBricks
    -- skalaBricks = 0.25
    -- rotasiBricks = 0
    -- self.x = self.widthBricks
    -- self.y = 60
    -- self.isShows = true


    
end 

 

function Brick:render()

    if self.isShows then
        -- love.graphics.draw(
        --     self.gBricks[0],
        --     self.x,
        --     self.y,
        --     rotasiBricks,
        --     skalaBricks,
        --     skalaBricks
        -- )

        love.graphics.draw(
            self.image,
            self.x,
            self.y,
            0,
            0.25,
            0.25
        )
    end
    
end


function getAllImage()
    gBricks = {
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

    print("gbricks len : "..table.getn(gBricks))
    return gBricks
end

 