# DeliverType 🔗

This enum represents if a quest needs to be manually delivered or if it gets automatically completed once you meet all the requirements.

Example:
```luau
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local utility = require(ReplicatedStorage.ProQuest.utility)
local Quest = utility.Quest
local DeliverType = utility.DeliverType

local ExampleQuest : Quest.Quest = Quest.new()
ExampleQuest.ID = script.Name
ExampleQuest.name = "Example Quest!"
ExampleQuest.description = "Example description :)"

ExampleQuest.deliverType = DeliverType.NeedsDeliver -- This

return ExampleQuest
```

| Name    | Description                              |
|---------|------------------------------------------|
|NeedsDeliver    | Requires ProQuest.Deliver to be called    |
|AutoComplete | If the quest is already complete it will automatically deliver it |