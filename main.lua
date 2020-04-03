-- set the location of your me block relative to the computer
local meSide = "back"
local chestSide = "top"
--local meSide = "appeng_me_tileterminal_0"

local me = peripheral.wrap(meSide)
local chest = peripheral.wrap(chestSide)

if me == null then
    error("me interface not found")
end


for k, item in pairs(chest.getAllStacks())do
    ae_info = me.getItemDetail(item.basic())
    amount = ae_info.basic().qty
    print(amount)
end