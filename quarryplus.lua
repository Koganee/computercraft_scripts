local tArgs = { ... }

local width = tonumber(tArgs[1])
local length = tonumber(tArgs[2])
local depth = tonumber(tArgs[3])

function mineSTraightAndMove()
  for w = 1, width do
    for l = 1, length do
      turtle.dig()
      turtle.forward()
    end

    if (w % 2 == 0) and (w ~= width + 1) then
      turtle.turnLeft()
      turtle.dig()
      turtle.forward()
      turtle.turnLeft()
    elseif (w ~= width + 1) then
      turtle.turnRight()
      turtle.dig()
      turtle.forward()
      turtle.turnRight()
    end
  end

  for x = 1, width do
    turtle.dig()
    turtle.forward()
  end

  turtle.turnLeft()
  turtle.turnLeft()
  for i = 1, width do
    turtle.forward()
  end

  turtle.turnLeft()

  for j = 1, length do
    turtle.forward()
  end

  turtle.digDown()
  turtle.down()
  turtle.turnRight()
  turtle.turnRight()
end

for d = 1, depth do
  mineStraightAndMove()
end

print("Quarry Complete!")
