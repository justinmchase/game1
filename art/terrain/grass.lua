local Sprite = require('art.sprite')
local img = love.graphics.newImage('art/terrain/grass.png')
local stride = 16
return {
  stride = stride,
  rows = 3,
  cols = 3,
  sprites = {
    Sprite.new(0, 0, stride, img),
    Sprite.new(0, 1, stride, img),
    Sprite.new(0, 2, stride, img),
    Sprite.new(1, 0, stride, img),
    Sprite.new(1, 1, stride, img),
    Sprite.new(1, 2, stride, img),
    Sprite.new(2, 0, stride, img),
    Sprite.new(2, 1, stride, img),
    Sprite.new(2, 2, stride, img)
  }
}
