helpers = require('game.helpers')

function init()
  images = {
    love.graphics.newImage('art/terrain/grass.png')
  }
  quadInfo = helpers.loadQuadInfo(images[1], 16)
  spritebatch = love.graphics.newSpriteBatch(images[1])
end

function generate(width, height)
  w = width
  h = height
  layers = {}
  for l = 1, 4, 1 do
    layers[l] = {}
    for x = 1, w, 1 do
      layers[l][x] = {}
      for y = 1, h, 1 do
        if l == 1 then
          layers[l][x][y] = love.math.random(1, 9)
        else
          layers[l][x][y] = nil
        end
      end
    end
  end
end

function dimensions()
  return w, h, quadInfo.size
end

function update(viewport, scale)
  spritebatch:clear()
  tileSize = quadInfo.size * scale
  tx = math.max(1, math.floor(math.max(0, viewport.x - viewport.radiusx) / tileSize))
  ty = math.max(1, math.floor(math.max(0, viewport.y - viewport.radiusy) / tileSize))
  tw = math.min(w, math.ceil((viewport.x + viewport.radiusx) / tileSize))
  th = math.min(h, math.ceil((viewport.y + viewport.radiusy) / tileSize))
  for l = 1, 4, 1 do
    for x = tx, tw, 1 do
      for y = ty, th, 1 do
        if layers[l][x][y] ~= nil then
          posx = (x - 1) * tilesize
          posy = (y - 1) * tilesize
          quad = quadInfo.quads[layers[l][x][y]]
          spritebatch:add(quad, posx - viewport.x + viewport.radiusx, posy - viewport.y + viewport.radiusy, 0, scale, scale)
        end
      end
    end
  end
end

function draw()
  love.graphics.draw(spritebatch)
end

return {
  init = init,
  generate = generate,
  update = update,
  draw = draw,
  dimensions = dimensions
}
