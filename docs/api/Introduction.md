---
displayed_sidebar: apiSidebar
id : "apiIntroduction"
sidebar_position: 1
---

# ❗Introduction 

Welcome to the ProQuest API! Here you can find detailed information about every single function, enum and class that exists in the library. It is recommended that you first look into the docs to learn how to use ProQuest and then checkout the API if you want additional information about an element in particular!

There are two versions of ProQuest, a Client and a Server version. The API separates these two.

<font size="5"> This code is server only </font> <img src="https://cdn.discordapp.com/attachments/670023265455964198/989173876829343784/ServerIcon.png" title="Server" width="35"/>

<div></div>
 
<font size="5"> This code is client only </font> <img src="https://cdn.discordapp.com/attachments/670023265455964198/989173877538185236/ClientIcon.png" title="Server" width="35"/>

:::tip

This library supports typed luau. You can enforce types by requiring the T.lua file under the main ProQuest file.

```luau
local T = require(ReplicatedStorage.ProQuest.T)
local ProQuest : T.ProQuestServer = require(ReplicatedStorage.ProQuest)
--or
local ProQuest : T.ProQuestClient = require(ReplicatedStorage.ProQuest)
```

:::