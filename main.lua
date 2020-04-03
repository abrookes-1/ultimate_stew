-- set the location of your me block relative to the computer
local meSide = "back"
local foodNamesPath = "food_names.csv"

-- api
os.loadAPI("lib/f")

-- monitor peripheral
local mon, monitor, monX, monY
monitor = f.periphSearch("monitor")

if monitor == null then
	error("No valid monitor was found")
end

mon = {}
monX, monY = monitor.getSize()
mon.monitor, mon.X, mon.Y = monitor, monX, monY

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

-- compare required items with me inventory
local currentInventory = {}

for k, id in pairs(foodNames) do
    searchResult = me.findItems(id)
    if searchResult[1] then
        meta = searchResult[1].getMetadata()
        currentInventory[id] = meta.count
    else
        currentInventory[id] = 0
    end
end




-- print to monitor
for id, count in pairs(currentInventory) do
    f.draw_text_lr(mon, 2, 19, 1, id, count, colors.gray, colors.gray, colors.black)
end

f.scrollText(mon.monitor, foodNames, 5)

print("done")