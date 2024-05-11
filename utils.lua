local utils = {}

function utils.is_colliding(x1, y1, x2, y2, w, h)
    return x1 > x2 and x1 < (x2 + w) and y1 > y2 and y1 < (y2 + h)
end

function utils.check_quit()
    if love.keyboard.isDown("escape") then love.event.quit() end
end

return utils