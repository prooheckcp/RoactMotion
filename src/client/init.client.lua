local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Roact = require(ReplicatedStorage.Packages.roact)
local RoactMotion = require(ReplicatedStorage.RoactMotion)

local transition = RoactMotion.Transition.new()
transition.duration = 0.1

Roact.mount(Roact.createElement("ScreenGui", {}, {
    RoactMotion.createElement("TextButton", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(100, 50),
    }, 
    {}, 
    {
        whileHover = {
            Size = {UDim2.fromOffset(300, 60), UDim2.fromOffset(300, 200)}
        },
        whileTap = {
            Size = UDim2.fromOffset(200, 55)
        },
        --transition = transition
    })
}), Players.LocalPlayer.PlayerGui, "TestGUI")