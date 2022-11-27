local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Transition = require(script.Parent.Transition)

local Motor = {}
Motor.__index = Motor
Motor.value = nil
Motor.setBinding = nil
Motor.renderStepped = nil :: RBXScriptSignal
Motor.targetValue = nil :: any
Motor.currentT = nil :: number
Motor.transition = nil :: Transition.Transition

local function lerp(a, b, t)
    return a + (b - a) * t
end

function Motor.new(binding, setBinding)
    local self = setmetatable({}, Motor)

    self.binding = binding
    self.setBinding = setBinding

    return self
end

function Motor:Update(deltaTime : number)
    local alpha : number = TweenService:GetValue(self.currentT, self.transition.easingStyle, self.transition.easingDirection)
    local currentValue : any = self.binding:getValue()
    local newValue : any = nil

    if typeof(self.targetValue) == "number" then
        newValue = lerp(currentValue, self.targetValue, alpha)
    else
        newValue = currentValue:Lerp(self.targetValue, alpha)
    end

    self.setBinding(newValue)

    if self.currentT == 1 then
        self.renderStepped:Disconnect()
    end

    self.currentT += math.min(deltaTime/self.transition.duration, 1)
end

function Motor:Set(targetValue : any, transition : Transition.Transition)
    self.currentT = 0
    self.targetValue = targetValue
    self.transition = transition

    if not self.renderStepped then
        self.renderStepped = RunService.RenderStepped:Connect(function(deltaTime : number)
            self:Update(deltaTime)
        end)
    end
end

export type Motor = typeof(Motor)

return Motor