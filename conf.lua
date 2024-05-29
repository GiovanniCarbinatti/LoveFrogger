local love = require("love")

function love.conf(t)
    t.window.title = "Moon Frogger"
    
    t.modules.joystick = false
    t.modules.physics = false
    t.modules.touch = false
end