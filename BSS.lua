local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Scamming Hub - Bee Swarm Simulator",
   LoadingTitle = "BSS Hub",
   LoadingSubtitle = "by someone",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "Scamming Hub - BSS"
   },
   KeySystem = false
})

local AutoFarm = Window:CreateTab("Auto Farm", 4483345998)

-- Hive positions (1-6)
local HivePos = {
   [1] = Vector3.new(-5, 6, 331),
   [2] = Vector3.new(-39, 6, 333),
   [3] = Vector3.new(-76, 6, 332),
   [4] = Vector3.new(-114, 6, 329),
   [5] = Vector3.new(-149, 6, 332),
   [6] = Vector3.new(-187, 6, 329)
}

local Player = game.Players.LocalPlayer
local Events = game:GetService("ReplicatedStorage").Events

local function GetMyHive()
   for i = 1, 6 do
      local hive = workspace.Honeycombs:FindFirstChild("Hive"..i)
      if hive and hive:FindFirstChild("Owner") then
         local owner = hive.Owner
         if (owner:IsA("StringValue") and owner.Value == Player.Name) or
            (owner:IsA("ObjectValue") and owner.Value and owner.Value.Name == Player.Name) then
            return i
         end
      end
   end
   return nil
end

local AutoHoney = false
AutoFarm:CreateToggle({
   Name = "Auto Farm Honey",
   CurrentValue = false,
   Callback = function(v)
      AutoHoney = v
      if v then
         Player.Character.HumanoidRootPart.CFrame = CFrame.new(-39, 5, 227)
         spawn(function()
            while AutoHoney do
               Events.ToolCollect:FireServer()
               task.wait(0.1)
            end
         end)
      else
         Player.Character.HumanoidRootPart.CFrame = CFrame.new(-115, 5, 272)
      end
   end
})

local AutoSell = false
AutoFarm:CreateToggle({
   Name = "Auto Sell Honey",
   CurrentValue = false,
   Callback = function(v)
      AutoSell = v
      if v then
         local hive = GetMyHive()
         if hive then
            Player.Character.HumanoidRootPart.CFrame = CFrame.new(HivePos[hive])
            task.wait(0.3)
            Events.PlayerHiveCommand:FireServer("ToggleHoneyMaking")
            spawn(function()
               while AutoSell do
                  task.wait(5)
               end
            end)
         end
      else
         Player.Character.HumanoidRootPart.CFrame = CFrame.new(-115, 5, 272)
      end
   end
})

AutoFarm:CreateButton({
   Name = "Auto Claim Random Hive",
   Callback = function()
      local free = {}
      for i = 1, 6 do
         local hive = workspace.Honeycombs:FindFirstChild("Hive"..i)
         if hive and (not hive:FindFirstChild("Owner") or not hive.Owner.Value) then
            table.insert(free, i)
         end
      end
      if #free > 0 then
         local chosen = free[math.random(1, #free)]
         Events.ClaimHive:FireServer(chosen)
         Rayfield:Notify({ Title = "Hive Claimed", Content = "Claimed Hive "..chosen })
      else
         Rayfield:Notify({ Title = "No Free Hives", Content = "All hives are taken." })
      end
   end
})
