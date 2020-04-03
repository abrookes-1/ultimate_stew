-- set the location of your me block relative to the computer
local meSide = "back"
local foodNamesPath = "food_names.csv"

-- api
os.loadAPI("lib/f")

-- monitor peripheral
local mon, monitor, monX, monY
monitor = f.periphSearch("monitor")

-- get me system
local me = peripheral.wrap(meSide)
if me == null then
    error("me interface not found")
end

-- read csv with item names
local foodNames = {}
local foodNamesFile = fs.open(foodNamesPath, "r")
local line = foodNamesFile.readLine()

while line do
    table.insert(foodNames, line)
    line = foodNamesFile.readLine()
end

foodNamesFile.close()





print("done")