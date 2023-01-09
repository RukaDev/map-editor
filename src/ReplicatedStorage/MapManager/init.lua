--[[

Map Manager

Next plans:
	Decouple styles
	Styles shouldn't be necessary to run the map
	They should be set up seperately
]]


-- Workspace
local map = game.Workspace.Map
local miscDataScript = map.Data.Misc
local templateDataScript = map.Data.Templates
local TemplateContainer = map.Assets.Container
local MiscContainer = map.Assets.Misc
local assets = script.Assets

-- Scripts
local ObjectManager = require(script.Scripts.ObjectManager)
local Config = require(script.Scripts.Config)

-- Dependencies
local Repr = require(script.Dependencies.Repr)

-- Util
local ModuleUtil = require(script.Util.Module)

local function storeGround(ground, folderName) 
	local tb = {}

	for _, part in pairs(ground:GetChildren()) do
		--local convertedName = ObjectManager.getIndex(folderName, part.Name, "Normal")
		local convertedName = part.Name

		if not tb[convertedName] then
			tb[convertedName] = {}
		end
		local objectCFrame = ground.CFrame:ToObjectSpace(part.CFrame)
		table.insert(tb[convertedName], objectCFrame)
	end

	return tb
end

local function storeFolder(folders)
	for _, folder in pairs(folders) do
		local result = {}
		
		for i, ground in pairs(folder:GetChildren()) do
			result[tostring(i)] = storeGround(ground, folder.Name)
		end
		
		templateDataScript[folder.Name].Source = "return " .. Repr(result)
	end
end

local function clearMap()
	TemplateContainer:ClearAllChildren()
	MiscContainer:ClearAllChildren()
end


local module = {}

function module.setLayout(name, idx)
	if name and idx then
		local file = templateDataScript[name]
		local template = game.Workspace.Templates[name]
		local tb = loadstring(file.Source)()
		
		tb[tostring(idx)] = storeGround(template[tostring(idx)], name)
		file.Source = "return " .. Repr(tb)
	elseif name then
		storeFolder({game.Workspace.Templates[name]})
	else
		storeFolder(game.Workspace.Templates:GetChildren())
	end
end


function module.save()
	local TemplateData = require(templateDataScript:Clone())
	local map = {}
	for _, ground in pairs(TemplateContainer:GetChildren()) do
		map[ground.Position] = {}

		local tb = table.create(#Config.order, 0) -- 0 means no template there
		for _, folder in pairs(ground:GetChildren()) do
			local index = table.find(Config.order, folder.Name)
			tb[index] = folder:GetAttribute("Value")
		end

		map[ground.Position].template = tb
		map[ground.Position].isServer = true
		map[ground.Position].ground = "Ground"
	end

	
	clearMap()
	TemplateData.Source = "return " .. Repr(map)
end

function module.load()
	local TemplateData = require(templateDataScript:Clone())
	clearMap()

	local modules = ModuleUtil.mapChildren(templateDataScript)

	for position, info in pairs(TemplateData) do 
		local ground = assets.Terrain[info.ground]:Clone()
		ground.Position = position 

		for i, val in pairs(info.template) do
			if val ~= 0 then

				local folderName = Config.order[i]
				local layout = modules[folderName][val]

				local f = Instance.new("Folder")
				f:SetAttribute("Value", val)
				f.Name = folderName 
				
				print(layout)
				for partName, cfTable in pairs(layout) do 
					--local convertedName = ObjectManager.getName(partName, folderName, "Normal")
					print(partName, cfTable)
					local convertedName = partName

					for _, cf in pairs(cfTable) do 
						local p = assets[folderName][convertedName]:Clone()
						p.CFrame = CFrame.new(position) * cf 
						p.Anchored = true 
						p.Parent = f 
					end
				end
				f.Parent = ground
			end
		end

		ground.Parent = TemplateContainer
	end
end

return module

		