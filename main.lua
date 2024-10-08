local love        = require("love")
local push        = require("libs/push")
local Player      = require("classes/Player")
_G.state          = require("gamestate")
local utils       = require("utils")
local menu        = require("classes/menu")
local Intro       = require("classes/Intro")
local UI          = require("classes/UI")
local Car         = require("classes/Car")
local River       = require("classes/River")
local Wood        = require("classes/Wood")
local Turtle      = require("classes/Turtle")
local Finishline  = require("classes/Finishline")
local instanciate = require("instanciate")

local gameover = love.audio.newSource("assets/gameover.wav", "static")
local success  = love.audio.newSource("assets/success.mp3" , "static")
local levelup  = love.audio.newSource("assets/levelup.mp3", "static")

WINDOW_WIDTH   = 672 -- 224 * 3 (3x scaling)
WINDOW_HEIGHT  = 768 -- 256 * 3

VIRTUAL_WIDTH  = 224
VIRTUAL_HEIGHT = 256 -- multiples of 16 (16x16 tiles)

function love.load()
    intro = Intro()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable  = false,
        vsync      = true
    })

    player      = Player()
    cars        = instanciate:car()
    rivers      = instanciate:river()
    woods       = instanciate:wood()
    turtles     = instanciate:turtle()
    finishlines = instanciate:finishline()
end

function love.update(dt)
    if state.intro then intro:update(dt) end
    if state.menu then
        menu:click()
        if not state.muted then
            menu:play_song()
        else
            menu:stop_song()
        end
    end
    if state.play then
        menu:stop_song()
        player:move()

        for _, car in pairs(cars) do
            local colliding = utils.is_colliding(car.x + 2, car.y + 1, player.x, player.y, player.w, player.h) or utils.is_colliding(player.x + 2, player.y + 1, car.x, car.y, car.w, car.h)
            if colliding then player = Player() state.lifes = state.lifes - 1 gameover:play() end
            car:move()
        end
        for _, wood in pairs(woods) do
            wood.is_colliding = utils.is_colliding(player.x + 1, player.y + 1, wood.x, wood.y, wood.w, wood.h)
            if wood.is_colliding then player.x = player.x + wood.direction * wood.speed end
            wood:move()
        end
        for _, turtle in pairs(turtles) do
            turtle.is_colliding = utils.is_colliding(player.x + 1, player.y + 1, turtle.x, turtle.y, turtle.w, turtle.h)
            if turtle.is_colliding then player.x = player.x + turtle.direction * turtle.speed end
            turtle:move()
        end
        local wood_colliding = false
        for i = 1, #woods do
            if woods[i].is_colliding then wood_colliding = true break end
        end
        local turtle_colliding = false
        for i = 1, #turtles do 
            if turtles[i].is_colliding then turtle_colliding = true break end
        end
        for _, river in pairs(rivers) do
            local colliding = utils.is_colliding(player.x, player.y + 1, river.x, river.y, river.w, river.h)
            if colliding and not wood_colliding and not turtle_colliding then 
                player = Player() state.lifes = state.lifes - 1 gameover:play() 
            end
        end

        for _, finishline in pairs(finishlines) do
            local colliding = utils.is_colliding(player.x + player.w / 2, player.y + 1, finishline.x, finishline.y, finishline.w, finishline.h)
            if colliding and not finishline.finished then
                success:play() state.score = state.score + 100 
                player.x = VIRTUAL_WIDTH / 2 player.y = VIRTUAL_HEIGHT - 32
                finishline.finished = true state.finishes = state.finishes + 1
            end
        end

        if state.finishes == 5 then utils.levelup(finishlines) levelup:play() end
        if state.lifes < 0 then utils.die(finishlines) end
    end
    
    utils.check_quit()
end

function love.draw()
    if state.intro then intro:render() end
    push:apply('start')

    if state.menu then menu:render() end
    if state.play then
        for _, car        in pairs(cars)        do car:render()        end
        for _, river      in pairs(rivers)      do river:render()      end
        for _, wood       in pairs(woods)       do wood:render()       end
        for _, turtle     in pairs(turtles)     do turtle:render()     end
        for _, finishline in pairs(finishlines) do finishline:render() end
        UI:safezone()
        player:render()
        UI:render()
    end

    push:apply('end')
end