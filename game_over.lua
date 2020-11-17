local game_over = {}
local game_over_background


function pause.load()
  
 game_over_background = love.graphics.newImage("Assets//Image//game_over_image.png") 
end


function game_over.update()
  
  
  end

function game_over.draw()
  
  love.graphics.draw(game_over_background)
  
  end

return menu