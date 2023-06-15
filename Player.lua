Player = Class()

function Player:init(x, y)
    self.x = x
	self.y = y

    self.width = 40
    self.height = 40
end

function Player:collides(objects)
    if self.x > objects.x + objects.width or objects.x > self.x + self.width then
        return false
    end

    if self.x > objects.y + objects.height or objects.y > self.y + self.height then
        return false
    end

    return true
end

function Player:render()
    love.graphics.rectangle('fill', self.x, self.y, self.height, self.width)
end