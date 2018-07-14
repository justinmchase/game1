-- Get globally loaded packages, these don't reload.
local loaded = {}
for lib in pairs(package.loaded) do
  if lib ~= 'main' then
    loaded[lib] = true
  end
end

function reload()
  print('reloading...')
  for lib in pairs(package.loaded) do
    if not loaded[lib] then
      print('unloading: ' .. lib)
      package.loaded[lib] = nil
    end
  end

  love.filesystem.load('main.lua')()
  if love.load ~= nil then
    love.load()
  end
end

-- Install refresh handlers
local _keypressed = love.keypressed
function love.keypressed(k, ...)
  if k == 'r' and love.keyboard.isDown('lctrl') then
    reload()
  elseif _keypressed ~= nil then
    _keypressed(k, ...)
  end
end
