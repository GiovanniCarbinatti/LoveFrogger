function Turtle(x, y, w, h, speed, direction) -- direction -1 == left, 1 = right
    return {
        x = x,
        y = y,
        w = w,
        h = h,
        speed = speed,
        direction = direction,
        is_colliding = false,
        tangible_timer = math.random(360, 480),

        move = function(self)
            self.tangible_timer = self.tangible_timer - 1
            if self.tangible_timer < -240 then self.tangible_timer = math.random(360, 480) end
            self.x = self.x + direction * speed
            if self.x < - 48 then self.x = 272 end -- 256 = VIRTUAL_WIDTH + 48
            if self.x >  272 then self.x = -48 end
        end,

        render = function(self)
            if self.tangible_timer > 0 then
                love.graphics.setColor(1,1,0)
            else
                love.graphics.setColor(0,0.5,0.5)
            end
            love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
        end
    }
end

return Turtle