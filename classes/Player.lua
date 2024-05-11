local love = require("love")
local jump = love.audio.newSource("assets/jump.mp3", "static")

function Player() 
    return {
    x = VIRTUAL_WIDTH / 2,
    y = VIRTUAL_HEIGHT - 32,
    w = 16,
    h = 16,

    move = function(self)
        function love.keypressed(key)
            if     key == "w" or key == "up"    then self.y = self.y - 16 jump:play() state.score = state.score + 10
            elseif key == "s" or key == "down"  then self.y = self.y + 16 jump:play()
            elseif key == "a" or key == "left"  then self.x = self.x - 16 jump:play()
            elseif key == "d" or key == "right" then self.x = self.x + 16 jump:play() end
        end
    end,

    render = function(self)
        love.graphics.setColor(1,1,1)
        love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
    end
    }
end

return Player