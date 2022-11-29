# ObjectiveType 🔗

Quests might have required values to be achieved in order for it to be complete (see the following example).

These values can be of 3 different types, number, boolean or custom.

Example:
```luau
local utility = require(script.Parent.Parent.utility)

local ObjectiveType = utility.ObjectiveType

local TestQuest : Quest.Quest = Quest.new()
TestQuest.requiredData = {
    ["Apple"] = DataObjective.new("Apples", ObjectiveType.NumberType, 3),
    ["GoToVillage"] = DataObjective.new("Apples", ObjectiveType.BooleanType, false),
    ["ChangeName"] = DataObjective.new("Apples", ObjectiveType.Custom, "GoalName")
}

```

| Name    | Description                              |
|---------|------------------------------------------|
|NumberType    | The goal of the objective is of number type   |
|BooleanType | The goal of the objective is of boolean type |
|Custom | The goal of the objective can be of any type. Not recommended |