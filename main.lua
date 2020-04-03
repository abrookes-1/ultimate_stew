-- set the location of your me block relative to the computer
local meSide = "back"
--local meSide = "appeng_me_tileterminal_0"

local me = peripheral.wrap(meSide)

if me == null then
    error("me interface not found")
end

items = me.listAvailableItems()

for indx, stack in pairs(items) do
    print(stack["name"])
end


print("done")