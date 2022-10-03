local this = {}

-- Set to true if you want to play Robloxian 2.0 in Play Solo
PSR2ByDefault = false
globalscripttype = nil

function this:Name()
	return "CharacterCommands"
end

-- checks if the script is enabled based on Script, Client, or some other reason
-- arguments: Script - returns the script type name (Server, Solo, Studio), Client - returns the Client name.
function this:IsEnabled(Script, Client)
	return true
end

-- executes before the game starts (server, solo, studio)
-- arguments: Script - returns the script type name (Server, Solo, Studio), Client - returns the Client name.
function this:PreInit(Script, Client)
    globalscripttype = Script
end

-- executes after the game starts (server, solo, studio)
-- arguments: none
function this:PostInit()
    
LeftArmMesh = Instance.new("SpecialMesh") LeftArmMesh.MeshId = "http://novetus.me/asset?id=27111419" LeftArmMesh.Name = "LeftArmMesh" 
LeftLegMesh = Instance.new("SpecialMesh") LeftLegMesh.MeshId = "http://novetus.me/asset?id=27111857" LeftLegMesh.Name = "LeftLegMesh" 
RightArmMesh = Instance.new("SpecialMesh") RightArmMesh.MeshId = "http://novetus.me/asset?id=27111864" RightArmMesh.Name = "RightArmMesh" 
RightLegMesh = Instance.new("SpecialMesh") RightLegMesh.MeshId = "http://novetus.me/asset?id=27111882" RightLegMesh.Name = "RightLegMesh" 
TorsoMesh = Instance.new("SpecialMesh") TorsoMesh.MeshId = "http://novetus.me/asset?id=27111894" TorsoMesh.Name = "TorsoMesh" 
--MonsterMash = Instance.new("Animation") MonsterMash.AnimationId = "http://novetus.me/asset?id=35654637" MonsterMash.Parent = game.Lighting MonsterMash.Name = "MonsterMash"
--MonsterMashSong = Instance.new("Sound") MonsterMashSong.SoundId = "http://novetus.me/asset?id=35930009" MonsterMashSong.Looped = true MonsterMashSong.Name = "mmsong"
end

-- executes every 0.1 seconds. (server, solo, studio)
-- arguments: none
function this:Update()
end

-- executes after a character loads (server, solo, studio)
-- arguments: Player - Player getting a character loaded, Appearance - The object containing the appearance values 
-- notes: in play solo, you may have to respawn once to see any print outputs.
function this:OnLoadCharacter(Player, Appearance)
    if globalscripttype == "Solo" then if PSR2ByDefault == true then roblofy(Player) end end
    if Player.Robloxian2.Value == true then roblofy(Player) end
end

function onChatted(msg, player)
thing = player.Robloxian2
print("test")
if msg == "!r2" then
thing.Value = true
roblofy(player)
end

if msg == "!rclassic" then
thing.Value = false
unroblofy(player)
end

if msg == "!rdance" then
dance(1, player)
end

if msg == "!rdance2" then
dance(2, player)
end

end

function this:OnPlayerAdded(Player)
    print("test")
    if not Player:FindFirstChild("Robloxian2") then
        thing = Instance.new("BoolValue")
        thing.Name = "Robloxian2"
        thing.Value = false
        thing.Parent = Player
    end
    if not Player:FindFirstChild("IsDancing") then
        thing2 = Instance.new("BoolValue")
        thing2.Name = "IsDancing"
        thing2.Value = false
        thing2.Parent = Player
    end
    Player.Chatted:connect(function(msg) onChatted(msg, Player) end) 
end

function dance(num, player)
   if num == 2 then
    if player.IsDancing.Value == true then return end
    player.IsDancing.Value = true
    dancer = player.Character.Humanoid:LoadAnimation(game.Lighting.MonsterMash)
    dancer:Play()
	MonsterMashSong:Clone().Parent = player.Character.Head
    player.Character.Head.mmsong:Play()
	wait(11)
	player.Character.Head.mmsong:Stop()
	dancer:Stop()
    player.Character.Head.mmsong.Parent = nil
	dancer:remove()
    player.IsDancing.Value = false
    script.Parent = nil
   end
end

function roblofy(player)
local h = player.Character:FindFirstChild("Humanoid")
if h~=nil then
	local torso = h.Parent:FindFirstChild("Torso")
	local rightarm = h.Parent:FindFirstChild("Right Arm")
	local leftarm = h.Parent:FindFirstChild("Left Arm")
	local rightleg = h.Parent:FindFirstChild("Right Leg")
	local leftleg = h.Parent:FindFirstChild("Left Leg")

	if torso ~= nil then
		if torso:FindFirstChild("TorsoMesh") ~= nil then
			torso:FindFirstChild("TorsoMesh"):Remove()
		end
		TorsoMesh:clone().Parent = torso
	end

	if rightarm ~= nil then
		if rightarm:FindFirstChild("RightArmMesh") ~= nil then
			rightarm:FindFirstChild("RightArmMesh"):Remove()
		end
		RightArmMesh:clone().Parent = rightarm
	end

	if leftarm ~= nil then
		if leftarm:FindFirstChild("LeftArmMesh") ~= nil then
			leftarm:FindFirstChild("LeftArmMesh"):Remove()
		end
		LeftArmMesh:clone().Parent = leftarm
	end

	if rightleg ~= nil then
		if rightleg:FindFirstChild("RightLegMesh") ~= nil then
			rightleg:FindFirstChild("RightLegMesh"):Remove()
		end
		RightLegMesh:clone().Parent = rightleg
	end

	if leftleg ~= nil then
		if leftleg:FindFirstChild("LeftLegMesh") ~= nil then
			leftleg:FindFirstChild("LeftLegMesh"):Remove()
		end
		LeftLegMesh:clone().Parent = leftleg
	end

end

end

function unroblofy(player)

local h = player.Character:findFirstChild("Humanoid")
	if h~=nil then
		local torso = h.Parent:FindFirstChild("Torso")
		local rightarm = h.Parent:FindFirstChild("Right Arm")
		local leftarm = h.Parent:FindFirstChild("Left Arm")
		local rightleg = h.Parent:FindFirstChild("Right Leg")
		local leftleg = h.Parent:FindFirstChild("Left Leg")

		if torso ~= nil then
			if torso:FindFirstChild("TorsoMesh") ~= nil then
				torso:FindFirstChild("TorsoMesh"):Remove()
			end
		end

		if rightarm ~= nil then
			if rightarm:FindFirstChild("RightArmMesh") ~= nil then
				rightarm:FindFirstChild("RightArmMesh"):Remove()
			end
		end

		if leftarm ~= nil then
			if leftarm:FindFirstChild("LeftArmMesh") ~= nil then
				leftarm:FindFirstChild("LeftArmMesh"):Remove()
			end
		end

		if rightleg ~= nil then
			if rightleg:FindFirstChild("RightLegMesh") ~= nil then
				rightleg:FindFirstChild("RightLegMesh"):Remove()
			end
		end

		if leftleg ~= nil then
			if leftleg:FindFirstChild("LeftLegMesh") ~= nil then
				leftleg:FindFirstChild("LeftLegMesh"):Remove()
			end
		end

	end

end

-- DO NOT REMOVE THIS. this is required to load this addon into the game.

function AddModule(t)
	print("AddonLoader: Adding " .. this:Name())
	table.insert(t, this)
end

_G.CSScript_AddModule=AddModule
