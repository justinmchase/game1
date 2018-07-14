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
  map.generate(100, 100)
  
  viewport = {}
  viewport.x = 0
  viewport.y = 0
end

function love.update()

  if love.keyboard.isDown('d') then
    viewport.x = viewport.x + 2
  end

  if love.keyboard.isDown('a') then
    viewport.x = viewport.x - 2
  end

  if love.keyboard.isDown('w') then
    viewport.y = viewport.y - 2
  end

  if love.keyboard.isDown('s') then
    viewport.y = viewport.y + 2
  end

  viewport.radiusx = 400
  viewport.radiusy = 300

  map.update(viewport)
end

function love.draw()
  map.draw()
end

