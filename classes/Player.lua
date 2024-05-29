local love = require("love")
local jump = love.audio.newSource("assets/jump.mp3", "static")
local frog_sprite = {
    love.graphics.newImage('assets/frog.png'),
    love.graphics.newImage('assets/frogL.png'),
    love.graphics.newImage('assets/frogR.png'),
    love.graphics.newImage('assets/frogD.png')
}

function Player() 
    return {
    x = VIRTUAL_WIDTH / 2,
    y = VIRTUAL_HEIGHT - 32,
    w = 16,
    h = 16,
    sprite = 1,
    move_delay = 0,

    move = function(self)
        self.move_delay = self.move_delay - 1

        function love.keypressed(key)
            if     key == "w" or key == "up"    and self.move_delay < 0 then 
                self.sprite = 1 
                self.y = self.y - 16 
                self.move_delay = 12 
                jump:play() 
                state.score = state.score + 10
            elseif key == "s" or key == "down"  and self.move_delay < 0 then
                self.sprite = 4
                if self.y + self.h + 16 < VIRTUAL_HEIGHT then 
                    self.y = self.y + 16 
                    self.move_delay = 12 
                    jump:play() 
                end
            elseif key == "a" or key == "left"  and self.move_delay < 0 then
                if self.x - 16 > 0 then 
                    self.x = self.x - 16
                else
                    self.x = 0
                end
                self.sprite = 2 
                self.move_delay = 12 
                jump:play()
            elseif key == "d" or key == "right" and self.move_delay < 0 then
                if self.x + self.w + 16 < VIRTUAL_WIDTH then
                    self.x = self.x + 16
                else
                    self.x = VIRTUAL_WIDTH - 16
                end
                self.sprite = 3 
                self.move_delay = 12 
                jump:play()
            end
        end
    end,

    render = function(self)
        love.graphics.setColor(1,1,1)
        love.graphics.draw(frog_sprite[self.sprite], self.x, self.y)
    end
    }
end

return Player