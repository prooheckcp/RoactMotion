local Transition = {}
Transition.__index = Transition

function Transition.new()
    local self = setmetatable({}, Transition)

    return self
end

export type Transition = typeof(Transition)

return Transition