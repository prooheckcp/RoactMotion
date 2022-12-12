---
displayed_sidebar: apiSidebar
sidebar_position: 3
title: Transition⭐
---

## Summary
The [``Transition``](Transition) is a class that contains information about how the UI element will tween to its target value.


```luau
local transition : RoactMotion.Transition = RoactMotion.Transition.new()
transition.duration = 0.2
```

## Constructors

|new(animationObject : ``{}``, Transition : ``RoactMotion.Transition?``)|
|:----|
|Returns a new [``RoactMotion.Transition``](Transition)|

## Properties

|Type| Description| Default|
|:---|:---|:---|
|duration : number \| {number} | How long it should take to tween between each keypoint|1|
|easingStyle : Enum.EasingStyle| The easing style to be used|Enum.EasingStyle.Linear|
|easingDirection : Enum.EasingDirection| The easing direction to be used|Enum.EasingDirection.InOut|
|delay : number| How long it will take until it starts|0|
|reverses : number| If it should go back once it reaches the target value to its initial value|false|
|repeatCount : number| How many times it should repeat the animation (only works with reverses on)|1|

## Events

### completed

Fired when the animation completes playing.

**Code Samples**
```luau
local transition : RoactMotion.Transition = RoactMotion.Transition.new()
transition.duration = 0.1
transition.easingStyle = Enum.EasingStyle.Linear
transition.easingDirection = Enum.EasingDirection.InOut
transition.repeatCount = 1

transition.reachedKeypoint:Connect(function(keyPointIndex : number)
    print("Reached the following keypoint: ", keyPointIndex)
end)

task.delay(5, function()
    animation:play()
end)
```

### reachedKeypoint

Fired when the animation reaches the next keypoint.

**Code Samples**
```luau
local transition : RoactMotion.Transition = RoactMotion.Transition.new()
transition.duration = 0.1
transition.easingStyle = Enum.EasingStyle.Linear
transition.easingDirection = Enum.EasingDirection.InOut
transition.repeatCount = 1

transition.completed:Connect(function()
    print("My animation finished!")
end)

task.delay(5, function()
    animation:play()
end)
```