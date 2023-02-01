--[[
    Event system written by @Prooheckcp
]]

export type Connection = {Disconnect : (self : Connection) -> nil}
export type Callback = {(callback : any) -> any}

local Event : Event = {}
Event.__index = Event
Event.attachedCallbacks = nil :: {Callback}
Event.attachedMiddleware = nil :: {Callback}

function Event.new() : Event
    local self = setmetatable({}, Event)
    self.attachedCallbacks = {}
    self.attachedMiddleware = {}
    self.new = nil

    return self
end

function Event:AddMiddleWare(callback : Callback)
    table.insert(self.attachedMiddleware, callback)
end

function Event:Fire(...) : nil
    for _, callback : Callback in pairs(self.attachedCallbacks) do
        pcall(callback, ...)
    end
end

function Event:Connect(callback : Callback) : Connection
    if typeof(callback) ~= "function" then
        return error("Callbacks must be of type: function!", 3)
    end

    for _, middleWareCallback : Callback in pairs(self.attachedMiddleware) do
        task.spawn(middleWareCallback)
    end

    local attachedCallbacks : {Callback} = self.attachedCallbacks
    table.insert(attachedCallbacks, callback)

    local connection : Connection = {}

    function connection:Disconnect()
        for index, _callback in pairs(attachedCallbacks) do
            if _callback == callback then
                table.remove(attachedCallbacks, index)
                break
            end 
        end
    end

    function connection:Destroy()
        self:Disconnect()
    end
    
    return connection
end

export type Event = typeof(Event)

return Event