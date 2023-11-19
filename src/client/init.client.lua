local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Roact = require(ReplicatedStorage.Packages.Roact) --Use whatever path you have for your Roact
local RoactMotion = require(ReplicatedStorage.Packages.RoactMotion)(Roact) --Replace ReplicatedStorage.RoactMotion with whatever path you need

local transition : RoactMotion.Transition = RoactMotion.Transition.new()
transition.duration = 1

local animation : RoactMotion.Animation = RoactMotion.Animation.new({
    Position = {UDim2.fromScale(0.2 ,0.2), UDim2.fromScale(0.2, 0.8), UDim2.fromScale(0.8, 0.8), UDim2.fromScale(0.8, 0.2)}
}, transition):andThen(function()
    print("Hi mom!")
end)

Roact.mount(Roact.createElement("ScreenGui", {}, {
    RoactMotion.createElement("TextButton", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(100, 50),
        Text = "Hello world!",
        BackgroundTransparency = 0,
    }, 
    nil, {
        [RoactMotion.Event.whileHover] = {
            Size = UDim2.fromOffset(150, 80)
        },
        
        [RoactMotion.Event.whileTap] = {
            Size = UDim2.fromOffset(80, 40)
        },
        
        [RoactMotion.Event.onTap] = function()
            animation:play()
        end,
        transition = transition
    }),
    RoactMotion.createElement("Frame", {
        Size = UDim2.fromOffset(50, 50),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.2),
    }, nil, {
        animate = {animation}
    })
}), Players.LocalPlayer.PlayerGui, "TestGUI")