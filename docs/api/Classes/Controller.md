---
displayed_sidebar: apiSidebar
sidebar_position: 2
title: Controller⭐
---

## Summary
The [``Controller``](Controller) is a class that allows you to play animations at run-time. It's specially useful if you want to run an animation with custom values that cannot be predicted.

:::caution
You must declare the variables that will be tweened within the default properties of the element or else it won't work due to a Roact limitation. If you plan to per example dynamically change the BackgroundColor3 in the future you should declare it at the start.

```luau
RoactMotion.createElement("Frame", {
    BackgroundColor3 = Color3.fromRgb(255, 255, 255)
})
```
:::

```luau
local controller : RoactMotion.Controller = RoactMotion.Controller.new()

RoactMotion.createElement("TextButton", {
    Position = UDim2.fromScale(0.5, 0.5),
}, nil {
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
    controller = controller
}}
```

## Constructors

|new(animationObject : ``{}``, transition : ``RoactMotion.Transition?``)|
|:----|
|Returns a new [``RoactMotion.Controller``](Controller)|

## Methods

### play
Plays the animation you wish with the given transition.

```luau
local controller : RoactMotion.Controller = RoactMotion.Controller.new()

RoactMotion.createElement("TextButton", {
    Position = UDim2.fromScale(0.5, 0.5),
}, nil {
    [RoactMotion.Event.onTap] = function()
        controller:play({
            Position = UDim2.fromScale(0.2, 0.2)    
        }, transition)
    end,
    controller = controller
}}
```
#### Parameters

animation : ``animation`` | The animation object with the target values
-|-
transition : [``RoactMotion.Transition?``](Transition)  | The transition which will be used for this specific animation
#### Returns
|``void`` |
|-|