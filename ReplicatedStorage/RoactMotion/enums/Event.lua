local Event = {
    onHoverEnd = "onHoverEnd",
    onHoverStart = "onHoverStart",
    onTap = "onTap",
    onTapStart = "onTapStart",
    onTapEnd = "onTapEnd",
    whileHover = "whileHover",
    whileTap = "whileTap",
}

table.freeze(Event)

export type Event = typeof(Event)

return Event 