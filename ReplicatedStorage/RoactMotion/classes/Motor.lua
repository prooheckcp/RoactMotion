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
Motor.previousT = nil :: number 
Motor.transition = nil :: Transition.Transition
Motor.startValue = nil :: any
Motor.customTargetValue = nil :: number

local function lerp(a, b, t)
    return a + (b - a) * t
end

function Motor.new(binding, setBinding)
    local self = setmetatable({}, Motor)

    self.binding = binding
    self.setBinding = setBinding

    return self
end

function Motor:_GetTargetLimit()
    if typeof(self.targetValue) == "table" then
        local targetIndex : number = math.min(1 + math.floor(self.currentT), #self.targetValue)
        return self.targetValue[targetIndex], #self.targetValue
    else
        return self.targetValue, 1
    end
end

function Motor:_GetLerped(currentTarget : any, alpha : number)
    if typeof(currentTarget) == "number" then
        return lerp(self.startValue, currentTarget, alpha)
    elseif typeof(currentTarget) == "function" then
        local finalCustom : number? = nil

        if self.customTargetValue then
            finalCustom = self.customTargetValue * self.currentT    
        end

        return currentTarget(math.min(self.currentT - self.previousT, 1), finalCustom)
    elseif 
    typeof(currentTarget) == "Vector3" or 
    typeof(currentTarget) == "Vector2" or 
    typeof(currentTarget) == "UDim2" or 
    typeof(currentTarget) == "UDim" or
    typeof(currentTarget) == "Color3"
    then
        return self.startValue:Lerp(currentTarget, alpha)
    else
        return currentTarget
    end
end

function Motor:Update(deltaTime : number)
    local targetAlpha : number = math.min(self.currentT - self.previousT, 1)

    local alpha : number = TweenService:GetValue(targetAlpha, self.transition.easingStyle, self.transition.easingDirection)
    local newValue : any = nil

    local currentTarget : any = nil
    local tlimit : number = nil

    currentTarget, tlimit = self:_GetTargetLimit()
    newValue = self:_GetLerped(currentTarget, alpha)

    self.setBinding(newValue)

    if self.currentT == tlimit then
        self.transition.completed:Fire()
        self.renderStepped:Disconnect()
        self.renderStepped = nil
        return
    end

    self.currentT += deltaTime/self.transition.duration
    self.currentT = math.min(self.currentT, tlimit)

    if self.previousT < math.floor(self.currentT) and self.previousT + 1 < tlimit then
        self.previousT = math.floor(self.currentT)
        self.transition.reachedKeypoint:Fire(self.previousT)
        self.startValue = self:_GetLerped(currentTarget, self.previousT)
    end
end

function Motor:Set(targetValue : any, transition : Transition.Transition, customTargetValue : number)
    if transition.delay > 0 then task.wait(transition.delay) end

    self.currentT = 0
    self.previousT = 0
    self.targetValue = targetValue
    self.transition = transition
    self.startValue = self.binding:getValue()
    self.customTargetValue = customTargetValue

    if not self.renderStepped then
        self.renderStepped = RunService.RenderStepped:Connect(function(deltaTime : number)
            self:Update(deltaTime)
        end)
    end
end

export type Motor = typeof(Motor)

return Motor