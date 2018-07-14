require('reload')

Map = require('game.map')

function love.load()
  local art = require('art.work')
  local terrain = art.grass
  local scale = 2
  map = Map.new(
    terrain,
    scale)
end

function love.draw()
  map:draw()
end

