local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Roact = require(ReplicatedStorage.Packages.roact)

local createElement = require(script.createElement)

local RoactMotion = {}

RoactMotion.createElement = function(
    component: string | Roact.Component | ((props: table) -> Roact.Element), 
    props: table?, 
    children: {[string | number]: Roact.Element}?
) : Roact.Component
    
    local newComponent : Roact.Component = Roact.PureComponent:extend("AnimatedComponent")

    function newComponent:init()
        self.props = props

        if component == "ImageButton" or component == "TextButton" then
            
        end
        self.props[Roact.Event.Activated] = function()
            print("Called!")
        end
    end

    function newComponent:render()
        print(self.props)
        return Roact.createElement(component, self.props, children)
    end


    return Roact.createElement(newComponent)
end

return RoactMotion