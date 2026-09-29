-- =================================================================
-- GRUDINS HUB V1 - UNIVERSAL (STABLE & BUG-FREE BUILD)
-- =================================================================

-- [1] INISIALISASI & PROTEKSI PENGATURAN AWAL
if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local Camera = workspace.CurrentCamera

local LocalPlayer = Players.LocalPlayer
while not LocalPlayer do
    task.wait(0.1)
    LocalPlayer = Players.LocalPlayer
end

-- [2] SISTEM AMAN PARENT UI (BYPASS EXECUTION ERROR)
local function GetSafeParent()
    local parent = nil
    if gethui then
        pcall(function() parent = gethui() end)
    end
    if not parent then
        pcall(function() parent = game:GetService("CoreGui") end)
    end
    if not parent then
        pcall(function() parent = LocalPlayer:WaitForChild("PlayerGui", 5) end)
    end
    return parent or LocalPlayer:FindFirstChildOfClass("PlayerGui")
end

local TargetParent = GetSafeParent()
if not TargetParent then return end

-- Bersihkan UI V1 lama jika ada
if TargetParent:FindFirstChild("GrudinsHubV1") then
    TargetParent.GrudinsHubV1:Destroy()
end

local HubLogoUrl = "rbxassetid://134447790437387"

-- Container ScreenGui Utama
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GrudinsHubV1"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = TargetParent

-- Notifikasi sukses terload
task.spawn(function()
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "Grudins Hub V1",
            Text = "Script V1 Berhasil Terload!",
            Duration = 3,
            Icon = HubLogoUrl
        })
    end)
end)

-- =================================================================
-- [3] TAMPILAN UTAMA (MAIN FRAME)
-- =================================================================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Position = UDim2.new(0.5, -190, 0.5, -180)
MainFrame.Size = UDim2.new(0, 380, 0, 370)
MainFrame.Visible = true
MainFrame.ZIndex = 10

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Parent = MainFrame
MainStroke.Color = Color3.fromRGB(255, 50, 50)
MainStroke.Thickness = 1.5

-- Header TopBar
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundTransparency = 1
TopBar.Size = UDim2.new(1, 0, 0, 45)
TopBar.ZIndex = 11

local LogoIcon = Instance.new("ImageLabel")
LogoIcon.Parent = TopBar
LogoIcon.BackgroundTransparency = 1
LogoIcon.Position = UDim2.new(0, 15, 0, 10)
LogoIcon.Size = UDim2.new(0, 25, 0, 25)
LogoIcon.Image = HubLogoUrl
LogoIcon.ScaleType = Enum.ScaleType.Fit
LogoIcon.ZIndex = 12

local Title = Instance.new("TextLabel")
Title.Parent = TopBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 48, 0, 10)
Title.Size = UDim2.new(0, 200, 0, 25)
Title.Font = Enum.Font.GothamBold
Title.Text = "GRUDINS HUB : UNIVERSAL V1"
Title.TextColor3 = Color3.fromRGB(255, 50, 50)
Title.TextSize = 12
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.ZIndex = 12

-- Tombol Close (X)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TopBar
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 30, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 12)
CloseBtn.Size = UDim2.new(0, 22, 0, 22)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 11
CloseBtn.ZIndex = 12

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseBtn

-- Tombol Minimize (-)
local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Parent = TopBar
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MinimizeBtn.Position = UDim2.new(1, -65, 0, 12)
MinimizeBtn.Size = UDim2.new(0, 22, 0, 22)
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.Text = "-"
MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeBtn.TextSize = 14
MinimizeBtn.ZIndex = 12

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 6)
MinCorner.Parent = MinimizeBtn

local Divider = Instance.new("Frame")
Divider.Parent = MainFrame
Divider.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Divider.BorderSizePixel = 0
Divider.Position = UDim2.new(0, 15, 0, 45)
Divider.Size = UDim2.new(1, -30, 0, 1)
Divider.ZIndex = 11

-- Tombol Lihat List Game Support
local GameListBtn = Instance.new("TextButton")
GameListBtn.Parent = MainFrame
GameListBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
GameListBtn.Position = UDim2.new(0, 15, 0, 52)
GameListBtn.Size = UDim2.new(1, -30, 0, 30)
GameListBtn.Font = Enum.Font.GothamBold
GameListBtn.Text = "🎮  Lihat List Game Support"
GameListBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
GameListBtn.TextSize = 11
GameListBtn.ZIndex = 11

