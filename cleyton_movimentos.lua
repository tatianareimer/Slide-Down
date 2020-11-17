local cleyton = {
x = 652,
y = 15,
H = 232,
W = 136,
collided = false,
walk = {} ,
right = 1 ,
left = 3,
sprite = right,
time_right = 0,
time_left = 0,
time_change = 0.1,
speed = 1500,
state = 0,
dirX = 1,
falling_speed = 800,
foot = 0
}
local Platform = require ("Platform")

function cleyton.load()


  love.graphics.setDefaultFilter( "nearest", "nearest", 0.234375 ) -- The image gets Prettier
  
    for x = 1, 2, 1 do
      cleyton.walk[x] = love.graphics.newImage("Assets//Image//D" .. x .. ".png") -- right
    end

    for x = 3, 4 ,1 do 
      cleyton.walk[x] = love.graphics.newImage("Assets//Image//E" .. x .. ".png") -- left
    end
    
end



function cleyton.update(dt)

  --set game over
  if cleyton.y < 0 - cleyton.H or cleyton.y > 2560 then
    gameover = true

  else
    gameover = false
  end

  local rightPressed = love.keyboard.isDown("right")
  local leftPressed = love.keyboard.isDown("left")

  cleyton.time_right = cleyton.time_right + dt
  cleyton.time_left = cleyton.time_left + dt

  --Move to the RIGHT--
  if not (rightPressed and leftPressed) then   
    if rightPressed then
      
     cleyton.dirX = 1
     cleyton.x = cleyton.x + (cleyton.speed * dt)
     
      if cleyton.time_right > cleyton.time_change then
       
        cleyton.right = cleyton.right + 1
       
        if cleyton.right > 2 then 
         
          cleyton.right = 1
     
        end
     
        cleyton.time_right = 0
        cleyton.sprite = cleyton.right
      end
    --Move to the LEFT--
    elseif leftPressed then 
      cleyton.dirX = -1
      cleyton.x = cleyton.x + (-cleyton.speed*dt)
     
      if cleyton.time_left > cleyton.time_change then
       
        cleyton.left = cleyton.left + 1
        
        if cleyton.left > 4 then 
         
          cleyton.left = 3
     
        end

        cleyton.time_left = 0
        cleyton.sprite = cleyton.left
      end
    end
  end

  if (not(rightPressed) and not(leftPressed)) or
        (rightPressed and leftPressed) then
    if cleyton.dirX == -1 then    
      cleyton.sprite = 3
    elseif cleyton.dirX == 1 then
       cleyton.sprite = 1
    end
  end

  if cleyton.x <= 0 then
    cleyton.x = 0 
  end

  if cleyton.x >= 1304 then
    cleyton.x = 1304
  end

cleyton.collided = false
  for i = 1, #Platform.platforms do
    if checkcollision(cleyton.x + 30, cleyton.y  + cleyton.H / 1.01, cleyton.W - 60, 
      cleyton.H - cleyton.H / 1.01, Platform.platforms[i].xPos, Platform.platforms[i].yPos, Platform.Width, Platform.Height) then
      cleyton.collided = true
    end
  end

    if cleyton.collided == true then
      cleyton.y = cleyton.y - (platform_speed * dt)
    else
      --cleyton.y = cleyton.y + (cleyton.speed * dt)
      cleyton.y = cleyton.y + (cleyton.falling_speed * dt)
      cleyton.falling_speed = cleyton.falling_speed + (2 * dt)
    end

end

function cleyton.draw()
  love.graphics.print(cleyton.sprite)
  love.graphics.draw(cleyton.walk[cleyton.sprite], cleyton.x, cleyton.y)

end 

return cleyton