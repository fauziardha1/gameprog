Brick = Class{}

function Brick:init()

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
    -- tinggi dan lebar brick dikecilin jadi setengah dan ditambah gap 5
    
    gapBricks = 5
    heightBricks = gBricks[0]:getHeight()/4 + gapBricks
    widthBricks = gBricks[0]:getWidth()/4 + gapBricks
    skalaBricks = 0.25
    rotasiBricks = 0
    posisiAwal_x = widthBricks
    posisiAwal_y = 60
    brickList ={}
    
end 
function bricksGanjil(col,posisi_y)

     love.graphics.draw(
            gBricks[col],
            posisiAwal_x+(col-1)*2*widthBricks,
            posisi_y,
            rotasiBricks,
            skalaBricks,--skala x
            skalaBricks --skala y
        )
        if col<7 then
            love.graphics.draw(
                gBricks[0],
                posisiAwal_x + (2*col-1)*widthBricks,
                posisi_y,
                rotasiBricks,
                skalaBricks,--skala x
                skalaBricks --skala y
            )
        end

         
end

function bricksGenap(col,posisi_y)
    love.graphics.draw(
            gBricks[0],
            posisiAwal_x+(col-1)*2*widthBricks,
            posisi_y,
            rotasiBricks,
            skalaBricks,--skala x
            skalaBricks --skala y
        )
        if col<7 then
            love.graphics.draw(
                gBricks[14-col],
                posisiAwal_x + (2*col-1)*widthBricks,
                posisi_y,
                rotasiBricks,
                skalaBricks,--skala x
                skalaBricks --skala y
            )
        end
end


function Brick:render()
    for i=1,6 do
        for col=1,5 do
            if i%2==0 then
                bricksGenap(col,posisiAwal_y+ (i-1)*heightBricks)
            else
                bricksGanjil(col,posisiAwal_y+ (i-1)*heightBricks)
            end
        end
    end
end