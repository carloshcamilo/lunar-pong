Ball = {}

function Ball:load()
    self.height = 20
    self.width = 20
    self.x = love.graphics.getWidth() / 2 - self.width / 2
    self.y = love.graphics.getHeight() / 2 - self.height / 2
    self.speed = 900
    self.xVelocity = -self.speed
    self.yVelocity = 0
end

function Ball:update(dt)
    self:move(dt)
    self:collide()
end

function Ball:collide()
    if checkCollison(self, Player) then
        self.xVelocity = self.speed
        local middleBall = self.y + self.height / 2
        local middlePlayer = Player.y + Player.height / 2
        local collisionPosition = middleBall - middlePlayer
        self.yVelocity = collisionPosition * 5
    end

    if checkCollison(self, AI) then
        self.xVelocity = -self.speed
        local middleBall = self.y + self.height / 2
        local middleAI = AI.y + AI.height / 2
        local collisionPosition = middleBall - middleAI
        self.yVelocity = collisionPosition * 5
    end

    if self.y < 0 then
        self.y = 0
        self.yVelocity = -1 * self.yVelocity
    elseif self.y > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
        self.yVelocity = -1 * self.yVelocity
    end

    if self.x < 0 then
        self.x = love.graphics.getWidth() / 2 - self.width / 2
        self.y = love.graphics.getHeight() / 2 - self.height / 2
        self.xVelocity = -self.speed
        self.yVelocity = 0
    end

    if self.x + self.width > love.graphics.getWidth() then
        self.x = love.graphics.getWidth() / 2 - self.width / 2
        self.y = love.graphics.getHeight() / 2 - self.height / 2
        self.xVelocity = self.speed
        self.yVelocity = 0
    end
end

function Ball:move(dt)
    self.x = self.x + self.xVelocity * dt
    self.y = self.y + self.yVelocity * dt
end

function Ball:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
