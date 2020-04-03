-- set the location of your me block relative to the computer
local meSide = "back"
local foodNamesPath = "food_names.csv"

-- get me system
local me = peripheral.wrap(meSide)
if me == null then
    error("me interface not found")
end

-- inventory = me.listAvailableItems()

-- for indx, stack in pairs(items) do
--     --print(stack["name"])
--     --print(stack["count"]
-- end

-- read csv with item names
local foodNames = {}
local foodNamesFile = fs.open(foodNamesPath, "r")
local line = foodNamesFile.readLine()

while line do
    table.insert(foodNames, line)
    line = foodNamesFile.readLine()
end

foodNamesFile.close()

-- compare required items with me inventory
for k, id in pairs(foodNames) do
    searchResult = me.findItems(id)
    if searchResult[1] then
        meta = searchResult[1].getMetaData()
        print(meta.name)
    end
end

print("done")