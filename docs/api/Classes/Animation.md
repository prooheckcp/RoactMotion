---
displayed_sidebar: apiSidebar
sidebar_position: 1
title: Animation⭐
---

## Summary
The [``Animation``](Animation) is a class that contains information about how we want our Roact element to be animated. You specify the target values you'll be wanting and the transition that it should use for these.

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
|Returns a new [``RoactMotion.Animation``](Animation) form the given animation object and transition|

## Properties

|||
|:---|:---|
|transition : [RoactMotion.Transition](Transition)|Specifies the transition settings on which the object should act upon|

## Methods

### play
Plays the animation you wish. Can be called from anywhere.

```luau
local animation : RoactMotion.Animation = RoactMotion.Animation.new({
    Position = UDim2.fromScale(0.2 ,0.2)    
})

RoactMotion.createElement("TextButton", {}, nil, {
    [RoactMotion.Event.onTap] = function()
        animation:play()
    end,
}}
```
#### Parameters

targetValue : ``number`` | In case any of the target values uses a function the first argument will tween towards this value
-|-
customValue : ``any``  | Pass any kind of custom value as the second argument to function mapping
#### Returns
|``void`` |
|-|



### andThen
Similar to .completed it gets called when the animation finishes playing, specially useful to chain animations.

```luau
local animation : RoactMotion.Animation = RoactMotion.Animation.new({
    Position = UDim2.fromScale(0.2 ,0.2)    
}):andThen(function()
    print("I got called at the end!")
end)
}}
```
#### Parameters

targetValue : ``function`` | Function to be called at the end of the animation
-|-
#### Returns
|``void`` |
|-|




## Events

### completed

Fired when the animation completes playing.

**Code Samples**
```luau
local animation : RoactMotion.Animation = RoactMotion.Animation.new({
    Position = UDim2.fromScale(0.2 ,0.2)    
})

animation.completed:Connect(function()
    print("My animation finished!")
end)

task.delay(5, function()
    animation:play()
end)
```