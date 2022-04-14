AI = {}

function AI:load()
    self.width = 20
    self.height = 100
    self.x = love.graphics.getWidth() - self.width - 50
    self.y = love.graphics.getHeight() / 2 - self.height / 2
    self.yVelocity = 0
    self.speed = 500
    self.timer = 0
    self.rate = 0.1
end

function AI:update(dt)
    self:move(dt)
    self:checkBoundries()
    self.timer = self.timer + dt
    if self.timer > self.rate then
        self.timer = 0
        self:adquireTarget()
    end
end

function AI:move(dt)
    self.y = self.y + self.yVelocity * dt
end

function AI:adquireTarget()
    if Ball.y < self.y then
        self.yVelocity = -self.speed
    elseif Ball.y > self.y + self.height then
        self.yVelocity = self.speed
    else
        self.yVelocity = 0 
    end
end

function AI:checkBoundries()
    if self.y < 0 then
        self.y = 0
    elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
    end
end

function AI:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
