local mainURL = "https://raw.githubusercontent.com/abrookes-1/ultimate_stew/master/main.lua"
local mainURL = "https://raw.githubusercontent.com/abrookes-1/ultimate_stew/master/food_names.csv"
local main

-- open main and write to file system
main = http.get(mainURL)
mainFile = main.readAll()

local file1 = fs.open("stew", "w")
file1.write(mainFile)
file1.close()
