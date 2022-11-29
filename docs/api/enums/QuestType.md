# QuestType 🔗

This enum represents how often can a given quest be repeated.

Example:
```luau
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local utility = require(ReplicatedStorage.ProQuest.utility)
local Quest = utility.Quest
local QuestType = utility.QuestType

local ExampleQuest : Quest.Quest = Quest.new()
ExampleQuest.ID = script.Name
ExampleQuest.name = "Example Quest!"
ExampleQuest.description = "Example description :)"

ExampleQuest.questType = QuestType.Repeatable -- This

return ExampleQuest
```

| Name      | Description                              |
|-----------|------------------------------------------|
|Repeatable |Can be repeated non-stop     |
|Normal     | Can only be done once |
|Daily      | Can be repeated once per day (every 16 hours) |
|Custom     | Can be repeated every x amount of time |