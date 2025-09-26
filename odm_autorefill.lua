local UIS = game:GetService("UserInputService")

-- Max values
local maxGas = 100
local maxBlades = 100

-- Current values
local gas = maxGas
local bladesDurability = maxBlades
local thunderSpearAvailable = true
local thunderSpearCooldown = 5 -- seconds for normal firing

-- Input handling
UIS.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Space and gas >= 10 then
        print("Boost!")
        gas = gas - 10
    elseif input.KeyCode == Enum.KeyCode.E then
        if bladesDurability > 0 then
            print("Blade attack!")
            bladesDurability = bladesDurability - 10
        else
            print("Blades are broken!")
        end
    elseif input.KeyCode == Enum.KeyCode.Q then
        if thunderSpearAvailable then
            print("Thunder Spear fired!")
            thunderSpearAvailable = false
            -- Normal cooldown (optional)
            task.delay(thunderSpearCooldown, function()
                if thunderSpearAvailable == false then
                    print("Thunder Spear still on auto-refill timer...")
                end
            end)
        else
            print("Thunder Spear not ready yet!")
        end
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
