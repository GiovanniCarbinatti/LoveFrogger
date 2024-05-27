local woodsprites = {
    love.graphics.newImage("assets/wood1.png"),
    love.graphics.newImage("assets/wood2.png"),
    love.graphics.newImage("assets/wood3.png")
}

function Wood(x, y, w, h, tiles, speed, direction) -- direction -1 == left, 1 = right
    return {
        x = x,
        y = y,
        w = w,
        h = h,
        tiles = tiles,
        speed = speed,
        direction = direction,
        is_colliding = false,

        move = function(self)
            self.x = self.x + direction * speed
            if self.x <  -48 then self.x = 272 end -- 256 = VIRTUAL_WIDTH + 48
            if self.x >  272 then self.x = -48 end
        end,

        render = function(self)
            love.graphics.setColor(1,1,1)
            love.graphics.draw(woodsprites[1], self.x, self.y)
            if self.tiles > 2 then 
                for i = 1, self.tiles - 2 do 
                    love.graphics.draw(woodsprites[2], self.x + 16 * i, self.y)
                end
            end
            love.graphics.draw(woodsprites[3], self.x + self.w - 16, self.y)
        end
    }
end

return Wood