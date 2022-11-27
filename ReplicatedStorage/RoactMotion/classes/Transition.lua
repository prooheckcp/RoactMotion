local Transition = {}
Transition.__index = Transition
Transition.duration = nil :: number
Transition.type = nil :: Enum.EasingStyle
Transition.delay = nil :: number

function Transition.new()
    local self = setmetatable({}, Transition)
    self.duration = 1
    self.type = Enum.EasingStyle.Linear
    self.delay = 0

    return self
end

export type Transition = typeof(Transition)

return Transition