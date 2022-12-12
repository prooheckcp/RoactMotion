---
displayed_sidebar: apiSidebar
title: "createElement"
sidebar_position: 1
---

This is the main and only function that exists. It returns a Roact.Element with the given parameters. You'll use it the same exact way as you would use Roact.createElement with the difference that you can feed it a fourth argument to specify how would you prefer to see it being animated.

```luau
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Roact = require(ReplicatedStorage.Packages.roact) --Use whatever path you have for your Roact
local RoactMotion = require(ReplicatedStorage.RoactMotion)(Roact) --Replace ReplicatedStorage.RoactMotion with whatever path you need

Roact.mount(Roact.createElement("ScreenGui", {}, {
    RoactMotion.createElement("TextButton", { --Here we replaced Roact with RoactMotion
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(100, 50),
        Text = "Hello world!",
        BackgroundTransparency = 0,
    }, 
    nil)
}), Players.LocalPlayer.PlayerGui, "TestGUI")
```
#### Parameters

className : ``string`` | The instance you want to be created
-|-
properties : ``{[string]:any}`` | The properties for the instance that will be created
children : ``{[string]:Roact.Element}`` | The children of the instance
animationObject : ``RoactMotion.AnimationObject`` | The events, animations and controller for the RoactMotion element

#### Returns
|``Roact.Element`` |
|-|
