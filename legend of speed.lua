local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Scamming Hub - Legend of Speed",
   loadingTitle = "Loading...",
   loadingSubtitle = "by someone",
   configurationSaving = {
      enabled = true,
      folderName = "Scamming Hub - Legend of Speed",
      fileName = "Config"
   },
   discord = {
      enabled = false
   },
   keySystem = false
})

local Farm = Window:CreateTab("Auto Farm", 4483345998)
local Misc = Window:CreateTab("Misc", 4483345998)
local Pets = Window:CreateTab("Pets", 4483345998)
local Crystals = Window:CreateTab("Crystals", 4483345998)

local XpFarmEnabled = false
local ohString1 = "collectOrb"
local ohString2 = "Yellow Orb"
local ohString3 = "City"

Farm:CreateToggle({
   Name = "Farm EXP",
   CurrentValue = false,
   Flag = "XpFarm",
   Callback = function(Value)
      XpFarmEnabled = Value
      if Value then
         spawn(function()
            while XpFarmEnabled do
               for i = 1, 100 do
                  game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(ohString1, ohString2, ohString3)
               end
               wait(0.1)
            end
         end)
      end
   end,
})

local OPXpFarmEnabled = false
ohString1 = "collectOrb"
ohString2 = "Yellow Orb"
ohString3 = "City"

Farm:CreateToggle({
   Name = "Farm EXP (STRONGER)",
   CurrentValue = false,
   Flag = "OPXpFarm",
   Callback = function(Value)
      OPXpFarmEnabled = Value
      if Value then
         spawn(function()
            while OPXpFarmEnabled do
               for i = 1, 200 do
                  game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(ohString1, ohString2, ohString3)
               end
               wait(0.1)
            end
         end)
      end
   end,
})

local GemFarmEnabled = false
ohString1 = "collectOrb"
ohString2 = "Infernal Gem"
ohString3 = "City"

Farm:CreateToggle({
   Name = "Farm Gems",
   CurrentValue = false,
   Flag = "GemFarm",
   Callback = function(Value)
      GemFarmEnabled = Value
      if Value then
         spawn(function()
            while GemFarmEnabled do
               for i = 1, 100 do
                  game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(ohString1, ohString2, ohString3)
               end
               wait(0.1)
            end
         end)
      end
   end,
})

local OPGemFarmEnabled = false
ohString1 = "collectOrb"
ohString2 = "Infernal Gem"
ohString3 = "City"

Farm:CreateToggle({
   Name = "Farm Gems (STRONGER)",
   CurrentValue = false,
   Flag = "OPGemFarm",
   Callback = function(Value)
      OPGemFarmEnabled = Value
      if Value then
         spawn(function()
            while OPGemFarmEnabled do
               for i = 1, 200 do
                  game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(ohString1, ohString2, ohString3)
               end
               wait(0.1)
            end
         end)
      end
   end,
})

local StepFarmEnabled = false
ohString1 = "collectOrb"
ohString2 = "Ethereal Orb"
ohString3 = "City"

Farm:CreateToggle({
   Name = "Farm Steps",
   CurrentValue = false,
   Flag = "StepFarm",
   Callback = function(Value)
        StepFarmEnabled = Value

        if StepFarmEnabled then
            spawn(function()
                while StepFarmEnabled do
                    for i = 1, 100 do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(ohString1, ohString2, ohString3)
                    end
                    
                    wait(0.1)
                end
            end)
        end
    end,
})

Farm:CreateToggle({
   Name = "Farm Steps (STRONGER)",
   CurrentValue = false,
   Flag = "StepFarmStrong",
   Callback = function(Value)
      StepFarmEnabled = Value
      if Value then
         spawn(function()
            while StepFarmEnabled do
               for i = 1, 200 do
                  game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(ohString1, ohString2, ohString3)
               end
               wait(0.1)
            end
         end)
      end
   end,
})

local AutoRebirthEnabled = false
ohString1 = "rebirthRequest"

Farm:CreateToggle({
   Name = "Auto Rebirth",
   CurrentValue = false,
   Flag = "AutoRebirth",
   Callback = function(Value)
      AutoRebirthEnabled = Value
      if Value then
         spawn(function()
            while AutoRebirthEnabled do
               game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer(ohString1)
               wait(0.1)
            end
         end)
      end
   end,
})

local petNames = {
   "Red Bunny",
   "Red Kitty",
   "Green Vampy",
   "Blue Bunny",
   "Dark Golem",
   "Silver Dog",
   "Pink Butterfly",
   "Purple Pegasus",
   "Yellow Squeak",
   "Yellow Butterfly",
   "Green Golem",
   "Golden Angel",
   "Orange Pegasus",
   "Divine Pegasus",
   "Golden Phoenix",
   "Orange Falcon",
   "Green Firecaster",
   "Blue Firecaster",
   "White Phoenix",
   "Red Phoenix",
   "Golden Viking",
   "Speedy Sensei",
   "Maestro Dog",
   "Red Firecaster",
   "Flaming Hedgehog",
   "Soul Fusion Dog",
   "Hypersonic Pegasus",
   "Dark Soul Birdie",
   "Eternal Nebula Dragon",
   "Shadow Edge Kitty",
   "Ultimate Overdrive Bunny"
}

