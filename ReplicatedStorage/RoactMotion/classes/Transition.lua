local Transition = {}
Transition.__index = Transition
Transition.duration = nil :: number
Transition.easingStyle = nil :: Enum.EasingStyle
Transition.easingDirection = nil :: Enum.EasingDirection
Transition.delay = nil :: number
Transition._reachedKeypointCallbacks = nil :: {}
Transition._completedCallbacks = nil :: {}

function Transition.new()
    local self = setmetatable({}, Transition)
    self.duration = 1
    self.easingStyle = Enum.EasingStyle.Linear
    self.easingDirection = Enum.EasingDirection.InOut
    self.delay = 0

    return self
end

function Transition.reachedKeypoint:Connect(callback : (keypoint : number)->nil)
    
end

function Transition.completed:Connect(callback : ()->nil)
    
end

export type Transition = typeof(Transition)

return Transition