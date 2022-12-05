---
displayed_sidebar: docsSidebar
sidebar_position: 5
title: Controllers
---

We're almost done with the basics... There's only 1 more thing that you should be aware of! And that one thing is controllers. The same way we created transitions and animations you can also create 1 controller to manage animations at run-time. Let's start by creating a controller!

```luau
local controller : RoactMotion.Controller = RoactMotion.Controller.new()
```
Remember how we fed the previous elements into our RoactMotion element? Well it's basically the same way!

```luau
	RoactMotion.createElement("Frame", {
		Size = UDim2.fromOffset(50, 50),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.2),
	}, nil, {
		animate = {animation},
		controller = controller --Give him the controller like this!
	})
```

For this example we'll make the cube move to a random position in our UI! Here's the example code...

```luau
local controller : RoactMotion.Controller = RoactMotion.Controller.new()

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
            --[[
                Here we generate some random coordinates and tell the cube to move to this target position
            ]]
			local rand = Random.new()
			local x = rand:NextNumber()
			local y = rand:NextNumber()
			controller:play({
				Position = UDim2.fromScale(x, y)	
			}, transition)
		end,
		transition = transition
	}),
	RoactMotion.createElement("Frame", {
		Size = UDim2.fromOffset(50, 50),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.2),
	}, nil, {
		animate = {animation},
		controller = controller
	})
}), Players.LocalPlayer.PlayerGui, "TestGUI")
```
<img src="https://cdn.discordapp.com/attachments/670023265455964198/1049454216567066655/RandomCube.gif" alt="drawing" width="800"/>

The whole purpose of controllers is to let us animate things that require parameters that change at run-time! And that's about it, this is all you need to know to get started with Roact Motion. There's more details but you'll learn them along the way!