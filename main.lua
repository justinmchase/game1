require('reload')
map = require('game.map')

-- Always load images with nearest mode
love.graphics.setDefaultFilter('nearest', 'nearest')

width, height = love.graphics.getDimensions()
if width ~= 800 or height ~= 600 then
  love.window.setMode(800, 600)
end

function love.load()
  map.init()
  map.generate(1000, 1000)
  
  viewport = {}
  viewport.x = 0
  viewport.y = 0
  viewport.radiusx = 400
  viewport.radiusy = 300

  speed = 10
end

function love.update()
  scale = 2
  w, h, s = map.dimensions()

  if love.keyboard.isDown('d') then
    viewport.x = math.min(w * s * scale, viewport.x + speed)
  end

  if love.keyboard.isDown('a') then
    viewport.x = math.max(0, viewport.x - speed)
  end

  if love.keyboard.isDown('w') then
    viewport.y = math.max(0, viewport.y - speed)
  end

  if love.keyboard.isDown('s') then
    viewport.y = math.min(h * s * scale, viewport.y + speed)
  end

  map.update(viewport, scale)
end

function love.draw()
  map.draw()
end

