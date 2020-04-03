local mainURL = "https://raw.githubusercontent.com/abrookes-1/ultimate_stew/master/main.lua"
local food_namesURL = "https://raw.githubusercontent.com/abrookes-1/ultimate_stew/master/food_names.csv"
local functions = "https://raw.githubusercontent.com/abrookes-1/ultimate_stew/master/lib/f.lua"

urls = {
    "stew": mainURL,
    "food_names.csv": food_namesURL,
    "lib/f": functions
}

for path, url in pairs(urls) do
    ret = http.get(url)
    contents = ret.readAll()
    file = fs.open(path, "w")
    file.write(contents)
    file.close()
end
