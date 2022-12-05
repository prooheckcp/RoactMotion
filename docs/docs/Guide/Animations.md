---
displayed_sidebar: docsSidebar
sidebar_position: 3
---

Wow, we've already learned a lot so far! But right now you probably still have some questions which hopefully we'll be covering in the following parts of this tutorial! And one of those questions might be, what if I want to play an animation from outside of one of these events? What if I want to call the animation at a specific situation? What if I want to animate a different object from the current one? And the answer to all of those questions are animation objects! Let's see how they work...

First let's make a new animation object...

```luau
local transition : Roact.Transition = RoactMotion.Transition.new()
transition.duration = 0.2

local animation : Roact.Animation = RoactMotion.Animation.new({
	Position = UDim2.fromScale(0.2 ,0.2)	
}, transition)
```

This will make the object mode to the given position when the animation is played! Now let's create a small cube that we will animate!

```luau
	RoactMotion.createElement("Frame", {
		Size = UDim2.fromOffset(50, 50),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.2),
	}, nil)
```

Now we need to give him the animation object! This can be passed thru a ``animate`` property. Let's see the full code

```luau
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Roact = require(ReplicatedStorage.Packages.roact) --Use whatever path you have for your Roact
local RoactMotion = require(ReplicatedStorage.RoactMotion)(Roact) --Replace ReplicatedStorage.RoactMotion with whatever path you need

local transition : Roact.Transition = RoactMotion.Transition.new()
transition.duration = 0.2

local animation : Roact.Animation = RoactMotion.Animation.new({
	Position = UDim2.fromScale(0.2 ,0.2)	
}, transition)

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
			print("Pressed!")
		end,
		transition = transition
	}),
	RoactMotion.createElement("Frame", {
		Size = UDim2.fromOffset(50, 50),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.2),
	}, nil, {
		animate = {animation} --We're giving the animation object here
	})
}), Players.LocalPlayer.PlayerGui, "TestGUI")
```

Now let's make it move when we press the button by playing the animation onTap!

```luau
		[RoactMotion.Event.onTap] = function()
			animation:play()
		end,
```

<img src="https://cdn.discordapp.com/attachments/670023265455964198/1049446496476598332/MoveCube.gif" alt="drawing" width="800"/>

:::caution
You cannot reuse the same animation object for multiple objects or when you call play it will affect all of them! Instead use a library such as Llama to copy the object in case you wish to reuse it. Transitions on the other hand can be reused without any problem as they simply behave as data containers.
:::