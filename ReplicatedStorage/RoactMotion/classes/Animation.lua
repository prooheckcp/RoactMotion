local Animation = {}
Animation.__index = Animation
Animation.animation = nil
Animation.transition = nil

function Animation.new(animation, transition)
    local self = setmetatable({}, Animation)
    
    self.animation = animation or {}
    self.transition = transition

    return self
end

function Animation:start()
    
end

export type Animation = typeof(Animation)

return Animation