local GLBtnCorner = Instance.new("UICorner")
GLBtnCorner.CornerRadius = UDim.new(0, 6)
GLBtnCorner.Parent = GameListBtn

-- Container Scroll Area
local ContentContainer = Instance.new("ScrollingFrame")
ContentContainer.Parent = MainFrame
ContentContainer.BackgroundTransparency = 1
ContentContainer.Position = UDim2.new(0, 15, 0, 90)
ContentContainer.Size = UDim2.new(1, -30, 1, -100)
ContentContainer.CanvasSize = UDim2.new(0, 0, 0, 460)
ContentContainer.ScrollBarThickness = 4
ContentContainer.ScrollBarImageColor3 = Color3.fromRGB(255, 50, 50)
ContentContainer.ZIndex = 11

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = ContentContainer
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)

-- =================================================================
-- [4] GENERATOR ELEMEN TOGGLE & SLIDER
-- =================================================================
local function createToggleFeature(name, defaultState, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 36)
    frame.BackgroundTransparency = 1
    frame.ZIndex = 11

    local label = Instance.new("TextLabel")
    label.Parent = frame
    label.BackgroundTransparency = 1
    label.Size = UDim2.new(0, 200, 1, 0)
    label.Font = Enum.Font.GothamMedium
    label.Text = name
    label.TextColor3 = Color3.fromRGB(230, 230, 230)
    label.TextSize = 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.ZIndex = 11

    local btn = Instance.new("TextButton")
    btn.Parent = frame
    btn.AnchorPoint = Vector2.new(1, 0.5)
    btn.Position = UDim2.new(1, 0, 0.5, 0)
    btn.Size = UDim2.new(0, 65, 0, 26)
    btn.BackgroundColor3 = defaultState and Color3.fromRGB(50, 200, 50) or Color3.fromRGB(50, 50, 50)
    btn.Font = Enum.Font.GothamBold
    btn.Text = defaultState and "ON" or "OFF"
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 11
    btn.ZIndex = 11

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn

    local state = defaultState
    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.Text = state and "ON" or "OFF"
        btn.BackgroundColor3 = state and Color3.fromRGB(50, 200, 50) or Color3.fromRGB(50, 50, 50)
        callback(state)
    end)

    frame.Parent = ContentContainer
end

local function createSliderFeature(name, min, max, defaultVal, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 50)
    frame.BackgroundTransparency = 1
    frame.ZIndex = 11

    local label = Instance.new("TextLabel")
    label.Parent = frame
    label.BackgroundTransparency = 1
    label.Size = UDim2.new(1, 0, 0, 18)
    label.Font = Enum.Font.GothamMedium
    label.Text = name .. ": " .. defaultVal .. "x"
    label.TextColor3 = Color3.fromRGB(230, 230, 230)
    label.TextSize = 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.ZIndex = 11

    local sliderBg = Instance.new("Frame")
    sliderBg.Parent = frame
    sliderBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    sliderBg.Position = UDim2.new(0, 0, 0, 24)
    sliderBg.Size = UDim2.new(1, 0, 0, 10)
    sliderBg.ZIndex = 11

    local sCorner = Instance.new("UICorner")
    sCorner.CornerRadius = UDim.new(1, 0)
    sCorner.Parent = sliderBg

    local sliderFill = Instance.new("Frame")
    sliderFill.Parent = sliderBg
    sliderFill.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    sliderFill.Size = UDim2.new((defaultVal - min) / (max - min), 0, 1, 0)
    sliderFill.ZIndex = 11

    local fCorner = Instance.new("UICorner")
    fCorner.CornerRadius = UDim.new(1, 0)
    fCorner.Parent = sliderFill

    local dragging = false
    sliderBg.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local pos = math.clamp((input.Position.X - sliderBg.AbsolutePosition.X) / sliderBg.AbsoluteSize.X, 0, 1)
            sliderFill.Size = UDim2.new(pos, 0, 1, 0)
            local val = math.floor(min + (max - min) * pos)
            label.Text = name .. ": " .. val .. "x"
            callback(val)
        end
    end)

    frame.Parent = ContentContainer
end

-- State System Variables
local flyEnabled = false
local aimbotEnabled = false
local espBodyEnabled = false
local espLineEnabled = false
local wallhackEnabled = false

