local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Roact = require(ReplicatedStorage.Packages.roact)
local ComponentState = require(script.enums.ComponentState)
local Motor = require(script.classes.Motor)
local Transition = require(script.classes.Transition)
local Animation = require(script.classes.Animation)

local RoactMotion = {}

export type Animations = {
    whileHover : ()->nil,
    onHoverEnd : ()->nil,
    onHoverEnd : ()->nil,
}

RoactMotion.createElement = function(
    component: string | Roact.Component | ((props: table) -> Roact.Element), 
    props: table?, 
    children: {[string | number]: Roact.Element}?,
    animations : Animations
) : Roact.Component

    animations = animations or {}
    local transition : Transition.Transition = animations.transition or Transition.new()
    local animate : {} = animations.animate or {}
    local newComponent : Roact.Component = Roact.PureComponent:extend("AnimatedComponent")

    function newComponent:init()
        self.props = props
        self.children = children
        self.component = component
        
        self.props[Roact.Children] = self.children

        local motorReference : {[string]:Motor.Motor} = {} --Uses property name
        self.callbacks = {
            whileHover = {},
            whileTap = {},
            _default = {},
        }

        for _, animation in pairs(animate) do
            function animation:play()
                
            end
        end

        for eventName, targetValue in pairs(animations) do
            if not self.callbacks[eventName] then
                if eventName == "animate" then
                    for _, animation : Animation.Animation in pairs(targetValue) do
                        for propertyName, targetValue in pairs(animation.animation) do
                            if not motorReference[propertyName] then
                                self:createMotor(motorReference, propertyName)
                            end

                            function animation:start(customTargetValue : number)
                                motorReference[propertyName]:Set(targetValue, animation.transition or transition, customTargetValue)
                            end
                        end
                    end
                elseif 
                eventName == "onHoverEnd" or
                eventName == "onHoverStart" or
                eventName == "onTap" or
                eventName == "onTapStart" or
                eventName == "onTapEnd"
                then
                    self.callbacks[eventName] = targetValue
                end                    

                continue
            end

            if typeof(targetValue) ~= "table" then
                continue
            end

            for propertyName, targetValue in pairs(targetValue) do
                if not motorReference[propertyName] then
                    self:createMotor(motorReference, propertyName)
                end

                table.insert(self.callbacks[eventName], function()
                    motorReference[propertyName]:Set(targetValue, transition)
                end)
            end
        end

        if component == "ImageButton" or component == "TextButton" then
            self.props[Roact.Event.MouseButton1Down] = function()
                self:setState({
                    componentState = ComponentState.Tap,
                })
            end

            self.props[Roact.Event.MouseButton1Up] = function()
                self:setState({
                    componentState = ComponentState.Hover,
                })
            end

            self.props[Roact.Event.Activated] = self.props[Roact.Event.Activated] or function()
                self:runCallbacks(self.callbacks.onTap)
            end
        end

        self.props[Roact.Event.MouseEnter] = function()
            self:setState({
                isHovering = true,
                componentState = ComponentState.Hover
            })    
        end

        self.props[Roact.Event.MouseLeave] = function()
            self:setState({
                isHovering = false,
                componentState = ComponentState.None
            })
        end            

        self:setState({
            componentState = ComponentState.None,
            isHovering = false
        })
    end

    function newComponent:createMotor(motorReference, propertyName)
        local initialValue : any = props[propertyName]
        local binding : Roact.Binding, updateBinding : (newValue: any) -> () = Roact.createBinding(props[propertyName] or 0)
        local motor = Motor.new(binding, updateBinding)

        motorReference[propertyName] = motor

        props[propertyName] = binding:map(function(value)
            return value
        end)

        table.insert(self.callbacks._default, function()
            motor:Set(initialValue, transition)
        end)
    end

    function newComponent:runCallbacks(callbacks : {()->nil})
        if not callbacks then
            return
        end

        if typeof(callbacks) == "function" then
            task.spawn(callbacks)
            return
        end 

        for _, c in pairs(callbacks) do
           task.spawn(c)
        end
    end

    function newComponent:willUpdate(_, nextState)
        local currentComponentState : ComponentState.ComponentState = self.state.componentState

        if currentComponentState ~= nextState.componentState then
            local nextComponentState : ComponentState.ComponentState = nextState.componentState

            if nextState.componentState == ComponentState.None then
                self:runCallbacks(self.callbacks.onHoverEnd)
            elseif currentComponentState == ComponentState.Tap then
                self:runCallbacks(self.callbacks.onTapEnd)
            end

            if nextComponentState == ComponentState.Hover then
                self:runCallbacks(self.callbacks.onHoverStart)
                self:runCallbacks(self.callbacks.whileHover) 
            elseif nextComponentState == ComponentState.Tap then
                self:runCallbacks(self.callbacks.onTapStart)
                self:runCallbacks(self.callbacks.whileTap)
            elseif nextComponentState == ComponentState.None then
                self:runCallbacks(self.callbacks._default)         
            end
        end
    end

    function newComponent:render()
        return Roact.createElement(self.component, self.props)
    end


    return Roact.createElement(newComponent)
end

RoactMotion.Transition = Transition
RoactMotion.Animation = Animation

export type Transition = typeof(Transition.new())
export type Animation = typeof(Animation.new())

return RoactMotion