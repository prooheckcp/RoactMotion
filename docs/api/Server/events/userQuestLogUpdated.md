# ProQuest.userQuestLogUpdated ⚡



**Parameters:**

| Name     |Type      | Description                                     |
|----------|----------|-------------------------------------------------|
|player |``Player`` |  |
|questID|``string``| The arguments passed thru the network|
|updateType|[``UpdateType.UpdateType``](#ObjectiveType)| The arguments passed thru the network|
**Returns:**

| Name      | Type                 | Description |
|-----------|----------------------|---------|
|connection |[``Event.Connection``](#) | A connection that represents the event created. Allows you to disconnect the event at any point in the future|

**Example:**
```luau
--Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--Dependencies
local T = require(ReplicatedStorage.ProQuest.T)
local ProQuest : T.ProQuestServer = require(ReplicatedStorage.ProQuest)
local utility = require(ReplicatedStorage.ProQuest.utility)

local UpdateType = utility.UpdateType

function questLogUpdated(player : Player, questID : string, updateType : UpdateType.UpdateType)

end

ProQuest.userQuestLogUpdated:Connect(questLogUpdated)
```