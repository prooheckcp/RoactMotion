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
Motor.repeatCount = nil :: number
Motor.reversed = nil :: boolean
Motor.customValue = nil :: any
Motor.initialValue = nil :: any

local function lerp(a : number, b : number, t : number) : number
    return a + (b - a) * t
end

function Motor.new(binding, setBinding)
    local self = setmetatable({}, Motor)

    self.binding = binding
    self.setBinding = setBinding

    return self
end

function Motor:_GetTargetLimit() : (number, number)
    if typeof(self.targetValue) == "table" then
        local targetIndex : number = math.min(1 + math.floor(self.currentT), #self.targetValue)
        return self.targetValue[targetIndex], #self.targetValue
    else
        return self.targetValue, 1
    end
end

function Motor:_GetLerped(currentTarget : any, alpha : number) : number
    if typeof(currentTarget) == "number" then
        return lerp(self.startValue, currentTarget, alpha)
    elseif typeof(currentTarget) == "function" then
        local finalCustom : number? = nil

        if self.customTargetValue then
            finalCustom = self.customTargetValue * self.currentT    
        end

        return currentTarget(math.min(self.currentT - self.previousT, 1), finalCustom, self.customValue)
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

function Motor:Update(deltaTime : number) : nil
    local targetAlpha : number = math.clamp(self.currentT - self.previousT, 0, 1)
    local alpha : number = TweenService:GetValue(targetAlpha, self.transition.easingStyle, self.transition.easingDirection)
    local newValue : any = nil
    local currentTarget : any = nil
    local tlimit : number = nil

    currentTarget, tlimit = self:_GetTargetLimit()
    newValue = self:_GetLerped(currentTarget, alpha)

    self.setBinding(newValue)
    
    if (not self.reversed and self.currentT == tlimit) or (self.reversed and self.currentT == 0) then
        if 
        not self.transition.reverses or
        (self.reversed and self.currentT == 0)
        then
            self.reversed = false
            self.repeatCount += 1
        else
            self.reversed = true
        end
            
        if self.transition.repeatCount == self.repeatCount then
            self:Stop()
        elseif not self.reversed then
            self:Reset()
        end

        return
    end

    local movingAmount : number = deltaTime/self.transition.duration

    if self.reversed then
        self.currentT -= movingAmount
    else
        self.currentT += movingAmount
    end
    
    self.currentT = math.clamp(self.currentT, 0, tlimit)
 
    local currentKey : number = math.floor(self.currentT)

    if not self.reversed then
        if 
        currentKey > self.previousT and
        self.previousT + 1 < tlimit 
        then
            self:ReachedKeyPoint(currentKey, currentTarget, alpha)        
        end
    else
        if currentKey < self.previousT and
        self.previousT > 0
        then
            self:ReachedKeyPoint(currentKey, currentTarget, alpha)
        end
    end
end

function Motor:ReachedKeyPoint(keyPoint : number, currentTarget : any, alpha : number)
    self.previousT = keyPoint
    self.transition.reachedKeypoint:Fire(self.previousT)
    print("Keypoint:", keyPoint, "Current target:", currentTarget)
    self.startValue = self:_GetLerped(currentTarget, alpha)
end

function Motor:Stop()
    self.transition.completed:Fire()
    self.renderStepped:Disconnect()
    self.renderStepped = nil    
end

function Motor:Reset()
    self.currentT = 0
    self.previousT = 0
    self.startValue = self.initialValue
end

function Motor:Set(targetValue : any, transition : Transition.Transition, customTargetValue : number, customValue : any) : nil
    if transition.delay > 0 then task.wait(transition.delay) end

    self.repeatCount = 0
    self.reversed = false
    self:Reset()
    self.targetValue = targetValue
    self.transition = transition
    self.startValue = self.binding:getValue()
    self.initialValue = self.startValue
    self.customTargetValue = customTargetValue
    self.customValue = customValue

    if not self.renderStepped then
        self.renderStepped = RunService.RenderStepped:Connect(function(deltaTime : number)
            self:Update(deltaTime)
        end)
    end
end

export type Motor = typeof(Motor)

return Motor