local currentSpeed = 1
local currentFlySpeed = 1

local flyUpPressed = false
local flyDownPressed = false

local ESPLineFolder = Instance.new("Folder")
ESPLineFolder.Name = "GrudinsESPLineFolder"
ESPLineFolder.Parent = ScreenGui

-- Mobile Fly Control Panel (Tombol UP / DOWN Melayang)
local FlyControlFrame = Instance.new("Frame")
FlyControlFrame.Name = "FlyControlFrame"
FlyControlFrame.Parent = ScreenGui
FlyControlFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
FlyControlFrame.Position = UDim2.new(0.85, -50, 0.5, -50)
FlyControlFrame.Size = UDim2.new(0, 60, 0, 110)
FlyControlFrame.Visible = false
FlyControlFrame.ZIndex = 20

local FCFrameCorner = Instance.new("UICorner")
FCFrameCorner.CornerRadius = UDim.new(0, 10)
FCFrameCorner.Parent = FlyControlFrame

local FCFrameStroke = Instance.new("UIStroke")
FCFrameStroke.Parent = FlyControlFrame
FCFrameStroke.Color = Color3.fromRGB(255, 50, 50)
FCFrameStroke.Thickness = 1.5

local UpBtn = Instance.new("TextButton")
UpBtn.Parent = FlyControlFrame
UpBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
UpBtn.Position = UDim2.new(0, 5, 0, 5)
UpBtn.Size = UDim2.new(0, 50, 0, 45)
UpBtn.Font = Enum.Font.GothamBold
UpBtn.Text = "⬆\nUP"
UpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
UpBtn.TextSize = 11
UpBtn.ZIndex = 21

local UpCorner = Instance.new("UICorner")
UpCorner.CornerRadius = UDim.new(0, 6)
UpCorner.Parent = UpBtn

local DownBtn = Instance.new("TextButton")
DownBtn.Parent = FlyControlFrame
DownBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
DownBtn.Position = UDim2.new(0, 5, 0, 60)
DownBtn.Size = UDim2.new(0, 50, 0, 45)
DownBtn.Font = Enum.Font.GothamBold
DownBtn.Text = "⬇\nDOWN"
DownDownTextColor = Color3.fromRGB(255, 255, 255)
DownBtn.TextSize = 11
DownBtn.ZIndex = 21

local DownCorner = Instance.new("UICorner")
DownCorner.CornerRadius = UDim.new(0, 6)
DownCorner.Parent = DownBtn

UpBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        flyUpPressed = true
    end
end)
UpBtn.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        flyUpPressed = false
    end
end)

DownBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        flyDownPressed = true
    end
end)
DownBtn.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        flyDownPressed = false
    end
end)

-- =================================================================
-- [5] LOGIKA ENGINE UTAMA (100% PERBAIKAN DIRECTION ANALOG & ESP)
-- =================================================================

-- 1. Precision Fly (Analog Fix & Kamera 3D Matrix)
RunService.RenderStepped:Connect(function()
    local char = LocalPlayer.Character
    if flyEnabled and char then
        local hrp = char:FindFirstChild("HumanoidRootPart")
        local hum = char:FindFirstChild("Humanoid")
        
        if hrp and hum then
            hum.PlatformStand = true

            local camCF = Camera.CFrame
            local moveDir = hum.MoveDirection

            local verticalSpeed = 0
            if flyUpPressed then
                verticalSpeed = 30 * currentFlySpeed
            elseif flyDownPressed then
                verticalSpeed = -30 * currentFlySpeed
            end

            if moveDir.Magnitude > 0 then
                -- Konversi MoveDirection ke Local Object Space Kamera
                local localMove = camCF:VectorToObjectSpace(moveDir)
                
                -- Kalkulasi Vektor Maju/Mundur & Kiri/Kanan Presisi
                local targetDir = (camCF.LookVector * (-localMove.Z)) + (camCF.RightVector * localMove.X)
                if targetDir.Magnitude > 0 then
                    targetDir = targetDir.Unit * (35 * currentFlySpeed)
                    hrp.AssemblyLinearVelocity = Vector3.new(targetDir.X, targetDir.Y + verticalSpeed, targetDir.Z)
                else
                    hrp.AssemblyLinearVelocity = Vector3.new(0, verticalSpeed, 0)
                end
            else
                hrp.AssemblyLinearVelocity = Vector3.new(0, verticalSpeed ~= 0 and verticalSpeed or 0.5, 0)
            end
        end
    elseif char and char:FindFirstChild("Humanoid") and not flyEnabled then
        char.Humanoid.PlatformStand = false
    end
end)

