local pause = {}
local pause_background


function pause.load()
  
 pause_background = love.graphics.newImage("Assets//Image//menu_image.png") 
end


function pause.update()
  
  
  end

function pause.draw()
  
  love.graphics.draw(pause_background)
  
  end

return menu