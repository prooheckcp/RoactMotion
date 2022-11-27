local Transition = require(script.Parent.Transition)

local Animation = {}
Animation.__index = Animation
Animation.animation = nil
Animation.transition = nil

function Animation.new(animation, transition : Transition.Transition)
    local self = setmetatable({}, Animation)
    
    self.animation = animation or {}
    self.transition = transition or nil

    return self
end

function Animation:start(targetValue : number)
    
end

export type Animation = typeof(Animation)

return Animation