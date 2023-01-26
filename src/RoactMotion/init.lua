local Roact = nil
local ComponentState = require(script.enums.ComponentState)
local Motor = require(script.classes.Motor)
local Transition = require(script.classes.Transition)
local Animation = require(script.classes.Animation)
local Event = require(script.enums.Event)
local Controller = require(script.classes.Controller)

local RoactMotion = {}

RoactMotion.createElement = function(
    component: string | Roact.Component | ((props: table) -> Roact.Element), 
    props: table?, 
    children: {[string | number]: Roact.Element}?,
    animations : {}
) : Roact.Component
    if animations then
        assert(typeof(animations) == "table", "The fourth argument must be an animation instructions map!")
    end

    animations = animations or {}
    local transition : Transition.Transition = animations.transition or Transition.new()
    local newComponent : Roact.Component = Roact.PureComponent:extend("AnimatedComponent")

    function newComponent:init()
        self.children = children
        self.component = component
        
        local propsState = {}
        self.propsState = propsState
        for propertyName : string, propertyValue : any in pairs(props) do
            propsState[propertyName] = propertyValue
        end

        propsState[Roact.Children] = self.children

        local motorReference : {[string]:Motor.Motor} = {} --Uses property name
        self.callbacks = {
            whileHover = {},
            whileTap = {},
            _default = {},
        }

        self.motorReference = motorReference

        for eventName : string | Event.Event, targetValue : any in pairs(animations) do
            if not self.callbacks[eventName] then
                if eventName == "animate" then
                    self:loadAnimate(targetValue, motorReference)
                elseif eventName == "controller" then
                    function targetValue.play(_, animations : {}, transition : Transition.Transition?)
                        self:playAnimation(animations, transition)
                    end
                elseif Event[eventName] then
                    self.callbacks[eventName] = targetValue
                end                    

                continue
            end

            if typeof(targetValue) ~= "table" then
                continue
            end

            for propertyName : string, targetValue : any in pairs(targetValue) do
                if not motorReference[propertyName] then
                    self:createMotor(propertyName, true)
                end

                table.insert(self.callbacks[eventName], function()
                    motorReference[propertyName]:Set(targetValue, transition)
                end)
            end
        end

        if component == "ImageButton" or component == "TextButton" then
            propsState[Roact.Event.MouseButton1Down] = function()
                self:setState({componentState = ComponentState.Tap})
            end

            propsState[Roact.Event.MouseButton1Up] = function()
                self:setState({componentState = ComponentState.Hover})
            end

            propsState[Roact.Event.Activated] = propsState[Roact.Event.Activated] or function()
                self:runCallbacks(self.callbacks.onTap)
            end
        end

        propsState[Roact.Event.MouseEnter] = function()
            self:setState({componentState = ComponentState.Hover})
        end

        propsState[Roact.Event.MouseLeave] = function()
            self:setState({componentState = ComponentState.None})
        end            

        for propertyName : string in pairs(props) do
            self:createMotor(propertyName)
        end

        self:setState({
            componentState = ComponentState.None,
            props = propsState
        })
    end

    function newComponent:playAnimation(animations : {}, customTransition : Transition.Transition)
        for propertyName : string, targetValue : any in pairs(animations) do
            if not self.motorReference[propertyName] then
                self:createMotor(propertyName, false)
            end

            self.motorReference[propertyName]:Set(targetValue, customTransition or transition)
        end
    end

    function newComponent:loadAnimate(animations : {Animation.Animation}, motorReference : {[string]:Motor.Motor})
        for _, animation : Animation.Animation in pairs(animations) do
            local targetMotors = {}

            for propertyName : string, targetValue : any in pairs(animation.animation) do
                if not motorReference[propertyName] then
                    self:createMotor(propertyName, false)
                end

                targetMotors[propertyName] = targetValue
            end
            
            function animation:play(customTargetValue : number, customParams : any)
                for propertyName : string, targetValue : any in pairs(targetMotors) do
                    motorReference[propertyName]:Set(targetValue, animation.transition or transition, customTargetValue, customParams, animation)
                end
            end
        end        
    end

    function newComponent:createMotor(propertyName : string, shouldReset : boolean)
        if self.motorReference[propertyName] then
            return
        end

        local propsState = self.state.props or self.propsState
        local initialValue : any = propsState[propertyName] or Instance.new(component)[propertyName]

        local binding : Roact.Binding, updateBinding : (newValue: any) -> () = Roact.createBinding(initialValue)
        local motor = Motor.new(binding, updateBinding)

        self.motorReference[propertyName] = motor

        propsState[propertyName] = binding:map(function(value)
            return value
        end)

        if not shouldReset then
            self:setState({
                props = propsState
            })

            return
        end

        table.insert(self.callbacks._default, function()
            motor:Set(initialValue, transition)
        end)

        self:setState({
            props = propsState
        })
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
        local propsState = self.state.props

        return Roact.createElement(self.component, propsState)
    end

    return Roact.createElement(newComponent)
end

RoactMotion.Transition = Transition
RoactMotion.Animation = Animation
RoactMotion.Event = Event
RoactMotion.Controller = Controller

export type Transition = typeof(Transition.new())
export type Animation = typeof(Animation.new())
export type Controller = typeof(Controller.new())

return function (roact)
    assert(typeof(roact) == "table" and roact.createElement ~= nil, "You should give a Roact reference to RoactMotion!")
    Roact = roact
    return RoactMotion
end