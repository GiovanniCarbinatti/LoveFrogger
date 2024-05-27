local retro_font = love.graphics.newFont('assets/font.ttf', 16)
local safesprite = love.graphics.newImage('assets/safezone.png')

local UI = {}

function UI.render()
    love.graphics.setColor(1,0,0)
    love.graphics.rectangle("fill", 0, 0, VIRTUAL_WIDTH, 16)
    love.graphics.rectangle("fill", 0, VIRTUAL_HEIGHT-16, VIRTUAL_WIDTH, 16)

    love.graphics.setFont(retro_font)
    love.graphics.setColor(0,0,0)
    love.graphics.print("SCORE", 2, -4)
    love.graphics.print(state.score, 2, 3)

    love.graphics.setColor(0,0,1)
    for i = 1, state.lifes do
        love.graphics.rectangle("fill", (i - 1) * 8 + 4, VIRTUAL_HEIGHT - 10, 4, 4)
    end
end

function UI.safezone()
    love.graphics.setColor(1,1,1)
    for i = 0, VIRTUAL_WIDTH, 16 do
        love.graphics.draw(safesprite, i, 128)
        love.graphics.draw(safesprite, i, 224)
    end
end

return UI