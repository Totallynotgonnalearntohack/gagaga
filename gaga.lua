local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:wait()
local Humanoid = char:WaitForChild("Humanoid")
local runService = game:GetService("RunService")
local RootPart = char.HumanoidRootPart

local LagAmount = 20 -- Default lag amount in milliseconds
local maxLag = 100 -- Maximum allowed lag in milliseconds

local function UpdateLag()
	while runService.Stepped:wait() do
		if RootPart.Position.Magnitude > 0 then
			wait(LagAmount/1000)
		end
	end
end

local function OnValueChanged(value)
	LagAmount = value
end

local GUI = script.Parent:WaitForChild("LagGUI")
local Slider = GUI.Slider
Slider.Value = LagAmount
Slider.ValueChanged:connect(OnValueChanged)

UpdateLag()
