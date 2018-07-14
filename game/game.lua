local game = {}

function foo()
  game.x = 10
end

return {
  foo = foo
}
