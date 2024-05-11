function Wood(x, y, w, h, speed, direction) -- direction -1 == left, 1 = right
    return {
        x = x,
        y = y,
        w = w,
        h = h,
        speed = speed,
        direction = direction,
        is_colliding = false,

        move = function(self)
            self.x = self.x + direction * speed
            if self.x < - 48 then self.x = 256 end -- 256 = VIRTUAL_WIDTH + 32
            if self.x >  256 then self.x = -32 end
        end,

        render = function(self)
            love.graphics.setColor(0.58,0.29,0)
            love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
        end,

        begin = function()
            woods = {Wood(VIRTUAL_WIDTH - 32,  48, 32, 16, 1,  2),
                     Wood(VIRTUAL_WIDTH - 96,  48, 48, 16, 1,  2),
                     Wood(VIRTUAL_WIDTH - 32,  96, 32, 16, 1, -1),
                     Wood(VIRTUAL_WIDTH - 96,  96, 48, 16, 1, -1),
                     Wood(VIRTUAL_WIDTH - 32,  64, 32, 16, 1,  1),
                     Wood(VIRTUAL_WIDTH - 126, 64, 48, 16, 1,  1)}
            return woods
        end
    }
end

return Wood