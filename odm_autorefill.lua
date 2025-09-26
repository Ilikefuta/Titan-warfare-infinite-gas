local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Max values
local maxGas = 100
local maxBlades = 100
local gas = maxGas
local blades = maxBlades
local thunderSpearAvailable = true
local refillTime = 20 -- seconds

-- UI setup
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(0, 300, 0, 100)
statusLabel.Position = UDim2.new(0, 20, 0, 20)
statusLabel.BackgroundTransparency = 0.5
statusLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
statusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
statusLabel.TextScaled = true
statusLabel.Parent = screenGui

-- Function to update UI
local function updateUI()
    statusLabel.Text = "Gas: "..gas.."/"..maxGas.."\nBlades: "..blades.."/"..maxBlades.."\nThunder Spear: "..(thunderSpearAvailable and "Ready" or "Not Ready")
end

updateUI()

-- Input handling
local UIS = game:GetService("UserInputService")
UIS.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Space and gas >= 10 then
        gas = gas - 10
        print("Boost used! Gas left:", gas)
    elseif input.KeyCode == Enum.KeyCode.E and blades > 0 then
        blades = blades - 10
        print("Blade attack! Blades left:", blades)
    elseif input.KeyCode == Enum.KeyCode.Q and thunderSpearAvailable then
        thunderSpearAvailable = false
        print("Thunder Spear fired!")
    end
    updateUI()
end)

-- Auto-refill loop every 20 seconds
task.spawn(function()
    while true do
        task.wait(refillTime)
        gas = maxGas
        blades = maxBlades
        thunderSpearAvailable = true
        print("ODM Gear & Thunder Spear auto-refilled!")
        updateUI()
    end
end)        end
    end
end)
print("ODM Auto-refill script loaded")

local refillTime = 20
local tickCount = 0

-- Test loop
task.spawn(function()
    while true do
        task.wait(refillTime)
        tickCount += 1
        print("Refill #" .. tickCount .. " happened at " .. os.clock() .. " seconds")
    end
end)

-- Auto-refill timer (every 20 seconds)
task.spawn(function()
    while true do
        task.wait(20) -- wait 20 seconds
        gas = maxGas
        bladesDurability = maxBlades
        thunderSpearAvailable = true
        print("ODM Gear and Thunder Spear refilled!")
    end
end)
