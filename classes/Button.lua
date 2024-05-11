local retro_font = love.graphics.newFont('assets/font.ttf', 32)
function Button(x, y, w, h, text, action)
    return {
        x = x,
        y = y,
        w = w,
        h = h,
        text = text,
        action = action,

        render = function(self)
            love.graphics.setColor(1,1,1)
            love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
            love.graphics.setColor(0,0,0)
            love.graphics.setFont(retro_font)
            love.graphics.print(self.text, self.x + 4, self.y + self.h / 2 - 16)
        end,

        onclick = function(self)
            action()
        end
    }
end

return Button