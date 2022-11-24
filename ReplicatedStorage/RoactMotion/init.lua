local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Roact = require(ReplicatedStorage.Packages.roact)
local ComponentState = require(script.enums.ComponentState)

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

    local newComponent : Roact.Component = Roact.PureComponent:extend("AnimatedComponent")

    function newComponent:init()
        self.props = props
        self.children = children
        self.component = component

        self.props[Roact.Children] = self.children

        local bindingReference : {[string]:Roact.Binding} = {} --Uses property name 
        for eventName, targetValue in pairs(animations) do
            if typeof(targetValue) ~= "table" then
                continue
            end

            for propertyName, targetValue in pairs(targetValue) do
                if not bindingReference[propertyName] then
                    local initialValue : any = props[propertyName]
                    local binding : Roact.Binding, updateBinding : (newValue: any) -> () = Roact.createBinding(props[propertyName] or 0)
                    
                    bindingReference[propertyName] = binding

                    props[propertyName] = binding:map(function(value)
                        print(value)
                        return initialValue
                    end)
                end
  
                print("Created bind")
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

    function newComponent:willUpdate(_, nextState)
        
    end

    function newComponent:render()
        return Roact.createElement(self.component, self.props)
    end


    return Roact.createElement(newComponent)
end

return RoactMotion