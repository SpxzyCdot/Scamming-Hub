local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Scamming Hub - Ninja Legends",
   LoadingTitle = "Loading...",
   LoadingSubtitle = "by someone",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "Scamming Hub - Ninja Legends",
      FileName = "Config"
   },
   KeySystem = false
})

local Farm = Window:CreateTab("Auto Farm", 4483345998)
local Misc = Window:CreateTab("Misc", 4483345998)

-- Auto Swing
local autoSwingEnabled = false
Farm:CreateToggle({
   Name = "Auto Swing",
   CurrentValue = false,
   Callback = function(Value)
      autoSwingEnabled = Value
      if Value then
         spawn(function()
            while autoSwingEnabled do
               task.wait()
               game:GetService("Players").LocalPlayer.ninjaEvent:FireServer("swingKatana")
            end
         end)
      end
   end
})

-- Auto Sell (teleport between sell areas)
local position1 = Vector3.new(99, 91246, 111)
local position2 = Vector3.new(76, 91246, 120)
local currentPosition = position1
local teleporting = false

Farm:CreateToggle({
   Name = "Auto Sell",
   CurrentValue = false,
   Callback = function(Value)
      teleporting = Value
      if Value then
         spawn(function()
            while teleporting do
               game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(currentPosition))
               task.wait(0.1)
               currentPosition = (currentPosition == position1) and position2 or position1
            end
         end)
      end
   end
})

-- Auto Rank
local ranks = {
   "Aether Genesis Master Ninja","Ancient Battle Legend","Ancient Battle Master","Apprentice","Assassin",
   "Awakened Scythe Legend","Awakened Scythemaster","Chaos Legend","Chaos Sensei","Comet Strike Lion",
   "Cybernetic Azure Sensei","Cybernetic Electro Legend","Cybernetic Electro Master","Dark Elements Blademaster",
   "Dark Elements Guardian","Dark Sun Samurai Legend","Dragon Evolution Form I","Dragon Evolution Form II",
   "Dragon Evolution Form III","Dragon Evolution Form IV","Dragon Evolution Form V","Dragon Master",
   "Dragon Warrior","Eclipse Series Soul Master","Elemental Legend","Elite Series Master Legend",
   "Eternity Hunter","Evolved Series Master Ninja","Golden Sun Shuriken Legend","Golden Sun Shuriken Master",
   "Grasshopper","Immortal Assassin","Infinity Legend","Infinity Sensei","Infinity Shadows Master",
   "Legendary Shadow Duelist","Legendary Shadowmaster","Lightning Storm Sensei","Master Elemental Hero",
   "Master Legend Assassin","Master Legend Sensei Hunter","Master Legend Zephyr","Master Ninja",
   "Master Of Elements","Master Of Shadows","Master Sensei","Mythic Shadowmaster","Ninja","Ninja Legend",
   "Rising Shadow Eternal Ninja","Rookie","Samurai","Sensei","Shadow","Shadow Chaos Assassin",
   "Shadow Chaos Legend","Shadow Legend","Shadow Storm Sensei","Skyblade Ninja Master",
   "Skystorm Series Samurai Legend","Starstrike Master Sensei","Ultra Genesis Shadow"
}

Farm:CreateToggle({
   Name = "Auto Rank",
   CurrentValue = false,
   Callback = function(Value)
      if Value then
         spawn(function()
            while task.wait(0.1) do
               for _, rank in ipairs(ranks) do
                  game:GetService("Players").LocalPlayer.ninjaEvent:FireServer("buyRank", rank)
               end
            end
         end)
      end
   end
})

-- Auto Buy Belts & Swords
local autoBuyBelt = false
Farm:CreateToggle({
   Name = "Auto Buy Belt",
   CurrentValue = false,
   Callback = function(Value)
      autoBuyBelt = Value
      if Value then
         spawn(function()
            while autoBuyBelt do
               game:GetService("Players").LocalPlayer.ninjaEvent:FireServer("buyAllBelts", "Blazing Vortex Island")
               task.wait(1)
            end
         end)
      end
   end
})

local autoBuySword = false
Farm:CreateToggle({
   Name = "Auto Buy Sword",
   CurrentValue = false,
   Callback = function(Value)
      autoBuySword = Value
      if Value then
         spawn(function()
            while autoBuySword do
               game:GetService("Players").LocalPlayer.ninjaEvent:FireServer("buyAllSwords", "Ground")
               task.wait(1)
            end
         end)
      end
   end
})

-- Misc Buttons
Misc:CreateButton({
   Name = "Unlock Every Island",
   Callback = function()
      local positions = {
         Vector3.new(80,766,-188),Vector3.new(-128,39439,173),Vector3.new(183,46010,36),
         Vector3.new(188,59594,24),Vector3.new(166,52607,34),Vector3.new(180,33206,28),
         Vector3.new(80,766,-118),Vector3.new(233,2013,331),Vector3.new(165,4047,51),
         Vector3.new(186,5656,76),Vector3.new(189,9284,31),Vector3.new(135,17686,61),
         Vector3.new(171,28255,39),Vector3.new(139,13680,74),Vector3.new(108,24069,84),
         Vector3.new(175,39317,25),Vector3.new(226,66669,15),Vector3.new(197,70271,7),
         Vector3.new(121,74461,88),Vector3.new(115,79762,61),Vector3.new(102,83199,150),
         Vector3.new(133,87050,72),Vector3.new(161,91244,39)
      }
      for _, pos in ipairs(positions) do
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
         task.wait(0.001)
      end
   end
})

Misc:CreateButton({
   Name = "Open Fortune Wheel (x1)",
   Callback = function()
      game:GetService("ReplicatedStorage").rEvents.openFortuneWheelRemote:InvokeServer("openFortuneWheel", workspace["Fortune Wheel"])
   end
})

Misc:CreateButton({ Name = "Unlock Inferno Element!",  Callback = function() game:GetService("ReplicatedStorage").rEvents.elementMasteryEvent:FireServer("Inferno") end })
Misc:CreateButton({ Name = "Unlock Frost Element!",     Callback = function() game:GetService("ReplicatedStorage").rEvents.elementMasteryEvent:FireServer("Frost") end })
Misc:CreateButton({ Name = "Unlock Lightning Element!", Callback = function() game:GetService("ReplicatedStorage").rEvents.elementMasteryEvent:FireServer("Lightning") end })
Misc:CreateButton({ Name = "Unlock Electral Chaos!",     Callback = function() game:GetService("ReplicatedStorage").rEvents.elementMasteryEvent:FireServer("Electral Chaos") end })
Misc:CreateButton({ Name = "Unlock Masterful Wrath!",    Callback = function() game:GetService("ReplicatedStorage").rEvents.elementMasteryEvent:FireServer("Masterful Wrath") end })
Misc:CreateButton({ Name = "Unlock Shadow Charge!",     Callback = function() game:GetService("ReplicatedStorage").rEvents.elementMasteryEvent:FireServer("Shadow Charge") end })
Misc:CreateButton({ Name = "Unlock Eternity Storm!",    Callback = function() game:GetService("ReplicatedStorage").rEvents.elementMasteryEvent:FireServer("Eternity Storm") end })
