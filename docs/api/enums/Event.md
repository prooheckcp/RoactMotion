# Event 🔗

This enum represents an event for a given UI object.
Example:
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
			Size = UDim2.fromOffset(150, 80)
		},
		
		[RoactMotion.Event.whileTap] = {
			Size = UDim2.fromOffset(80, 40)
		},
        
		[RoactMotion.Event.onTap] = function()
            print("Someone pressed me")
		end
	}),
```

| Name        | Description                              |
|-------------|------------------------------------------|
|onHoverEnd   | Calls a function when mouse leaves an object|
|onHoverStart | Calls a function when mouse enters an object|
|onTap        | Calls a function after pressing a button|
|onTapStart   | Calls a function when the mouse button is down|
|onTapEnd     | Calls a function when the mouse button is up |
|whileHover   | Called while the object is being hovered by the mouse|
|whileTap     | Called while the mouse button is holding the button|