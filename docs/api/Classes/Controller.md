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

RoactMotion.createElement("TextButton", {
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