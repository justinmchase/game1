local Tile = {}
Tile.__index = Tile

function Tile.new()
  local tile = {
  }
  return setmetatable(tile, Tile)
end

return Tile
