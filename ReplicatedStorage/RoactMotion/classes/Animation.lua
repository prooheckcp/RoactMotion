local Transition = require(script.Parent.Transition)
local Event = require(script.Parent.Event)

local Animation = {}
Animation.__index = Animation
Animation.animation = nil
Animation.transition = nil :: Transition.Transition
Animation.completed = nil :: Event.Event

function Animation.new(animation, transition : Transition.Transition)
    local self = setmetatable({}, Animation)
    
    self.animation = animation or {}
    self.transition = transition or nil
    self.completed = Event.new()

    return self
end

function Animation:start(targetValue : number)
    
end

export type Animation = typeof(Animation)

return Animation