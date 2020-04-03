-- set the location of your me block relative to the computer
local meSide = "back"
local food_names_file = "food_names.csv"
--local meSide = "appeng_me_tileterminal_0"

os.loadAPI("csvConverter")
csvConverter.write(food_names, food_names_file)

local me = peripheral.wrap(meSide)

if me == null then
    error("me interface not found")
end

items = me.listAvailableItems()

for indx, stack in pairs(items) do
    --print(stack["name"])
    --print(stack["count"]
end

print(food_names[1][1])

print("done")