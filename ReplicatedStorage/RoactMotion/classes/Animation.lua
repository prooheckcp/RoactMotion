local Transition = require(script.Parent.Transition)
local Event = require(script.Parent.Event)

local Animation = {}
Animation.__index = Animation
Animation.animation = nil
Animation.transition = nil :: Transition.Transition
Animation.completed = nil :: Event.Event
Animation.type = "Animation" :: string

function Animation.new(animation : {}, transition : Transition.Transition?)
    local self = setmetatable({}, Animation)
    
    self.animation = animation or {}
    self.transition = transition or nil
    self.completed = Event.new()

    return self
end

function Animation:play(targetValue : number, customValue : number)
    
end

function Animation:andThen(callBack : ()->nil)
    self.completed:Connect(callBack)
    
    return self
end

export type Animation = typeof(Animation)

return Animation