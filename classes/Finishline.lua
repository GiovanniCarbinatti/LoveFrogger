function Finishline(x, y, w, h)
    return {
        x = x,
        y = y,
        w = w,
        h = h,
        finished = false,

        render = function(self)
            love.graphics.setColor(0.5,0,0.5)
            if self.finished then love.graphics.setColor(0.9,0,0.9) end
            love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
        end
    }
end

return Finishline