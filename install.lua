local mainURL = "https://raw.githubusercontent.com/abrookes-1/ultimate_stew/master/main.lua"
local food_namesURL = "https://raw.githubusercontent.com/abrookes-1/ultimate_stew/master/food_names.csv"
local main

-- open main and write to file system
main = http.get(mainURL)
mainFile = main.readAll()

local file1 = fs.open("stew", "w")
file1.write(mainFile)
file1.close()

-- open csv and write to file system
food_names = http.get(food_namesURL)
food_namesFile = food_names.readAll()

local file2 = fs.open("food_names.csv", "w")
file2.write(food_namesFile)
file2.close()