-- 2. WalkSpeed Engine
RunService.Stepped:Connect(function()
    pcall(function()
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = 16 * currentSpeed
        end
    end)
end)

-- 3. Aimbot Lock System
RunService.RenderStepped:Connect(function()
    if aimbotEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local nearestHead = nil
        local shortestDist = math.huge
        local myPos = LocalPlayer.Character.HumanoidRootPart.Position

        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                local pChar = player.Character
                local head = pChar:FindFirstChild("Head")
                local hum = pChar:FindFirstChild("Humanoid")

                if head and hum and hum.Health > 0 then
                    local dist = (head.Position - myPos).Magnitude
                    if dist < shortestDist then
                        shortestDist = dist
                        nearestHead = head
                    end
                end
            end
        end

        if nearestHead then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, nearestHead.Position)
        end
    end
end)

-- 4. ESP Body & ESP Line System
RunService.RenderStepped:Connect(function()
    ESPLineFolder:ClearAllChildren()

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local char = player.Character

            -- ESP Body Highlight Red
            if espBodyEnabled then
                local hl = char:FindFirstChild("GrudinsESPBody")
                if not hl then
                    hl = Instance.new("Highlight")
                    hl.Name = "GrudinsESPBody"
                    hl.FillColor = Color3.fromRGB(255, 50, 50)
                    hl.FillTransparency = 0.4
                    hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    hl.Parent = char
                end
            else
                if char:FindFirstChild("GrudinsESPBody") then
                    char.GrudinsESPBody:Destroy()
                end
            end

            -- ESP Line Tracer Garis Putih
            if espLineEnabled and char:FindFirstChild("HumanoidRootPart") then
                local hrp = char.HumanoidRootPart
                local vector, onScreen = Camera:WorldToViewportPoint(hrp.Position)
                
                if onScreen then
                    local startPos = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                    local targetPos = Vector2.new(vector.X, vector.Y)
                    local diff = targetPos - startPos
                    local distance = diff.Magnitude
                    local angle = math.atan2(diff.Y, diff.X)

                    local lineFrame = Instance.new("Frame")
                    lineFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    lineFrame.BorderSizePixel = 0
                    lineFrame.ZIndex = 5
                    lineFrame.Size = UDim2.new(0, distance, 0, 1.5)
                    lineFrame.Position = UDim2.new(0, startPos.X, 0, startPos.Y)
                    lineFrame.AnchorPoint = Vector2.new(0, 0.5)
                    lineFrame.Rotation = math.deg(angle)
                    lineFrame.Parent = ESPLineFolder
                end
            end
        end
    end
end)

-- 5. Wallhack System
RunService.RenderStepped:Connect(function()
    if wallhackEnabled then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                for _, part in ipairs(player.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.Transparency = 0.5
                    end
                end
            end
        end
    end
end)

-- Pendaftaran Fitur
createToggleFeature("✈️ Fly (Analog Fix)", false, function(state) 
    flyEnabled = state 
    FlyControlFrame.Visible = state
end)
createToggleFeature("🎯 Aimbot (Camera Lock)", false, function(state) aimbotEnabled = state end)
createToggleFeature("👀 ESP Body (Highlight)", false, function(state) espBodyEnabled = state end)
createToggleFeature("📏 ESP Line (Garis Putih)", false, function(state) espLineEnabled = state end)
createToggleFeature("🧱 Wallhack", false, function(state) wallhackEnabled = state end)

createSliderFeature("⚡ Speed Jalan", 1, 10, 1, function(val) currentSpeed = val end)
createSliderFeature("🚀 Fly Speed", 1, 10, 1, function(val) currentFlySpeed = val end)

-- =================================================================
-- [6] POPUP LIST GAME SUPPORT
-- =================================================================
local GameListPopup = Instance.new("Frame")
GameListPopup.Name = "GameListPopup"
GameListPopup.Parent = ScreenGui
GameListPopup.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
GameListPopup.Position = UDim2.new(0.5, 0, 0.5, 0)
GameListPopup.Size = UDim2.new(0, 320, 0, 360)
GameListPopup.Anch
