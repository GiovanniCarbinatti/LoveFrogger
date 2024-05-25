local Car = require("classes/Car")
local River = require("classes/River")
local Wood = require("classes/Wood")
local Turtle = require("classes/Turtle")
local Finishline = require("classes/Finishline")

instanciate = {}

function instanciate.car()
    cars = {Car(VIRTUAL_WIDTH - 32, VIRTUAL_HEIGHT - 64, 16, 16, 1, -1, 1),
            Car(VIRTUAL_WIDTH + 16, VIRTUAL_HEIGHT - 64, 16, 16, 1, -1, 1),
            Car(VIRTUAL_WIDTH - 32, VIRTUAL_HEIGHT - 112, 32, 16, 1, -1, 2),
            Car(VIRTUAL_WIDTH + 16, VIRTUAL_HEIGHT - 112, 32, 16, 1, -1, 2)}

    return cars
end

function instanciate.river()
    rivers = {River(0, 48, VIRTUAL_WIDTH, 80)}

    return rivers
end

function instanciate.wood()
    woods = {Wood(VIRTUAL_WIDTH - 32,  48, 32, 16, 1,  2),
             Wood(VIRTUAL_WIDTH - 96,  48, 48, 16, 1,  2),
             Wood(VIRTUAL_WIDTH - 32,  96, 32, 16, 1, -1),
             Wood(VIRTUAL_WIDTH - 96,  96, 48, 16, 1, -1),
             Wood(VIRTUAL_WIDTH - 32,  64, 32, 16, 1,  1),
             Wood(VIRTUAL_WIDTH - 126, 64, 48, 16, 1,  1)}

    return woods
end

function instanciate.turtle()
    turtles = {Turtle(VIRTUAL_WIDTH - 32,  112, 48, 16, 1, 1),
               Turtle(VIRTUAL_WIDTH - 32,  80, 48, 16, 1, -1)}

    return turtles
end

function instanciate.finishline()
    finishlines = {Finishline(24,  32, 16, 16),
                   Finishline(64,  32, 16, 16),
                   Finishline(104,  32, 16, 16),
                   Finishline(144, 32, 16, 16),
                   Finishline(184, 32, 16, 16)}

    return finishlines
end

return instanciate