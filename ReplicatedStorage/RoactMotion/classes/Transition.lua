local Event = require(script.Parent.Event)

local Transition = {}
Transition.__index = Transition
Transition.duration = nil :: number
Transition.easingStyle = nil :: Enum.EasingStyle
Transition.easingDirection = nil :: Enum.EasingDirection
Transition.delay = nil :: number
Transition.reverses = nil :: boolean
Transition.repeatCount = nil :: number
Transition.reachedKeypoint = nil :: RBXScriptSignal
Transition.completed = nil :: RBXScriptSignal

function Transition.new()
    local self = setmetatable({}, Transition)
    self.duration = 1
    self.easingStyle = Enum.EasingStyle.Linear
    self.easingDirection = Enum.EasingDirection.InOut
    self.reverses = false
    self.repeatCount = 1
    self.delay = 0
    self.reachedKeypoint = Event.new()
    self.completed = Event.new()

    return self
end

export type Transition = typeof(Transition)

return Transition