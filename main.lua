local Element = require 'element'

map = {}
pictures = {'grass.png', 'water.png'}
scale = 6 --change the size of the tiles
function love.load()

  -- Create the map
  for x = 1, 15 do
    map[x] = {}
    for y = 1, 15 do
      map[x][y] = Element:new(pictures[1])
      map[x][y].x = (map[x][y].img:getWidth() / (2*scale) * (x - 1)) - map[x][y].img:getWidth() / (2*scale) * (y-1)
      map[x][y].y = (map[x][y].img:getHeight() / (3.15*scale) * (x - 1)) + map[x][y].img:getHeight() / (3.15*scale) * (y-1)
      map[x][y].x = map[x][y].x + 300
    end
  end

-- Create the lake

--First, choose a random map tile to be the starting point
  local x = love.math.random(1, 7) + love.math.random(1, 7)
  local y = love.math.random(1, 7) + love.math.random(1, 7)

-- Then, loop through the map and apply the algorithm
for i = 1, 100 do
  -- choose a random tile next to our starting tile
  local dx = love.math.random(-1, 1)
  local dy = love.math.random(-1, 1)
  --if the chosen tile is on the map...
  if x + dx <= 15 and x + dx > 0 and y + dy <= 15 and y + dy > 0 then
    map[x][y].img = love.graphics.newImage('water.png') -- set the
    map[x+dx][y+dy].img = love.graphics.newImage('water.png')
    x = x + dx
    y = y + dy
  end
end





end


function love.update(dt)

end


function love.draw()
  for x = 1, 15 do
    for y = 1, 15 do
      love.graphics.draw(map[x][y].img, map[x][y].x, map[x][y].y, 0, 1/scale)
    end
  end
end


function love.keypressed(key)
  if key == 'escape' then
    love.event.quit()
  end
end
