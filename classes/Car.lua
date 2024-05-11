local love = require("love")

function Car(x, y, w, h, speed, direction) -- direction -1 == left, 1 = right
    return {
        x = x,
        y = y,
        w = w,
        h = h,
        speed = speed,
        direction = direction,

        move = function(self)
            self.x = self.x + direction * speed
            if self.x < - 32 then self.x = 256 end -- 256 = VIRTUAL_WIDTH + 32
        end,

        render = function(self)
            love.graphics.setColor(0,1,0)
            love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
        end
    }
end

return Car