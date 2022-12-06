---
displayed_sidebar: apiSidebar
sidebar_position: 1
title: Animation⭐
---

## Summary
The ``Animation`` is a class that contains information about how we want our Roact element to be animated. You specify the target values you'll be wanting and the transition that it should use for these.

```luau
local transition : RoactMotion.Transition = RoactMotion.Transition.new()
transition.duration = 0.2

local animation : RoactMotion.Animation = RoactMotion.Animation.new({
    Position = UDim2.fromScale(0.2 ,0.2)    
}, transition)
```

## Constructors

|new(animationObject : ``{}``, transition : ``RoactMotion.Transition?``)|
|:----|
|Returns a new ``RoactMotion.Animation`` form the given animation object and transition|

## Methods

## play
Plays the animation you wish. Can be called from anywhere.

```luau
local animation : RoactMotion.Animation = RoactMotion.Animation.new({
    Position = UDim2.fromScale(0.2 ,0.2)    
})

RoactMotion.createElement("TextButton", {
        [RoactMotion.Event.onTap] = function()
            animation:play()
        end,
}}
```
### Parameters

targetValue : ``number`` | In case any of the target values uses a function the first argument will tween towards this value
-|-
customValue : ``any``  | Pass any kind of custom value as the second argument to function mapping
### Returns
|``void`` |
|-|

## andThen