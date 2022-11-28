local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Roact = require(ReplicatedStorage.Packages.roact)
local RoactMotion = require(ReplicatedStorage.RoactMotion)(Roact)

local transition : RoactMotion.Transition = RoactMotion.Transition.new()
transition.duration = 0.6
transition.easingStyle = Enum.EasingStyle.Circular
transition.easingDirection = Enum.EasingDirection.Out

local animation : RoactMotion.Animation = RoactMotion.Animation.new({
    Text = function(_, x)
        return "Current count: "..math.floor(x)
    end,
    Size = UDim2.fromScale(0.5, 0.5)
}, transition):andThen(function()
    print("I was called after!")
end)

local animation2 : RoactMotion.Animation = RoactMotion.Animation.new({
    Text = function(_, x)
        return "Current count: "..math.floor(-x)
    end,
    Size = UDim2.fromScale(0.5, 0.5)
}, transition):andThen(function()
    print("I was called after!")
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
        [RoactMotion.Event.whileHover] = {
            Size = UDim2.fromOffset(300, 60),
            Position = UDim2.fromScale(0.5, 0.45),
        },
        
        [RoactMotion.Event.whileTap] = {
            Size = UDim2.fromOffset(200, 30)
        },

        [RoactMotion.Event.onTap] = function()
            animation:start(5)
        end,
        transition = transition,
        animate = {animation, animation2}
    })
}), Players.LocalPlayer.PlayerGui, "TestGUI")