Ball = {}

function Ball:load()
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight() / 2
    self.width = 25
    self.height = 25
    self.speed = 200
    self.xVel = -self.speed
    self.yVel= 0 

end

function Ball:update(dt)
    self:move(dt)
    self:collide()
end


function Ball:collide()
    if CheckCollision(Ball, Player) then 
        self.xVel = self.speed
        local middleball = self.y + self.height/ 2
        local middleplayer =  Player.y + Player.height / 2
        local collisionPos = middleball - middleplayer
        self.yVel = collisionPos * 5
    end
     if CheckCollision(Ball, AI) then 
        self.xVel = -self.speed
        local middleball = self.y + self.height/ 2
        local middleplayer =  Player.y + Player.height / 2
        local collisionPos = middleball - middleplayer
        self.yVel = collisionPos * 5
    
    end

    if self.y < 0 then
        self.y = 0
        self.yVel = -self.yVel
    elseif self.y +  self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() -self.height
        self.yVel = -self.yVel
    end
end



function Ball:move(dt)
    self.x = self.x + self.xVel * dt
    self.y = self.y + self.yVel * dt
end


function Ball:draw()
    love.graphics.rectangle("fill",  self.x, self.y, self.width, self.height)
end

