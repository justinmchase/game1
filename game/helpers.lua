

function loadQuadInfo(img, size)
  w, h = img:getDimensions()

  quads = {}
  rows = h / size
  cols = w / size

  local i = 1
  for x = 1, cols, 1 do
    for y = 1, rows, 1 do
        quads[i] = love.graphics.newQuad((x - 1) * size, (y - 1) * size, size, size, w, h)
        i = i + 1
    end
  end

  return {
    size = size,
    rows = rows,
    cols = cols,
    quads = quads
  }
  
end

return {
  loadQuadInfo = loadQuadInfo
}
