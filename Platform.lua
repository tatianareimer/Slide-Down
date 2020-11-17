local Platform = {
	Height = 90,
	Width = 300,
	platforms = {}
}


function Platform.load()
	platform_Draw = love.graphics.newImage("Assets//Image//Plataforma.png")
	create_platform(love.math.random(0, 1123))
	platform_speed = 400
end

function Platform.reload()
	Platform.platforms = {}
	create_platform(love.math.random(0, 1123))
	platform_speed = 400
end

function Platform.update(dt)
	if Platform.platforms[1].yPos < 1960 then
		create_platform(math.random(0, 1123))
	end

    for i = #Platform.platforms, 1, -1 do
		platform = Platform.platforms[i]
		platform.yPos = platform.yPos - platform_speed * dt
		platform_speed = platform_speed + (5 * dt)				
		if platform.yPos < -100 then
			table.remove(Platform.platforms, i)
		end

	end

end

function Platform.draw()
	for i = #Platform.platforms, 1, -1 do
		platform = Platform.platforms[i]
		love.graphics.draw(platform_Draw, platform.xPos, platform.yPos)
	end
end

function create_platform(x)
	platform = {xPos = x, yPos = 2560}
	table.insert(Platform.platforms, 1, platform)
end

return Platform