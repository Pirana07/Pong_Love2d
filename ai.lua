AI = {}

function AI:load()
    self.width = 20
    self.height = 100
    self.x = love.graphics.getWidth() - self.width - 50
    self.y = love.graphics.getHeight() / 2
    self.speed = 400
    self.yVel = 0
end

function AI:update(dt)
    self:target()
    self:move(dt)
end

function AI:move(dt)
    self.y = self.y + self.yVel * dt
end

function AI:target()
    if Ball and Ball.y then
        if Ball.y + Ball.height < self.y then  
            self.yVel = -self.speed
        elseif Ball.y > self.y + self.height then
            self.yVel = self.speed
        else
            self.yVel = 0
        end
    end
end

function AI:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
