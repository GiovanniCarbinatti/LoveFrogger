local love = require("love")
local Button = require("classes/Button")
local utils = require("utils")
local song = love.audio.newSource("assets/menu_song.mp3", "stream")

local menu = {}

menu.buttons = {
    -- 224 = VIRTUAL_WIDTH, 256 = VIRTUAL_HEIGHT
    play = Button(224 / 2 - 24, 256 / 2 - 16, 48, 32, "PLAY", function() state.menu = false state.play = true end)
}

function menu.render()
    for _, button in pairs(menu.buttons) do
        button:render()
    end
end

function menu.click()
    function love.mousepressed(x, y, button, istouch)
        if button == 1 then
            for _, b in pairs(menu.buttons) do
                if utils.is_colliding(x / 3, y / 3, b.x, b.y, b.w, b.h) then
                    b:onclick()
                end
            end
        end
    end
end

function menu.play_song()
    if not song:isPlaying() then love.audio.play(song) end
end

function menu.stop_song()
    if song:isPlaying() then love.audio.stop(song) end
end

return menu