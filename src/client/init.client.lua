local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Roact = require(ReplicatedStorage.Packages.roact)
local RoactMotion = require(ReplicatedStorage.RoactMotion)

local transition = RoactMotion.Transition.new()
transition.duration = 0.6
transition.easingStyle = Enum.EasingStyle.Circular
transition.easingDirection = Enum.EasingDirection.Out

local animation = RoactMotion.Animation.new({
    Size = UDim2.fromOffset(500, 500),
})

task.delay(10, function()
    animation:start()
end)

Roact.mount(Roact.createElement("ScreenGui", {}, {
    RoactMotion.createElement("TextButton", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(100, 50),
    }, 
    {},
    {
        whileHover = {
            Size = UDim2.fromOffset(300, 60),
            Position = UDim2.fromScale(0.5, 0.45)
        },
        whileTap = {
            Size = UDim2.fromOffset(200, 30)
        },
        transition = transition,
        animate = {animation}
    })
}), Players.LocalPlayer.PlayerGui, "TestGUI")