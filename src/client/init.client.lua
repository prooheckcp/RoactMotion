local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Roact = require(ReplicatedStorage.Packages.roact)
local RoactMotion = require(ReplicatedStorage.RoactMotion)

print(typeof(UDim2.new()))

Roact.mount(Roact.createElement("ScreenGui", {}, {
    RoactMotion.createElement("TextButton", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(100, 50),
    }, 
    {}, 
    {
        whileHover = {
            Size = UDim2.fromOffset(300, 60)
        }
    })
}), Players.LocalPlayer.PlayerGui, "TestGUI")