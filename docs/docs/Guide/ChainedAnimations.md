---
displayed_sidebar: docsSidebar
sidebar_position: 4
title: Chained Animations
---

Wow we've already been thru a lot together! But now you're probably thinking, what about chained animations? How would I approach this?

Don't worry, RoactMotion has a million way of doing whatever you wish with it! Making chained animations is as simple as quite literally passing an array instead of a target value. Remember the last example with the cube? Let's make that animation a bit more complex now!

```luau
local transition : RoactMotion.Transition = RoactMotion.Transition.new()
transition.duration = 0.5

local animation : RoactMotion.Animation = RoactMotion.Animation.new({
	Position = {UDim2.fromScale(0.2 ,0.2), UDim2.fromScale(0.2, 0.8), UDim2.fromScale(0.8, 0.8), UDim2.fromScale(0.8, 0.2)}
}, transition)
```

This should make the cube move around the screen, let's watch it in action.

<img src="https://cdn.discordapp.com/attachments/670023265455964198/1049449218508607508/CubeMoving.gif" alt="drawing" width="800"/>

You can do this for multiple values at the same time and for as many keypoints as you wish! The only limit is your imagination.

:::info
Since we specified that the duration of the transition = 0.5 it will make this animation take 2 seconds to finish. Each keypoint should take 0.5 seconds and since we created 4 of them it will take 0.5 x 4 to finish.
:::

But this is not the only way to chain things! We can also give it a callback for when it finishes the same way you'd give a promise!

```luau
local animation : Roact.Animation = RoactMotion.Animation.new({
	Position = {UDim2.fromScale(0.2 ,0.2), UDim2.fromScale(0.2, 0.8), UDim2.fromScale(0.8, 0.8), UDim2.fromScale(0.8, 0.2)}
}, transition):andThen(function()
	print("Hi mom!")
end)
```

In this case we printed "Hi mom!" but instead we can also just call another animation object to make an even more complex animation! The limit is your imagination!

In case you got lost this is the full code so far:

```luau
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Roact = require(ReplicatedStorage.Packages.roact) --Use whatever path you have for your Roact
local RoactMotion = require(ReplicatedStorage.RoactMotion)(Roact) --Replace ReplicatedStorage.RoactMotion with whatever path you need

local transition : RoactMotion.Transition = RoactMotion.Transition.new()
transition.duration = 0.5

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
```