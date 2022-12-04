local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Roact = require(ReplicatedStorage.Packages.roact)
local RoactMotion = require(ReplicatedStorage.RoactMotion)(Roact)

local transition : RoactMotion.Transition = RoactMotion.Transition.new()
transition.duration = 0.6
transition.easingStyle = Enum.EasingStyle.Linear
transition.easingDirection = Enum.EasingDirection.InOut
transition.repeatCount = 1
transition.reverses = true

local animation : RoactMotion.Animation = RoactMotion.Animation.new({
    Size = {UDim2.fromScale(0.5, 0.5), UDim2.fromScale(0.3, 0.3), UDim2.fromScale(0.1, 0.3)}
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
            animation:start(-5, "SIIIU")
        end,
        --[[
        [RoactMotion.Event.whileHover] = {
            Size = UDim2.fromOffset(300, 60),
            Position = UDim2.fromScale(0.5, 0.45),
        },
        [RoactMotion.Event.whileTap] = {
            Size = UDim2.fromOffset(200, 30)
        },

        ]]      

        transition = transition,
        animate = {animation}
    })
}), Players.LocalPlayer.PlayerGui, "TestGUI")