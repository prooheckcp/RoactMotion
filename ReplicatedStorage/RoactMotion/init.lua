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

        if component == "ImageButton" or component == "TextButton" then
            self.props[Roact.Event.MouseButton1Down] = function()
                self:setState({
                    t = "t"
                })
            end

            self.props[Roact.Event.MouseButton1Up] = function()

            end
        end

        --[[
        self.props[Roact.Event.MouseEnter] = function()
            self:setState({
                componentState = ComponentState.Hover
            })    
        end

        self.props[Roact.Event.MouseLeave] = function()
            self:setState({
                componentState = ComponentState.None
            })
        end            
        ]]


        self:setState({
            componentState = ComponentState.None
        })
    end

    function newComponent:willUpdate(_, nextState)
        
    end

    function newComponent:render()
        return Roact.createElement(self.component, self.props, self.children)
    end


    return Roact.createElement(newComponent)
end

return RoactMotion