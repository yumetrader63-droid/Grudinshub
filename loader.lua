-- =================================================================
-- Grudins Hub Loader (Official Custom Decal Version)
-- =================================================================

local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Hapus UI lama jika loader dijalankan ulang
if CoreGui:FindFirstChild("GrudinsHubLoader") then
    CoreGui.GrudinsHubLoader:Destroy()
end

-- Asset ID Decal buatan kamu yang sudah diatur publik
local HubLogoUrl = "rbxassetid://126391784883561"

-- ScreenGui Utama
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GrudinsHubLoader"
ScreenGui.ResetOnSpawn = false

local successUI = pcall(function()
    ScreenGui.Parent = CoreGui
end)
if not successUI then
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

-- Background Gelap Semi-Transparan Full Layar
local FullscreenBg = Instance.new("Frame")
FullscreenBg.Name = "FullscreenBg"
FullscreenBg.Parent = ScreenGui
FullscreenBg.Size = UDim2.new(1, 0, 1, 0)
FullscreenBg.Position = UDim2.new(0, 0, 0, 0)
FullscreenBg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
FullscreenBg.BackgroundTransparency = 0.65
FullscreenBg.BorderSizePixel = 0

-- Container Utama di Tengah Layar
local CenterContainer = Instance.new("Frame")
CenterContainer.Name = "CenterContainer"
CenterContainer.Parent = FullscreenBg
CenterContainer.BackgroundTransparency = 1
CenterContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
CenterContainer.Size = UDim2.new(0, 320, 0, 300)
CenterContainer.AnchorPoint = Vector2.new(0.5, 0.5)

-- Logo Image Menggunakan Asset Decal Kamu
local LogoImage = Instance.new("ImageLabel")
LogoImage.Parent = CenterContainer
LogoImage.BackgroundTransparency = 1
LogoImage.Position = UDim2.new(0.5, -30, 0, 0)
LogoImage.Size = UDim2.new(0, 60, 0, 60)
LogoImage.Image = HubLogoUrl
LogoImage.ScaleType = Enum.ScaleType.Fit

-- Judul Grudins Hub
local TitleText = Instance.new("TextLabel")
TitleText.Parent = CenterContainer
TitleText.BackgroundTransparency = 1
TitleText.Position = UDim2.new(0, 0, 0, 65)
TitleText.Size = UDim2.new(1, 0, 0, 30)
TitleText.Font = Enum.Font.GothamBold
TitleText.Text = "GRUDINS HUB"
TitleText.TextColor3 = Color3.fromRGB(255, 50, 50)
TitleText.TextSize = 16

-- Sub-teks Sambutan
local WelcomeText = Instance.new("TextLabel")
WelcomeText.Parent = CenterContainer
WelcomeText.BackgroundTransparency = 1
WelcomeText.Position = UDim2.new(0, 0, 0, 95)
WelcomeText.Size = UDim2.new(1, 0, 0, 20)
WelcomeText.Font = Enum.Font.GothamMedium
WelcomeText.Text = "Welcome, " .. LocalPlayer.Name
WelcomeText.TextColor3 = Color3.fromRGB(200, 200, 200)
WelcomeText.TextSize = 12

-- Tombol EXECUTE
local ExecuteBtn = Instance.new("TextButton")
ExecuteBtn.Parent = CenterContainer
ExecuteBtn.BackgroundColor3 = Color3.fromRGB(200, 25, 25)
ExecuteBtn.Position = UDim2.new(0.5, -140, 0, 130)
ExecuteBtn.Size = UDim2.new(0, 280, 0, 42)
ExecuteBtn.Font = Enum.Font.GothamBold
ExecuteBtn.Text = "EXECUTE"
ExecuteBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecuteBtn.TextSize = 14
ExecuteBtn.AutoButtonColor = true

local ExecCorner = Instance.new("UICorner")
ExecCorner.CornerRadius = UDim.new(0, 8)
ExecCorner.Parent = ExecuteBtn

-- Tombol Join Discord
local DiscordBtn = Instance.new("TextButton")
DiscordBtn.Parent = CenterContainer
DiscordBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
DiscordBtn.Position = UDim2.new(0.5, -140, 0, 182)
DiscordBtn.Size = UDim2.new(0, 280, 0, 38)
DiscordBtn.Font = Enum.Font.GothamMedium
DiscordBtn.Text = "Join Discord"
DiscordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
DiscordBtn.TextSize = 13
DiscordBtn.AutoButtonColor = true

local DiscCorner = Instance.new("UICorner")
DiscCorner.CornerRadius = UDim.new(0, 8)
DiscCorner.Parent = DiscordBtn

local DiscStroke = Instance.new("UIStroke")
DiscStroke.Parent = DiscordBtn
DiscStroke.Color = Color3.fromRGB(200, 25, 25)
DiscStroke.Thickness = 1

-- Tombol Donate
local DonateBtn = Instance.new("TextButton")
DonateBtn.Parent = CenterContainer
DonateBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
DonateBtn.Position = UDim2.new(0.5, -140, 0, 230)
DonateBtn.Size = UDim2.new(0, 280, 0, 38)
DonateBtn.Font = Enum.Font.GothamMedium
DonateBtn.Text = "Donate"
DonateBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
DonateBtn.TextSize = 13
DonateBtn.AutoButtonColor = true

local DonCorner = Instance.new("UICorner")
DonCorner.CornerRadius = UDim.new(0, 8)
DonCorner.Parent = DonateBtn

local DonStroke = Instance.new("UIStroke")
DonStroke.Parent = DonateBtn
DonStroke.Color = Color3.fromRGB(200, 25, 25)
DonStroke.Thickness = 1


-- 2. MENU UTAMA HUB (Tersembunyi sebelum tombol Execute ditekan)
local MainHubWindow = Instance.new("Frame")
MainHubWindow.Name = "MainHubWindow"
MainHubWindow.Parent = ScreenGui
MainHubWindow.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainHubWindow.Position = UDim2.new(0.5, -175, 0.5, -125)
MainHubWindow.Size = UDim2.new(0, 350, 0, 250)
MainHubWindow.AnchorPoint = Vector2.new(0.5, 0.5)
MainHubWindow.Visible = false

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


-- FUNGSI TOMBOL
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
