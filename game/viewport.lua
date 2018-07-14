
local posx
local posy
local radiusx
local radiusy

function getViewport()
  return posx, posy, radiusx, radiusy
end

function setViewport(x, y, rx, ry)
  posx = x
  posy = y
  radiusx = rx
  radiusy = ry
end

return {
  getViewport = getViewport
  setViewPort = setViewport
}
