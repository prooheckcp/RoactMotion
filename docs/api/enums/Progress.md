# Progress 🔗

:::tip

If you still haven't received and or accepted a quest it simply won't be in the quest inventory. 

There is no progress enum to identify this scenario, you should instead check if the quest exists.

:::

Simple enum to check the current progress of a quest.

Example:
```luau
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local utility = require(ReplicatedStorage.ProQuest.utility)
local Progress = utility.Progress

local function compareEnum(progress : Progress.Progress)
    if progress == Progress.Completed then
        --do something
    end
end
```

| Name    | Description                              |
|---------|------------------------------------------|
|InProgress    | It means the quest has been accepted but is still in progress    |
|Completed | It means the quest has been completed |
|Delivered | The quest has not only been completed but also delivered |