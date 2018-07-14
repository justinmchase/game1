local Sprite = {}
Sprite.__index = Sprite
function Sprite.new(col, row, stride, img)
  local sw = img:getWidth()
  local sh = img:getHeight()
  local x = col * stride
  local y = row * stride
  local q = love.graphics.newQuad(x, y, stride, stride, sw, sh)
  local sprite = {
    x = x,
    y = y,
    col = col,
    row = row,
    stride = stride,
    img = img,
    quad = q
  }
  return setmetatable(sprite, Sprite)
end

function Sprite:draw(x, y, scale)
  local offsetX = x * self.stride * scale
  local offsetY = y * self.stride * scale
  love.graphics.draw(self.img, self.quad, offsetX, offsetY, 0, scale, scale)
end
return Sprite
