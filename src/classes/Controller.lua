local Transition = require(script.Parent.Transition)

local Controller = {}
Controller.__index = Controller
Controller.type = "Controller" :: string

function Controller.new()
    local self = setmetatable({}, Controller)

    return self
end

function Controller:play(animation : {}, transition : Transition.Transition?)
    
end

export type Controller = typeof(Controller.new())

return Controller