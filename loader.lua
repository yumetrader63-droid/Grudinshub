-- =================================================================
-- Grudins Hub Loader (Clean, Dark Animated Buttons, No Logo)
-- =================================================================

local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Hapus UI lama jika loader dijalankan ulang
if CoreGui:FindFirstChild("GrudinsHubLoader") then
    CoreGui.GrudinsHubLoader:Destroy()
end

-- Asset ID Background Kustom Kamu
local HubBgUrl = "rbxassetid://76695249700487"

-- ScreenGui Utama
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GrudinsHubLoader"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local successUI = pcall(function()
    ScreenGui.Parent = CoreGui
end)
if not successUI then
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

-- Background Gambar Kustom Full Layar Mutlak
local FullscreenBg = Instance.new("ImageLabel")
FullscreenBg.Name = "FullscreenBg"
FullscreenBg.Parent = ScreenGui
FullscreenBg.AnchorPoint = Vector2.new(0, 0)
FullscreenBg.Position = UDim2.new(0, 0, 0, 0)
FullscreenBg.Size = UDim2.new(1, 0, 1, 0)
FullscreenBg.Image = HubBgUrl
FullscreenBg.ScaleType = Enum.ScaleType.Crop
FullscreenBg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
FullscreenBg.BorderSizePixel = 0
FullscreenBg.ZIndex = 0

-- Overlay Gelap Semi-Transparan di atas Background
local DarkOverlay = Instance.new("Frame")
DarkOverlay.Name = "DarkOverlay"
DarkOverlay.Parent = FullscreenBg
DarkOverlay.AnchorPoint = Vector2.new(0, 0)
DarkOverlay.Position = UDim2.new(0, 0, 0, 0)
DarkOverlay.Size = UDim2.new(1, 0, 1, 0)
DarkOverlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
DarkOverlay.BackgroundTransparency = 0.55
DarkOverlay.BorderSizePixel = 0
DarkOverlay.ZIndex = 1

-- Container Utama di Tengah Layar (Tanpa Logo, Lebih Rapi)
local CenterContainer = Instance.new("Frame")
CenterContainer.Name = "CenterContainer"
CenterContainer.Parent = FullscreenBg
CenterContainer.BackgroundTransparency = 1
CenterContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
CenterContainer.Size = UDim2.new(0, 320, 0, 260)
CenterContainer.AnchorPoint = Vector2.new(0.5, 0.5)
CenterContainer.ZIndex = 2

-- Judul Grudins Hub
local TitleText = Instance.new("TextLabel")
TitleText.Parent = CenterContainer
TitleText.BackgroundTransparency = 1
TitleText.Position = UDim2.new(0, 0, 0, 10)
TitleText.Size = UDim2.new(1, 0, 0, 35)
TitleText.Font = Enum.Font.GothamBold
TitleText.Text = "GRUDINS HUB"
TitleText.TextColor3 = Color3.fromRGB(255, 50, 50)
TitleText.TextSize = 20
TitleText.ZIndex = 2

-- Sub-teks Sambutan
local WelcomeText = Instance.new("TextLabel")
WelcomeText.Parent = CenterContainer
WelcomeText.BackgroundTransparency = 1
WelcomeText.Position = UDim2.new(0, 0, 0, 45)
WelcomeText.Size = UDim2.new(1, 0, 0, 20)
WelcomeText.Font = Enum.Font.GothamMedium
WelcomeText.Text = "Welcome, " .. LocalPlayer.Name
WelcomeText.TextColor3 = Color3.fromRGB(200, 200, 200)
WelcomeText.TextSize = 13
WelcomeText.ZIndex = 2

-- Fungsi Pembuat Tombol Hitam Elegan dengan Animasi
local function createButton(name, text, yPos)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Parent = CenterContainer
    btn.BackgroundColor3 = Color3.fromRGB(15, 15, 15) -- Hitam Elegan
    btn.Position = UDim2.new(0.5, -140, 0, yPos)
    btn.Size = UDim2.new(0, 280, 0, 42)
    btn.Font = Enum.Font.GothamBold
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 14
    btn.AutoButtonColor = false
    btn.ZIndex = 3

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn

    local stroke = Instance.new("UIStroke")
    stroke.Parent = btn
    stroke.Color = Color3.fromRGB(200, 25, 25)
    stroke.Thickness = 1.5

    -- Efek Animasi Tombol saat Disentuh/Ditekan
    btn.MouseButton1Down:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.1), {
            BackgroundColor3 = Color3.fromRGB(40, 40, 40),
            Size = UDim2.new(0, 270, 0, 39),
            Position = UDim2.new(0.5, -135, 0, yPos + 1.5)
        }):Play()
    end)

    btn.MouseButton1Up:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.1), {
            BackgroundColor3 = Color3.fromRGB(15, 15, 15),
            Size = UDim2.new(0, 280, 0, 42),
            Position = UDim2.new(0.5, -140, 0, yPos)
        }):Play()
    end)

    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.1), {
            BackgroundColor3 = Color3.fromRGB(15, 15, 15),
            Size = UDim2.new(0, 280, 0, 42),
            Position = UDim2.new(0.5, -140, 0, yPos)
        }):Play()
    end)

    return btn
