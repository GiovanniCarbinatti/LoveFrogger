local love = require("love")
local carsprites = {
    love.graphics.newImage("assets/car1.png"),
    love.graphics.newImage("assets/car2.png"),
    love.graphics.newImage("assets/car3.png")
}

function Car(x, y, w, h, speed, direction, spr) -- direction -1 == left, 1 = right
    return {
        x = x,
        y = y,
        w = w,
        h = h,
        speed = speed,
        direction = direction,
        spr = spr,

        move = function(self)
            self.x = self.x + direction * speed
            if self.direction == -1 and self.x < - 32 then self.x = 256 end -- 256 = VIRTUAL_WIDTH + 32
            if self.direction ==  1 and self.x > VIRTUAL_WIDTH + 16 then self.x = -48 end
        end,

        render = function(self)
            love.graphics.draw(carsprites[self.spr], self.x, self.y)
        end
    }
end

return Car