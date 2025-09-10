local tArgs = { ... }

local size = tonumber(tArgs[1])

rednet.open("left")

local function goUp()
  local increase = 8

  for i = 1, increase do
    turtle.up()
  end
end

local function inspectBlock(x, y)
  local success, data = turtle.inspectDown()
  local block = success and data.name

  local msg = {
    x = x,
    y = y,
    block = block
  }

  if baseID then
    rednet.send(baseID, msg, "map")
  else
    rednet.broadcast(msg, "map")
  end

  goUp()
end

local function moveToGround(x, y)
  if turtle.detectDown() then
    inspectBlock(x, y)
  else
    turtle.down
    moveToGround(x, y)
  end
end

for y = 1, size do
  for x = 1, size do
    if x < size then
      moveToGround(x, y)
      turtle.forward()
    end
  end

  if y < size then
    if y % 2 == 1 then
      moveToGround(size, y)
      turtle.turnRight()
      turtle.forward()
      turtle.turnRight()
    else
      moveToGround(size, y)
      turtle.turnLeft()
      turtle.forward()
      turtle.turnLeft()
    end
  end
end

print("Scan Complete!")
