local Map = {}
Map.__index = Map

function Map.new(terrain, scale)
  
  local stride = terrain.stride
  local size = stride * scale
  local sw = love.graphics.getPixelWidth()
  local sh = love.graphics.getPixelHeight()
  local w = math.ceil(sw / size)
  local h = math.ceil(sh / size)
  

  local tiles = {}
  for x=0, w, 1 do
    for y=0, h, 1 do
      tiles[y * terrain.cols + x] = math.random(terrain.rows * terrain.cols) -- 1-9
    end
  end

  local map = {
    terrain = terrain,
    scale = scale,
    stride = stride,
    size = size,
    w = w,
    h = h,
    tiles = tiles
  }
  return setmetatable(map, Map)
end

function Map:draw(terrain)
  for x=0, self.w, 1 do
    for y=0, self.h, 1 do
      i = y * self.terrain.cols + x
      tile = self.tiles[i]
      sprite = self.terrain.sprites[tile]
      sprite:draw(x, y, self.scale)
    end
  end
end

return Map
