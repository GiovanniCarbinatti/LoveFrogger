function River(x, y, w, h)
    return {
        x = x,
        y = y,
        w = w,
        h = h,

        render = function(self)
            love.graphics.setColor(0,0,1)
            love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
        end
    }
end

return River