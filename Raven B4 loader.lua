--[[
██████╗  █████╗ ██╗   ██╗███████╗███╗   ██╗    ██████╗ ██╗  ██╗
██╔══██╗██╔══██╗██║   ██║██╔════╝████╗  ██║    ██╔══██╗██║  ██║
██████╔╝███████║██║   ██║█████╗  ██╔██╗ ██║    ██████╔╝███████║
██╔══██╗██╔══██║╚██╗ ██╔╝██╔══╝  ██║╚██╗██║    ██╔══██╗╚════██║
██║  ██║██║  ██║ ╚████╔╝ ███████╗██║ ╚████║    ██████╔╝     ██║
╚═╝  ╚═╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝╚═╝  ╚═══╝    ╚═════╝      ╚═╝
Author: Near (or nea.r)
Language: Lua
Category: Loader

*If you do use my code, give credits to me!*
]]

assert(not shared.Injected,"Raven B4 is already injected")
shared.Injected = true
local inbedwars, inskywars, inbladeball, inpetsim99 = false, false, false, false
local bedwarsids = {6872265039,6872274481,8444591321,8560631822}
local skywarsids = {8768229691,8542259458,8951451142,8592115909}
local bladeballids = {13772394625,15144787112,15234596844,14915220621}
local lib = {}
if not isfolder("RavenB4") then
    makefolder("RavenB4")
end
if not isfolder("RavenB4/Config") then
    makefolder("RavenB4/Config")
end
if table.find(bedwarsids,game.PlaceId) then
    inbedwars = true
    shared.FileName = "RavenB4/Config/Bedwars.json"
elseif table.find(skywarsids,game.PlaceId) then
    inskywars = true
    shared.FileName = "RavenB4/Config/Skywars.json"
elseif table.find(bladeballids,game.PlaceId) then
    inbladeball = true
    shared.FileName = "RavenB4/Config/Bladeball.json"
else
    lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/NearB4/Raven-B4-for-Roblox/main/GUI/Raven%20B4%20GUI.lua"))() 
    lib:createnotification("Game not Supported!",2,"No Support!",0.5) --Universal soon!
end
if not isfile(shared.FileName) and shared.FileName ~= nil then
    writefile(shared.FileName,game:service('HttpService'):JSONEncode(""))
end
lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/NearB4/Raven-B4-for-Roblox/main/GUI/Raven%20B4%20GUI.lua"))() 

if inbedwars  then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NearB4/Raven-B4-for-Roblox/main/Games/Bedwars.lua"))()
elseif inskywars then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NearB4/Raven-B4-for-Roblox/main/Games/Bladeball.lua"))()
elseif inbladeball then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NearB4/Raven-B4-for-Roblox/main/Games/Skywars.lua"))()
end
local Codex = game:WaitForChild("CoreGui"):FindFirstChild("Codex")
if Codex then
    Codex:Destroy()
end
return lib
