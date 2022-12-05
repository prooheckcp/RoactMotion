---
displayed_sidebar: docsSidebar
sidebar_position: 2
---

Roact Motion triggers its animations in 3 different ways: Events, thru an animation controller or thru an animation object. We'll start by looking into events! In order to use events we use the ```RoactMotion.Event``` reference. Let's start by adding a hovering event.

```luau
	RoactMotion.createElement("TextButton", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(100, 50),
		Text = "Hello world!",
		BackgroundTransparency = 0,
	}, 
	nil, {
		[RoactMotion.Event.whileHover] = {
			
		}
	})
```

RoactMotion uses the fourth argument of .createElement as the object that specifies how we want to animate the given UI element! If you're wondering what the nil in the third argument is for it just means that we're not passing any children into createElement, the same way we would do in a regular Roact element.

In this given example we're giving a target properties object to the whileHover event. What does this mean? It means that while you're hovering the button, its properties will tween towards the given values! This might be a bit confusing right now but you'll understand it once you see it in practice. Let's see an example:

```luau
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Roact = require(ReplicatedStorage.Packages.roact) --Use whatever path you have for your Roact
local RoactMotion = require(ReplicatedStorage.RoactMotion)(Roact) --Replace ReplicatedStorage.RoactMotion with whatever path you need

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
		}
	})
}), Players.LocalPlayer.PlayerGui, "TestGUI")
```

<img src="https://cdn.discordapp.com/attachments/670023265455964198/1049440858488983583/ExpandingButton.gif" alt="drawing" width="800"/>

Wow! So little changes and we already have a button expanding whenever we hover it! However the animation looks awfully slow... But no worries, the same way you can change the TweenInfo in TweenService so can you in RoactMotion! All you need to do is create a transition object and feed it into the element. Let's see how to do that...

```luau
local transition : RoactMotion.Transition = RoactMotion.Transition.new()
transition.duration = 0.2
```
There's multiple properties that you can modify from the transition such as:

|Setting                   |Description                                                                                          |
|--------------------------|-----------------------------------------------------------------------------------------------------|
|duration              |How long it takes for the animation to play                           |
|delay              |How long it should wait until it plays                 |
|reverses   |If it should go back to its initial value      |
|repeatCount |How many times it should repeat |
|easingStyle         |The easing style it should use             |
|easingDirection          |The easing direction it should use                                       |

For now let's just reduce the duration to 0.1... So now that we have the transition object how do we feed it into the UI object? Simple! Just pass it as the transition in the animation object!

```luau
local transition : RoactMotion.Transition = RoactMotion.Transition.new()
transition.duration = 0.1

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
		transition = transition
	})
}), Players.LocalPlayer.PlayerGui, "TestGUI")
```
<img src="https://cdn.discordapp.com/attachments/670023265455964198/1049443013090345172/ExpandingButtonFaster.gif" alt="drawing" width="800"/>

Wow! This already feels so much better! Let's just explore a few more events and see them in action! 

Full example:

```luau
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Roact = require(ReplicatedStorage.Packages.roact) --Use whatever path you have for your Roact
local RoactMotion = require(ReplicatedStorage.RoactMotion)(Roact) --Replace ReplicatedStorage.RoactMotion with whatever path you need

local transition : RoactMotion.Transition = RoactMotion.Transition.new()
transition.duration = 0.2

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
	})
}), Players.LocalPlayer.PlayerGui, "TestGUI")
```

<img src="https://cdn.discordapp.com/attachments/670023265455964198/1049443968515051651/TestingButton.gif" alt="drawing" width="800"/>

You can find all the properties and events in the API.