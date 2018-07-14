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

function update(viewport)


  scale = 2
  spritebatch:clear()
  for l = 1, 4, 1 do
    for x = 1, w, 1 do
      for y = 1, h, 1 do
        if layers[l][x][y] ~= nil then
          posx = (x - 1) * quadInfo.size * scale
          posy = (y - 1) * quadInfo.size * scale

          tilesize = quadInfo.size * scale

          if (viewport.x - posx) * (viewport.x - posx) < ((viewport.radiusx + tilesize) * (viewport.radiusx + tilesize)) and (viewport.y - posy) * (viewport.y - posy) < ((viewport.radiusy + tilesize) * (viewport.radiusy + tilesize)) then

            quad = quadInfo.quads[layers[l][x][y]]
            spritebatch:add(quad, posx - viewport.x + viewport.radiusx, posy - viewport.y + viewport.radiusy, 0, scale, scale)

          end
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
  draw = draw
}