end

-- Buat Tombol-tombol dengan Tema Hitam & Animasi
local ExecuteBtn = createButton("ExecuteBtn", "EXECUTE", 90)
local DiscordBtn = createButton("DiscordBtn", "Join Discord", 145)
local DonateBtn = createButton("DonateBtn", "Donate", 200)


-- 2. MENU UTAMA HUB (Tersembunyi sebelum tombol Execute ditekan)
local MainHubWindow = Instance.new("Frame")
MainHubWindow.Name = "MainHubWindow"
MainHubWindow.Parent = ScreenGui
MainHubWindow.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainHubWindow.Position = UDim2.new(0.5, -175, 0.5, -125)
MainHubWindow.Size = UDim2.new(0, 350, 0, 250)
MainHubWindow.AnchorPoint = Vector2.new(0.5, 0.5)
MainHubWindow.Visible = false
MainHubWindow.ZIndex = 10

local HubStroke = Instance.new("UIStroke")
HubStroke.Parent = MainHubWindow
HubStroke.Color = Color3.fromRGB(230, 30, 30)
HubStroke.Thickness = 2

local HubCorner = Instance.new("UICorner")
HubCorner.CornerRadius = UDim.new(0, 8)
HubCorner.Parent = MainHubWindow

local HubHeader = Instance.new("Frame")
HubHeader.Parent = MainHubWindow
HubHeader.BackgroundColor3 = Color3.fromRGB(200, 25, 25)
HubHeader.Size = UDim2.new(1, 0, 0, 35)
HubHeader.BorderSizePixel = 0

local HubHeaderCorner = Instance.new("UICorner")
HubHeaderCorner.CornerRadius = UDim.new(0, 8)
HubHeaderCorner.Parent = HubHeader

local HubFix = Instance.new("Frame")
HubFix.Parent = HubHeader
HubFix.BackgroundColor3 = Color3.fromRGB(200, 25, 25)
HubFix.Position = UDim2.new(0, 0, 1, -5)
HubFix.Size = UDim2.new(1, 0, 0, 5)
HubFix.BorderSizePixel = 0

local HubTitle = Instance.new("TextLabel")
HubTitle.Parent = HubHeader
HubTitle.BackgroundTransparency = 1
HubTitle.Size = UDim2.new(1, 0, 1, 0)
HubTitle.Font = Enum.Font.GothamBold
HubTitle.Text = "GRUDINS HUB - MAIN MENU"
HubTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
HubTitle.TextSize = 13

local InfoText = Instance.new("TextLabel")
InfoText.Parent = MainHubWindow
InfoText.BackgroundTransparency = 1
InfoText.Position = UDim2.new(0, 10, 0, 50)
InfoText.Size = UDim2.new(1, -20, 0, 40)
InfoText.Font = Enum.Font.GothamMedium
InfoText.Text = "Status: Hub Berhasil Dijalankan!\nFitur game akan dimuat di sini."
InfoText.TextColor3 = Color3.fromRGB(200, 200, 200)
InfoText.TextSize = 12


-- FUNGSI TOMBOL AKSI
ExecuteBtn.MouseButton1Click:Connect(function()
    FullscreenBg:Destroy()
    MainHubWindow.Visible = true
end)

DiscordBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard("https://discord.gg/linkdiscordmu")
        DiscordBtn.Text = "Copied!"
        task.wait(1.5)
        DiscordBtn.Text = "Join Discord"
    end
end)

DonateBtn.MouseButton1Click:Connect(function()
    print("[Grudins Hub] Terima kasih sudah ingin donate!")
end)

-- Fitur Dragging Menu Utama
local dragging, dragInput, dragStart, startPos
MainHubWindow.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainHubWindow.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainHubWindow.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainHubWindow.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
