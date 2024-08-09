local retro_font = love.graphics.newFont('assets/font.ttf', 32)
local buttonsprites = {
    love.graphics.newImage("assets/vol_unmuted.png"),
    love.graphics.newImage("assets/vol_muted.png")
}

function Button(x, y, w, h, text, action, sprite)
    return {
        x = x,
        y = y,
        w = w,
        h = h,
        text = text,
        action = action,
        sprite = sprite or nil,

        render = function(self)
            if self.sprite then
                love.graphics.setColor(1,1,1)
                love.graphics.draw(buttonsprites[self.sprite], self.x, self.y)
            else
                love.graphics.setColor(1,1,1)
                love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
                love.graphics.setColor(0,0,0)
                love.graphics.setFont(retro_font)
                love.graphics.print(self.text, self.x + 4, self.y + self.h / 2 - 16)
            end
        end,

        onclick = function(self)
            action()
        end
    }
end

return Button