local ComponentState = {
    None = 0,
    Hover = 1,
    Tap = 2,
}

table.freeze(ComponentState)

export type ComponentState = typeof(ComponentState)

return ComponentState 