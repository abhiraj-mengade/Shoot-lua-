function love.load()
    target ={}
    target.x = 50
    target.y = 50
    target.radius=50

    score = 0
    timer = 10
    globalfont = love.graphics.newFont(30)

    sprites = {}
    sprites.bg = love.graphics.newImage("sprites/bg.png")
    sprites.ufo = love.graphics.newImage("sprites/ufo.png")
    sprites.crosshair = love.graphics.newImage("sprites/crosshair.png")
    
    love.mouse.setVisible(false)
end 

function love.update(dt)
    if timer > 0 then
        timer = timer - dt
    else 
        timer = 0   
    end

end

function love.draw()
    -- love.graphics.setColor(255,255,255)
    love.graphics.draw(sprites.bg,0,0,0,love.graphics.getWidth()/1728,love.graphics.getHeight()/1080)
    -- love.graphics.circle("fill",target.x,target.y,target.radius)
    love.graphics.draw(sprites.ufo,target.x,target.y,0,0.23*love.graphics.getWidth()/761,0.23*love.graphics.getHeight()/311)
    love.graphics.draw(sprites.crosshair,love.mouse.getX(),love.mouse.getY(),0,0.18*love.graphics.getWidth()/825,0.18*love.graphics.getHeight()/825)
    love.graphics.setFont(globalfont)
    love.graphics.print(score, 20, 20)
    love.graphics.print(timer, love.graphics.getWidth()-50, 20)
end

function love.mousepressed(x, y, button, istouch)
    if button == 1 then
        if distancebetween(x,y,target.x,target.y)<target.radius then
            score = score + 1
            target.x = math.random(0,love.graphics.getWidth())
            target.y = math.random(0,love.graphics.getHeight())
        end
    end
end

function distancebetween(x1,y1,x2,y2)
    return math.sqrt((x2-x1)^2 + (y2-y1)^2)
end
