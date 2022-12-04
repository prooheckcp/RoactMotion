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

local animation : RoactMotion.Animation = RoactMotion.Animation.new({
    Size = {UDim2.fromScale(0.5, 0.5), UDim2.fromScale(0.3, 0.3), UDim2.fromScale(0.1, 0.3), UDim2.fromScale(0.1, 0.1)}
}, transition)

Roact.mount(Roact.createElement("ScreenGui", {}, {
    RoactMotion.createElement("TextButton", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(100, 50),
        Text = "Current count : 1"
    }, 
    {},
    {
        [RoactMotion.Event.onTap] = function()
            controller:play({
                Text = function()
                    return "5"
                end,
            }, transition)
        end,
 
        [RoactMotion.Event.whileHover] = {
            Size = UDim2.fromOffset(300, 60),
            Position = UDim2.fromScale(0.5, 0.475),
        },
        [RoactMotion.Event.whileTap] = {
            Size = UDim2.fromOffset(200, 50)
        },

        transition = transition,
        animate = {animation},
        controller = controller
    })
}), Players.LocalPlayer.PlayerGui, "TestGUI")