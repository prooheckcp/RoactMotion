local RunService = game:GetService("RunService")

local Motor = {}
Motor.__index = Motor
Motor.value = nil
Motor.setBinding = nil

function Motor.new(initialValue, setBinding)
    local self = setmetatable({}, Motor)

    self.value = initialValue
    self.setBinding = setBinding

    return self
end



export type Motor = typeof(Motor)

return Motor