---
displayed_sidebar: docsSidebar
sidebar_position: 1
---

:::info
This Guide assumes you've already installed Roact Motion, make sure to install it before moving forward!
:::

Roact Motion was designed to work with your existing UI! Let's start by making a simple button on the middle of your screen and then move along with it as we attempt to make it more interactable! Let's start with this...

```luau
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Roact = require(ReplicatedStorage.Packages.roact) --Use whatever path you have for your Roact

Roact.mount(Roact.createElement("ScreenGui", {}, {
    Roact.createElement("TextButton", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(100, 50),
        Text = "Hello world!",
        BackgroundTransparency = 0,
    }, 
    nil)
}), Players.LocalPlayer.PlayerGui, "TestGUI")
```

When you run your game this will simply place a TextButton at the middle of your screen as seen below.

<img src="https://cdn.discordapp.com/attachments/670023265455964198/1049437452340834375/image.png" alt="drawing" width="800"/>

Pretty boring so far isn't it? Now that we finally set our UI it is time to import RoactMotion into your code! To do so you will need to give it a reference to Roact, add a line just as the following:

```luau
local RoactMotion = require(ReplicatedStorage.RoactMotion)(Roact) --Replace ReplicatedStorage.RoactMotion with whatever path you need
```

Now that we have RoactMotion imported all you have to do is replace Roact.createElement with RoactMotion.createElement! This works for any kind of Roact.Element that you want.

Final code example:

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

And that's everything you need to know to setup RoactMotion! Make sure to keep this code example as it will be used to teach you the next steps about RoactMotion.