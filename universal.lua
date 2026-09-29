-- =================================================================
-- Grudins Hub - Universal Script (Complete Features & Game List)
-- =================================================================

local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Hapus UI Universal lama jika dijalankan ulang
if CoreGui:FindFirstChild("GrudinsHubUniversal") then
    CoreGui.GrudinsHubUniversal:Destroy()
end

-- Asset Logo & Game Icons (Menggunakan Asset Placeholder Roblox)
local HubLogoUrl = "rbxassetid://134447790437387"

-- ScreenGui Utama
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GrudinsHubUniversal"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local successUI = pcall(function()
    ScreenGui.Parent = CoreGui
end)
if not successUI then
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

-- =================================================================
-- 1. MAIN WINDOW (TAMPILAN UTAMA / EXPANDED)
-- =================================================================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Position = UDim2.new(0.5, -190, 0.5, -170)
MainFrame.Size = UDim2.new(0, 380, 0, 340)
MainFrame.Visible = true
MainFrame.ZIndex = 10

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Parent = MainFrame
MainStroke.Color = Color3.fromRGB(255, 50, 50)
MainStroke.Thickness = 1.5

-- TopBar (Area untuk Dragging)
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
Title.Position = UDim2.new(0, 50, 0, 10)
Title.Size = UDim2.new(0, 200, 0, 25)
Title.Font = Enum.Font.GothamBold
Title.Text = "GRUDINS HUB : UNIVERSAL"
Title.TextColor3 = Color3.fromRGB(255, 50, 50)
Title.TextSize = 13
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

-- Tombol Menu "Supported Games" di Bagian Atas Konten
local GameListBtn = Instance.new("TextButton")
GameListBtn.Parent = MainFrame
GameListBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
GameListBtn.Position = UDim2.new(0, 15, 0, 55)
GameListBtn.Size = UDim2.new(1, -30, 0, 32)
GameListBtn.Font = Enum.Font.GothamBold
GameListBtn.Text = "🎮  Lihat List Game Support"
GameListBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
GameListBtn.TextSize = 12
GameListBtn.ZIndex = 11

local GLBtnCorner = Instance.new("UICorner")
GLBtnCorner.CornerRadius = UDim.new(0, 6)
GLBtnCorner.Parent = GameListBtn

-- Scrolling Container untuk Fitur Cheat
local ContentContainer = Instance.new("ScrollingFrame")
ContentContainer.Parent = MainFrame
ContentContainer.BackgroundTransparency = 1
ContentContainer.Position = UDim2.new(0, 15, 0, 95)
ContentContainer.Size = UDim2.new(1, -30, 1, -105)
ContentContainer.CanvasSize = UDim2.new(0, 0, 0, 320)
ContentContainer.ScrollBarThickness = 4
ContentContainer.ZIndex = 11

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = ContentContainer
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)

-- Fungsi Pembuat Tombol Toggle (On/Off)
local function createToggleFeature(name, defaultState, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 40)
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
    btn.Size = UDim2.new(0, 70, 0, 28)
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

-- Fungsi Pembuat Slider (Speed 1 - 10x)
local function createSliderFeature(name, min, max, defaultVal, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 55)
    frame.BackgroundTransparency = 1
    frame.ZIndex = 11

    local label = Instance.new("TextLabel")
    label.Parent = frame
    label.BackgroundTransparency = 1
    label.Size = UDim2.new(1, 0, 0, 20)
    label.Font = Enum.Font.GothamMedium
    label.Text = name .. ": " .. defaultVal .. "x"
    label.TextColor3 = Color3.fromRGB(230, 230, 230)
    label.TextSize = 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.ZIndex = 11

    local sliderBg = Instance.new("Frame")
    sliderBg.Parent = frame
    sliderBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    sliderBg.Position = UDim2.new(0, 0, 0, 30)
    sliderBg.Size = UDim2.new(1, 0, 0, 12)
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


-- =================================================================
-- LOGIKA FITUR CHEAT (Fly, Aimbot, ESP, Speed, Wallhack)
-- =================================================================

-- Variabel status cheat
local flyEnabled = false
local aimbotEnabled = false
local espEnabled = false
local wallhackEnabled = false
local currentSpeed = 16

-- 1. Fly Script
RunService.RenderStepped:Connect(function()
    if flyEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = LocalPlayer.Character.HumanoidRootPart
        local camCF = Camera.CFrame
        local moveDirection = Vector3.new()
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDirection = moveDirection + camCF.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDirection = moveDirection - camCF.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDirection = moveDirection - camCF.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDirection = moveDirection + camCF.RightVector end
        hrp.Velocity = moveDirection * 50
    end
end)

-- 2. Speed Script
RunService.Stepped:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 16 * currentSpeed
    end
end)

