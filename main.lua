-- set the location of your me block relative to the computer
local meSide = "left"

local me = peripheral.wrap(meSide)

if me == null then
    error("me block not found")
end


