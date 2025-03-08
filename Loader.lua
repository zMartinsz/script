repeat
	task.wait()
until game:IsLoaded()

makefolder("ScyllaKey")
local key_path = "SycllaKey/Key.txt"
script_key = script_key or isfile(key_path) and readfile(key_path) or nil

local Cloneref = cloneref or clonereference or function(instance)
	return instance
end
local Players, HttpService = Cloneref(game:GetService("Players")), Cloneref(game:GetService("HttpService"))
local Request = http_request or request or syn.request or http
local UI = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local API = loadstring(game:HttpGet("https://sdkAPI-public.luarmor.net/library.lua"))()
if game.placeId == 8075399143 then
    API.script_id = "38bc18fab08ad4249ddfb77f69dbff8d"
elseif game.placeId == 9164271501 then
    API.script_id = "ef9455c5229388090b6d981daf114ff8"
else
    game.Players.LocalPlayer:Kick("Scylla doesn't support this game | Join our discord for more information")
end

local function notify(title, content, duration)
	UI:Notify({ Title = title, Content = content, Duration = duration or 8 })
end

local function checkKey(input_key)
	local status = API.check_key(input_key or script_key)
	if status.code == "KEY_VALID" then
		script_key = input_key or script_key
		writefile(key_path, script_key)
		API.load_script()
        repeat
            task.wait()
        until UI:Destroy()
	elseif status.code:find("KEY_") then
		local messages = {
			KEY_HWID_LOCKED = "Key linked to a different HWID. Please reset it using our bot",
			KEY_INCORRECT = "Key is incorrect",
			KEY_INVALID = "Key is invalid",
		}
		notify("Key Check Failed", messages[status.code] or "Unknown error")
	else
		Players.LocalPlayer:Kick("Key check failed: " .. status.message .. " Code: " .. status.code)
	end
end

if script_key then
	checkKey()
end

checkKey()


Input.Value = "wrzvoDoiRMMAHFBUfQqbXCFCIBfKInSJ"
checkKey(Input.Value)

Window:SelectTab(1)
notify("Scylla", "Loader Has Loaded Successfully")

repeat
	task.wait()
until getgenv().ScyllaKey
UI:Destroy()
