local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Scamming Hub - Fisch { WORKS 50/50}",
   LoadingTitle = "Fisch Hub",
   LoadingSubtitle = "by someone",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "Scamming Hub - Fisch",
      FileName = "Config"
   },
   KeySystem = false
})

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local LocalPlayer = Players.LocalPlayer

local Remotes = {
    ReelFinished = ReplicatedStorage.events:WaitForChild("reelfinished")
}

local CurrentTool = nil
local Coroutines = {}

local function StopCoroutine(name)
    if Coroutines[name] then
        coroutine.close(Coroutines[name])
        Coroutines[name] = nil
    end
end

local AutoFish = Window:CreateTab("Auto Fish", 4483345998)

AutoFish:CreateSection("Casting")

AutoFish:CreateToggle({
   Name = "Auto Cast",
   CurrentValue = false,
   Flag = "AutoCast",
   Callback = function(v)
      StopCoroutine("AutoCast")
      if v then
         Coroutines.AutoCast = coroutine.create(function()
            while task.wait(0.3) do
               pcall(function()
                  CurrentTool = CurrentTool or LocalPlayer.Character:FindFirstChildOfClass("Tool")
                  if CurrentTool and CurrentTool:FindFirstChild("values") and not CurrentTool.values.casted.Value then
                     local animFolder = ReplicatedStorage.resources.animations.fishing
                     local animTrack = LocalPlayer.Character.Humanoid:LoadAnimation(animFolder.throw)
                     animTrack.Priority = Enum.AnimationPriority.Action4
                     animTrack:Play()
                     CurrentTool.events.cast:FireServer(100, 1)
                     animTrack.Stopped:Connect(function() animTrack:Destroy() end)
                  end
               end)
            end
         end)
         coroutine.resume(Coroutines.AutoCast)
      end
   end
})

AutoFish:CreateToggle({
   Name = "Instant Bob",
   CurrentValue = false,
   Flag = "InstantBob",
   Callback = function(v)
      StopCoroutine("InstantBob")
      if v then
         Coroutines.InstantBob = coroutine.create(function()
            while task.wait() do
               pcall(function()
                  if CurrentTool and CurrentTool:FindFirstChild("bobber") then
                     local bobber = CurrentTool.bobber
                     local params = RaycastParams.new()
                     params.FilterType = Enum.RaycastFilterType.Include
                     params.FilterDescendantsInstances = {workspace.Terrain}
                     local ray = workspace:Raycast(bobber.Position, Vector3.new(0, -100, 0), params)
                     if ray then
                        bobber:PivotTo(CFrame.new(ray.Position))
                     end
                  end
               end)
            end
         end)
         coroutine.resume(Coroutines.InstantBob)
      end
   end
})

AutoFish:CreateSection("Reeling")

AutoFish:CreateToggle({
   Name = "Auto Reel (Legit)",
   CurrentValue = false,
   Flag = "AutoReel",
   Callback = function(v)
      StopCoroutine("AutoReel")
      if v then
         Coroutines.AutoReel = coroutine.create(function()
            while task.wait() do
               pcall(function()
                  local reelUI = LocalPlayer.PlayerGui:FindFirstChild("reel")
                  if reelUI and reelUI:FindFirstChild("bar") then
                     local playerBar = reelUI.bar.playerbar
                     local fishBar = reelUI.bar.fish
                     if playerBar and fishBar then
                        local targetPos = playerBar.Position:Lerp(fishBar.Position, 0.7)
                        playerBar.Position = UDim2.fromScale(math.clamp(targetPos.X.Scale, 0.15, 0.85), targetPos.Y.Scale)
                     end
                  end
               end)
            end
         end)
         coroutine.resume(Coroutines.AutoReel)
      end
   end
})

AutoFish:CreateToggle({
   Name = "Instant Reel",
   CurrentValue = false,
   Flag = "InstantReel",
   Callback = function(v)
      StopCoroutine("InstantReel")
      if v then
         Coroutines.InstantReel = coroutine.create(function()
            while task.wait() do
               pcall(function()
                  local reelUI = LocalPlayer.PlayerGui:FindFirstChild("reel")
                  if reelUI and reelUI.bar:FindFirstChild("reel") and reelUI.bar.reel.Enabled then
                     Remotes.ReelFinished:FireServer(100, true)
                  end
               end)
            end
         end)
         coroutine.resume(Coroutines.InstantReel)
      end
   end
})

AutoFish:CreateToggle({
   Name = "Always Perfect",
   CurrentValue = false,
   Flag = "AlwaysPerfect",
   Callback = function(v)
      if v then
         local old = Remotes.ReelFinished.FireServer
         Remotes.ReelFinished.FireServer = function(self, pct, perf)
            return old(self, 100, true)
         end
      end
   end
})

AutoFish:CreateSection("Other")

AutoFish:CreateToggle({
   Name = "Auto Shake",
   CurrentValue = false,
   Flag = "AutoShake",
   Callback = function(v)
      StopCoroutine("AutoShake")
      if v then
         Coroutines.AutoShake = coroutine.create(function()
            while task.wait(0.1) do
               pcall(function()
                  local shakeUI = LocalPlayer.PlayerGui:FindFirstChild("shakeui")
                  if shakeUI and shakeUI:FindFirstChild("safezone") then
                     local btn = shakeUI.safezone:FindFirstChildWhichIsA("ImageButton")
                     if btn then
                        local pos = btn.AbsolutePosition + btn.AbsoluteSize / 2
                        VirtualInputManager:SendMouseButtonEvent(pos.X, pos.Y, 0, true, game, 1)
                        task.wait(0.05)
                        VirtualInputManager:SendMouseButtonEvent(pos.X, pos.Y, 0, false, game, 1)
                     end
                  end
               end)
            end
         end)
         coroutine.resume(Coroutines.AutoShake)
      end
   end
})

AutoFish:CreateToggle({
   Name = "Center Shake",
   CurrentValue = false,
   Flag = "CenterShake",
   Callback = function(v)
      StopCoroutine("CenterShake")
      if v then
         Coroutines.CenterShake = coroutine.create(function()
            while task.wait() do
               pcall(function()
                  local shakeUI = LocalPlayer.PlayerGui:FindFirstChild("shakeui")
                  if shakeUI and shakeUI.safezone then
                     if shakeUI.safezone:FindFirstChild("connect") then
                        shakeUI.safezone.connect.Enabled = false
                     end
                     shakeUI.safezone.Size = UDim2.new(0,0,0,0)
                     shakeUI.safezone.Position = UDim2.fromScale(0.5,0.5)
                     shakeUI.safezone.AnchorPoint = Vector2.new(0.5,0.5)
                  end
               end)
            end
         end)
         coroutine.resume(Coroutines.CenterShake)
      end
   end
})
