# ProQuest.availableQuests 🟪
Given an array of x amount of quests this function will return
an array with all quests that can be accepted (from the given quests)

Works as a wrapper to .canUserAccept

**Parameters:**

| Name      |Type               | Description                    |
|-----------|-------------------|--------------------------------|
|player |``Player``         | The name of the signal         |
|questArray    |``{string}`` | An array of quest IDs that you want to check |

**Returns:**

| Name     |Type              | Description                 |
|----------|------------------|-----------------------------|
|availableQuests |``{string}``| An array of quest IDs |

**Example:**
```luau
local availableStatQuests : {string} = ProQuest.availableQuests(player, automaticQuests)
for _, questID : string in pairs(availableStatQuests) do
    ProQuest.give(player, questID)
end
```