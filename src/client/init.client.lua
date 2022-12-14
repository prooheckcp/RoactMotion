local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Roact = require(ReplicatedStorage.Packages.roact)
local RoactMotion = require(ReplicatedStorage.RoactMotion)(Roact)

local transition : RoactMotion.Transition = RoactMotion.Transition.new()
transition.duration = 0.1
transition.easingStyle = Enum.EasingStyle.Linear
transition.easingDirection = Enum.EasingDirection.InOut
transition.repeatCount = 1

local controller : RoactMotion.Controller = RoactMotion.Controller.new()

Roact.mount(Roact.createElement("ScreenGui", {}, {
    RoactMotion.createElement("TextButton", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(100, 50),
        Text = "Current count : 1",
        BackgroundTransparency = 0,
    }, 
    nil,
    {
        [RoactMotion.Event.onTap] = function()
            controller:play({
                BackgroundTransparency = 1,
                BackgroundColor3 = Color3.fromRGB(150, 0, 0)
            }, transition)
        end,
 
        [RoactMotion.Event.whileHover] = {
            Size = UDim2.fromOffset(300, 60),
            Position = UDim2.fromScale(0.5, 0.475),
            AnchorPoint = Vector2.new(0.5, 0),
            BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        },
        [RoactMotion.Event.whileTap] = {
            Size = UDim2.fromOffset(200, 50),
        },

        transition = transition,
        controller = controller
    })
}), Players.LocalPlayer.PlayerGui, "TestGUI")