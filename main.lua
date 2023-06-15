Class = require 'class'
require 'Player'

WINDOW_WIDTH = 1288
WINDOW_HEIGHT = 728

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

gameState = "title"

function love.load()

	medium_font = love.graphics.newFont('8bit_font.ttf', 18)

    love.graphics.setFont(medium_font)

	Player1 = Player(20, 100)
	Player2 = Player(20, 40)

	love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
		fullscreen = false, 
		resizable = true
	})
end
  
function love.keypressed(key)
	if gameState == "title" then
		if key == 'return' then
			gameState = "play"
		end
    end
end

function love.update(dt)
	if gameState == "play" then
		if love.keyboard.isDown("d") then
			Player1.x = math.min(Player1.x + 10, WINDOW_WIDTH + Player1.height)
		elseif love.keyboard.isDown("a") then
			Player1.x = math.max(Player1.x - 10, 0)
		end
	
		if love.keyboard.isDown("w") then
			Player1.y = math.max(Player1.y - 10, 0)
        elseif love.keyboard.isDown("s") then
			Player1.y = math.min(Player1.y + 10, WINDOW_HEIGHT - Player1.height)
		end



		if love.keyboard.isDown("right") then
			Player2.x = math.min(Player2.x + 10, WINDOW_WIDTH + Player2.height)
     	elseif love.keyboard.isDown("left") then
			Player2.x = math.max(Player2.x - 10, 0)
		end
	
		if love.keyboard.isDown("up") then
			Player2.y = math.max(Player2.y - 10, 0)
		elseif love.keyboard.isDown("down") then
			Player2.y = math.min(Player2.y + 10, WINDOW_HEIGHT - Player2.height)
		end
	end
end
  
function love.draw()
	Player1:render()
	Player2:render()
	
	if gameState == "title" then
		love.graphics.printf(
			'welcome to my game',
			500,
			264,
			VIRTUAL_WIDTH)
	end

	love.graphics.setColor(1, 1, 1, 1)
end

