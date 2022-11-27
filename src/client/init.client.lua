local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Roact = require(ReplicatedStorage.Packages.roact)
local RoactMotion = require(ReplicatedStorage.RoactMotion)

local transition : RoactMotion.Transition = RoactMotion.Transition.new()
transition.duration = 0.6
transition.easingStyle = Enum.EasingStyle.Circular
transition.easingDirection = Enum.EasingDirection.Out
transition.completed:Connect(function()
    print("Completed transition")
end)

Roact.mount(Roact.createElement("ScreenGui", {}, {
    RoactMotion.createElement("TextButton", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(100, 50),
        Text = "Current count : 1"
    }, 
    {},
    {
        whileHover = {
            Size = UDim2.fromOffset(300, 60),
            Position = UDim2.fromScale(0.5, 0.45),
            Text = function(value : number)
                return "Current count: "..value
            end
        },
        whileTap = {
            Size = UDim2.fromOffset(200, 30)
        },
        transition = transition,
    })
}), Players.LocalPlayer.PlayerGui, "TestGUI")