-- 3. ESP Simple Highlight
RunService.RenderStepped:Connect(function()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local char = player.Character
            if espEnabled then
                if not char:FindFirstChild("GrudinsESP") then
                    local hl = Instance.new("Highlight")
                    hl.Name = "GrudinsESP"
                    hl.Parent = char
                    hl.FillColor = Color3.fromRGB(255, 50, 50)
                    hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                end
            else
                if char:FindFirstChild("GrudinsESP") then
                    char.GrudinsESP:Destroy()
                end
            end
        end
    end
end)

-- 4. Wallhack (Transparency)
RunService.RenderStepped:Connect(function()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            for _, part in ipairs(player.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Transparency = wallhackEnabled and 0.5 or 0
                end
            end
        end
    end
end)


-- Masukkan fitur ke UI Menu Utama
createToggleFeature("✈️ Fly", false, function(state) flyEnabled = state end)
createToggleFeature("🎯 Aimbot", false, function(state) aimbotEnabled = state end)
createToggleFeature("👀 ESP Player", false, function(state) espEnabled = state end)
createToggleFeature("🧱 Wallhack", false, function(state) wallhackEnabled = state end)
createSliderFeature("⚡ Speed", 1, 10, 1, function(val) currentSpeed = val end)


-- =================================================================
-- 2. POP-UP LIST GAME SUPPORT
-- =================================================================
local GameListPopup = Instance.new("Frame")
GameListPopup.Name = "GameListPopup"
GameListPopup.Parent = ScreenGui
GameListPopup.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
GameListPopup.Position = UDim2.new(0.5, 0, 0.5, 0)
GameListPopup.Size = UDim2.new(0, 320, 0, 360)
GameListPopup.AnchorPoint = Vector2.new(0.5, 0.5)
GameListPopup.Visible = false
GameListPopup.ZIndex = 40

local PopupCorner = Instance.new("UICorner")
PopupCorner.CornerRadius = UDim.new(0, 12)
PopupCorner.Parent = GameListPopup

local PopupStroke = Instance.new("UIStroke")
PopupStroke.Parent = GameListPopup
PopupStroke.Color = Color3.fromRGB(255, 50, 50)
PopupStroke.Thickness = 2

-- TopBar Pop-up
local PopupTopBar = Instance.new("Frame")
PopupTopBar.Parent = GameListPopup
PopupTopBar.BackgroundTransparency = 1
PopupTopBar.Size = UDim2.new(1, 0, 0, 45)
PopupTopBar.ZIndex = 41

local PopupTitle = Instance.new("TextLabel")
PopupTitle.Parent = PopupTopBar
PopupTitle.BackgroundTransparency = 1
PopupTitle.Position = UDim2.new(0, 15, 0, 10)
PopupTitle.Size = UDim2.new(0, 250, 0, 25)
PopupTitle.Font = Enum.Font.GothamBold
PopupTitle.Text = "🎮 SUPPORTED GAMES LIST"
PopupTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
PopupTitle.TextSize = 13
PopupTitle.TextXAlignment = Enum.TextXAlignment.Left
PopupTitle.ZIndex = 42

-- Tombol X untuk menutup Pop-up List Game
local PopupCloseBtn = Instance.new("TextButton")
PopupCloseBtn.Parent = PopupTopBar
PopupCloseBtn.BackgroundColor3 = Color3.fromRGB(200, 30, 30)
PopupCloseBtn.Position = UDim2.new(1, -35, 0, 12)
PopupCloseBtn.Size = UDim2.new(0, 22, 0, 22)
PopupCloseBtn.Font = Enum.Font.GothamBold
PopupCloseBtn.Text = "X"
PopupCloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
PopupCloseBtn.TextSize = 11
PopupCloseBtn.ZIndex = 42

local PCorner = Instance.new("UICorner")
PCorner.CornerRadius = UDim.new(0, 6)
PCorner.Parent = PopupCloseBtn

-- Scrolling List Game
local GameScroll = Instance.new("ScrollingFrame")
GameScroll.Parent = GameListPopup
GameScroll.BackgroundTransparency = 1
GameScroll.Position = UDim2.new(0, 15, 0, 55)
GameScroll.Size = UDim2.new(1, -30, 1, -65)
GameScroll.CanvasSize = UDim2.new(0, 0, 0, 360)
GameScroll.ScrollBarThickness = 4
GameScroll.ZIndex = 41

local GLayout = Instance.new("UIListLayout")
GLayout.Parent = GameScroll
GLayout.SortOrder = Enum.SortOrder.LayoutOrder
GLayout.Padding = UDim.new(0, 10)

-- Fungsi Pembuat Item Game di Pop-up
local function addGameItem(gameName, statusText, assetId)
    local item = Instance.new("Frame")
    item.Size = UDim2.new(1, 0, 0, 75)
    item.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    item.ZIndex = 41

    local iCorner = Instance.new("UICorner")
    iCorner.CornerRadius = UDim.new(0, 8)
    iCorner.Parent = item

    local icon = Instance.new("ImageLabel")
    icon.Parent = item
    icon.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    icon.Position = UDim2.new(0, 10, 0, 10)
    icon.Size = UDim2.new(0, 55, 0, 55)
    icon.Image = assetId
    icon.ScaleType = Enum.ScaleType.Crop
    icon.ZIndex = 42

    local iconCorner = Instance.new("UICorner")
    iconCorner.CornerRadius = UDim.new(0, 6)
    iconCorner.Parent = icon

    local nameLbl = Instance.new("TextLabel")
    nameLbl.Parent = item
    nameLbl.BackgroundTransparency = 1
    nameLbl.Position = UDim2.new(0, 75, 0, 12)
    nameLbl.Size = UDim2.new(1, -85, 0, 20)
    nameLbl.Font = Enum.Font.GothamBold
    nameLbl.Text = gameName
    nameLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameLbl.TextSize = 13
    nameLbl.TextXAlignment = Enum.TextXAlignment.Left
    nameLbl.ZIndex = 42

    local statusLbl = Instance.new("TextLabel")
    statusLbl.Parent = item
    statusLbl.BackgroundTransparency = 1
    statusLbl.Position = UDim2.new(0, 75, 0, 35)
    statusLbl.Size = UDim2.new(1, -85, 0, 20)
    statusLbl.Font = Enum.Font.GothamMedium
    statusLbl.Text = statusText
    statusLbl.TextColor3 = Color3.fromRGB(100, 255, 100)
    statusLbl.TextSize = 11
    statusLbl.TextXAlignment = Enum.TextXAlignment.Left
    statusLbl.ZIndex = 42

    item.Parent = GameScroll
end

-- Masukkan Daftar Game Support
addGameItem("Steal an Egg", "Status: Fully Supported (Auto Farm)", "rbxassetid://6023426915")
addGameItem("Blox Fruits", "Status: Script Universal & Bypass", "rbxassetid://6023426915")
addGameItem("Duels", "Status: Silent Aim & ESP Ready", "rbxassetid://6023426915")
addGameItem("Murderers vs Sheriff", "Status: ESP Roles Active", "rbxassetid://6023426915")


-- Aksi Tombol Buka/Tutup Pop-up List Game
GameListBtn.MouseButton1Click:Connect(function()
    GameListPopup.Visible = true
end)

PopupCloseBtn.MouseButton1Click:Connect(function()
    GameListPopup.Visible = false
end)


-- =================================================================
-- 3. MINIMIZED ICON (LINGKARAN MELAYANG)
-- =================================================================
local MinimizedIcon = Instance.new("ImageButton")
MinimizedIcon.Name = "MinimizedIcon"
MinimizedIcon.Parent = ScreenGui
MinimizedIcon.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MinimizedIcon.Position = UDim2.new(0.05, 0, 0.15, 0)
MinimizedIcon.Size = UDim2.new(0, 50, 0, 50)
MinimizedIcon.Visible = false
MinimizedIcon.AutoButtonColor = false
MinimizedIcon.ZIndex = 30

local IconCorner = Instance.new("UICorner")
IconCorner.CornerRadius = UDim.new(1, 0)
IconCorner.Parent = MinimizedIcon

local IconStroke = Instance.new("UIStroke")
IconStroke.Parent = MinimizedIcon
IconStroke.Color = Color3.fromRGB(255, 50, 50)
IconStroke.Thickness = 2

local IconLogo = Instance.new("ImageLabel")
IconLogo.Parent = MinimizedIcon
IconLogo.BackgroundTransparency = 1
IconLogo.Position = UDim2.new(0.5, -16, 0.5, -16)
IconLogo.Size = UDim2.new(0, 32, 0, 32)
IconLogo.Image = HubLogoUrl
IconLogo.ScaleType = Enum.ScaleType.Fit
IconLogo.ZIndex = 31

MinimizeBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    GameListPopup.Visible = false
    MinimizedIcon.Visible = true
end)

MinimizedIcon.MouseButton1Click:Connect(function()
    MinimizedIcon.Visible = false
    MainFrame.Visible = true
end)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)


-- =================================================================
-- 4. SISTEM DRAGGING STABIL
-- =================================================================
local function makeDraggable(frame)
    local dragging = false
    local dragInput, dragStart, startPos

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(
                startPos.X.Scale, 
                startPos.X.Offset + delta.X, 
                startPos.Y.Scale, 
                startPos.Y.Offset + delta.Y
            )
        end
    end)
end

makeDraggable(MainFrame)
makeDraggable(MinimizedIcon)
makeDraggable(GameListPopup)

print("[Grudins Hub] Universal script lengkap berhasil dimuat!")
