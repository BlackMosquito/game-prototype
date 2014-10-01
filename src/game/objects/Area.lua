local class = require('lib/middleclass/middleclass')
local Physical = require("src/game/objects/Physical")
local Area = class('game.objects.Area', Physical)

function Area:initialize(world, x, y, width, height, isCollidable)
    Physical.initialize(self, world, x, y, width, height)
    self.isCollidable = isCollidable
    local cx, cy = self:getCenter()
    self.body = love.physics.newBody(self.world, cx, cy)
    self.shape = love.physics.newRectangleShape(0, 0, self.width, self.height)
    self.fixture = love.physics.newFixture(self.body, self.shape, 1)
    Physical.registerPhysicalObject(self, self.body, self.shape, self.fixture)
     
    if self.isCollidable ~= nil or self.isCollidable then
      self.fixture:setSensor(true)
    end
end

function Area:getCenter()
  return self.x + (self.width / 2), self.y + (self.height / 2)
end

return Area
