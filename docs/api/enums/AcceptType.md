# AcceptType 🔗

This enum represents if a quest needs to be manually accepted or if it gets automatically added onto your quest log.

Example:
```luau
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local utility = require(ReplicatedStorage.ProQuest.utility)
local Quest = utility.Quest
local AcceptType = utility.AcceptType

local ExampleQuest : Quest.Quest = Quest.new()
ExampleQuest.ID = script.Name
ExampleQuest.name = "Example Quest!"
ExampleQuest.description = "Example description :)"

ExampleQuest.acceptType = AcceptType.NeedsAccept -- This

return ExampleQuest
```

| Name    | Description                              |
|---------|------------------------------------------|
|NeedsAccept    | Requires the ProQuest.give() functions to be called    |
|AutoAccept | Doesn't require a manual ProQuest.give(). It will give the quest to the user as soon as he meets all the requirements |