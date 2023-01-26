![](https://cdn.discordapp.com/attachments/670023265455964198/1049428396461002872/RoactMotionTransparent.png)

[Documentation](https://prooheckcp.github.io/RoactMotion/) | [Source](https://github.com/prooheckcp/RoactMotion)

## Introduction

After such a long time without any alternative for flipper when it comes to properly animating UI inside of Roact I've decided to make a proper alternative that gives you more freedom of choice and a more friendly way of organizing and managing your code!

Want to use features from the TweenService such as EasingDirection and EasingStyle? With RoactMotion you can implement such things to your UI!

In this simple post, I'll be showing you a simple example of how simple it is to use RoactMotion. If you wish to learn how to use it properly feel free to read the tutorial written on its documentation website right here: https://prooheckcp.github.io/RoactMotion/.

## Example

One of the main perks of RoactMotion is that allows you to integrate animations on already existing interfaces. Let's imagine you create the following interface and now you want to somehow animate this simple button at the middle of your screen.

Code:
```lua
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

<img src="https://cdn.discordapp.com/attachments/670023265455964198/1049437452340834375/image.png" width="500" height="500" />

But now you want to give some life to it, you can do this by simply requiring RoactMotion, replacing the word "Roact" for "RoactMotion" on the element you wish to animate and you're ready to go!

```lua
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

Ok but now that we have this, how do we animate it? There's multiple ways of doing so and you can find detailed information about them in the documentation website which has already been previously linked. Here we're going to show one of the simplest ways of adding your animation into it and see how it looks like!

```lua
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
This should make it change size while you're holding it and while you're hovering it!

<img src="https://cdn.discordapp.com/attachments/670023265455964198/1049443968515051651/TestingButton.gif" width="500" height="500" />

It's as simple as that! You can also add information to the transition such as duration, easingStyle, easingDirection, and events to detect when they ended!

Here's a few things done 100% with RoactMotion with little to no code!

<img src="https://cdn.discordapp.com/attachments/670023265455964198/1049449218508607508/CubeMoving.gif" width="500" height="500" />

<img src="https://cdn.discordapp.com/attachments/670023265455964198/1049454216567066655/RandomCube.gif" width="500" height="500" />

## Fun Facts
- RoactMotion was a mixture between TweenService, FrameMotion (a react library), and Flipper.
- It was developed by Prooheckcp for a personal project that relays on React
- Main purpose was to have an easy way of making complex animations

## Disclamer
RoactMotion is still in beta and a lot of changes are going to happen. You can already use it in production as the syntax will remain the same in the future, however, bugs are to be expected and tackled down as development goes.

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)