local crystalNames = {
   "Red Crystal",
   "Blue Crystal",
   "Purple Crystal",
   "Lightning Crystal",
   "Snow Crystal",
   "Lava Crystal",
   "Inferno Crystal",
   "Electro Legends Crystal",
   "Jungle Crystal"
}

local selectedPet = ""
local selectedCrystal = ""

local autoDupe = false
local autoBuyCrystal = false

Crystals:CreateDropdown({
   Name = "Select Crystal",
   Options = crystalNames,
   CurrentOption = "Pick the Crystal you wish to buy",
   Flag = "CrystalDrop",
   Callback = function(Option)
      selectedCrystal = Option
      print("Selected crystal: " .. selectedCrystal)
   end,
})

Crystals:CreateButton({
   Name = "Buy Crystal",
   Callback = function()
      if selectedCrystal == "" then
         print("No crystal selected!")
         return
      end
      local ohString1 = "openCrystal"
      local ohString2 = selectedCrystal
      game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer(ohString1, ohString2)
      print("Buy Crystal button pressed for: " .. selectedCrystal)
   end,
})

Crystals:CreateToggle({
   Name = "Mass Buy Crystal",
   CurrentValue = false,
   Flag = "MassBuyCrystal",
   Callback = function(Value)
      autoBuyCrystal = Value
      if Value then
         spawn(function()
            while autoBuyCrystal do
               if selectedCrystal ~= "" then
                  local ohString1 = "openCrystal"
                  local ohString2 = selectedCrystal
                  game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer(ohString1, ohString2)
                  print("Mass buying crystal: " .. selectedCrystal)
               end
               wait(0.1)
            end
         end)
      end
   end,
})

Pets:CreateDropdown({
   Name = "Select Pet",
   Options = petNames,
   CurrentOption = "Pick the pet you wish to dupe",
   Flag = "PetDrop",
   Callback = function(Option)
      selectedPet = Option
      print("Selected pet: " .. selectedPet)
   end,
})

Pets:CreateButton({
   Name = "Dupe Pet",
   Callback = function()
      if selectedPet == "" then
         print("No pet selected!")
         return
      end
      local ohInstance1 = game:GetService("ReplicatedStorage").cPetShopFolder[selectedPet]
      if ohInstance1 then
         game:GetService("ReplicatedStorage").cPetShopRemote:InvokeServer(ohInstance1)
         print("Dupe Pet button pressed for: " .. selectedPet)
      else
         print("Pet not found in Pet Shop folder.")
      end
   end,
})

Pets:CreateToggle({
   Name = "Mass Dupe",
   CurrentValue = false,
   Flag = "MassDupe",
   Callback = function(Value)
      autoDupe = Value
      if Value then
         spawn(function()
            while autoDupe do
               if selectedPet ~= "" then
                  local ohInstance1 = game:GetService("ReplicatedStorage").cPetShopFolder[selectedPet]
                  if ohInstance1 then
                     game:GetService("ReplicatedStorage").cPetShopRemote:InvokeServer(ohInstance1)
                     print("Mass duping pet: " .. selectedPet)
                  end
               end
               wait(0.1)
            end
         end)
      end
   end,
})

Misc:CreateButton({
   Name = "Get Chaos Strength Quest!",
   Callback = function()
      local ohString1 = "createNewStoryQuest"
      local ohInstance2 = game:GetService("ReplicatedStorage").Quests["Story Quests"]["Chaos Strength"].Quests["1"]
      game:GetService("ReplicatedStorage").rEvents.questsEvent:FireServer(ohString1, ohInstance2)
   end,
})

Misc:CreateButton({
   Name = "Get Swift Hopper Quest!",
   Callback = function()
      local ohString1 = "createNewStoryQuest"
      local ohInstance2 = game:GetService("ReplicatedStorage").Quests["Story Quests"]["Swift Hopper"].Quests["1"]
      game:GetService("ReplicatedStorage").rEvents.questsEvent:FireServer(ohString1, ohInstance2)
   end,
})

Misc:CreateButton({
   Name = "Claim All codes",
   Callback = function()
      local codes = {
         "speedchampion000",
         "racer300",
         "SPRINT250",
         "hyper250",
         "legends500",
         "sparkles300",
         "Launch200",
         "jungleracer5000",
         "junglesecrets7500",
         "speedchampion0"
      }
      for _, code in ipairs(codes) do
         game:GetService("ReplicatedStorage").rEvents.codeRemote:InvokeServer(code)
      end
   end,
})

Misc:CreateButton({
   Name = "Claim All Free Gifts",
   Callback = function()
      local ohString1 = "claimGift"
      for ohNumber2 = 1, 7 do
         game:GetService("ReplicatedStorage").rEvents.freeGiftClaimRemote:InvokeServer(ohString1, ohNumber2)
      end
   end,
})
