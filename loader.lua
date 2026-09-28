-- =================================================================
-- Grudins Hub Loader (Clean UI Professional Version)
-- =================================================================

local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Hapus UI lama jika loader dijalankan ulang
if CoreGui:FindFirstChild("GrudinsHubLoader") then
    CoreGui.GrudinsHubLoader:Destroy()
end

-- Asset ID Logo kamu yang sudah di-upload sebelumnya
local HubLogoUrl = "rbxassetid://122412612342169"

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

-- Background Gelap Semi-Transparan Full Layar (Tanpa gambar eksternal)
local FullscreenBg = Instance.new("Frame")
FullscreenBg.Name = "FullscreenBg"
FullscreenBg.Parent = ScreenGui
FullscreenBg.Size = UDim2.new(1, 0, 1, 0)
FullscreenBg.Position = UDim2.new(0, 0, 0, 0)
FullscreenBg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
FullscreenBg.BackgroundTransparency = 0.65 -- Efek gelap transparan yang elegan
FullscreenBg.BorderSizePixel = 0

-- Main Frame (Kotak Menu Utama di Tengah-tengah Layar)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = FullscreenBg
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 380, 0, 290)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)

local UIStroke = Instance.new("UIStroke")
UIStroke.Parent = MainFrame
UIStroke.Color = Color3.fromRGB(230, 30, 30)
UIStroke.Thickness = 2

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

-- Title Bar (Header Merah di Atas Kotak)
local TitleBar = Instance.new("Frame")
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(200, 25, 25)
TitleBar.Size = UDim2.new(1, 0, 0, 38)
TitleBar.BorderSizePixel = 0

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = TitleBar

local FixCover = Instance.new("Frame")
FixCover.Parent = TitleBar
FixCover.BackgroundColor3 = Color3.fromRGB(200, 25, 25)
FixCover.Position = UDim2.new(0, 0, 1, -5)
FixCover.Size = UDim2.new(1, 0, 0, 5)
FixCover.BorderSizePixel = 0

local TitleText = Instance.new("TextLabel")
TitleText.Parent = TitleBar
TitleText.BackgroundTransparency = 1
TitleText.Size = UDim2.new(1, 0, 1, 0)
TitleText.Font = Enum.Font.GothamBold
TitleText.Text = "GRUDINS HUB"
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.TextSize = 15

-- Logo Image (Di dalam kotak tengah)
local LogoImage = Instance.new("ImageLabel")
LogoImage.Parent = MainFrame
LogoImage.BackgroundTransparency = 1
LogoImage.Position = UDim2.new(0.5, -25, 0, 48)
LogoImage.Size = UDim2.new(0, 50, 0, 50)
LogoImage.Image = HubLogoUrl
LogoImage.ScaleType = Enum.ScaleType.Fit

-- Teks Sambutan
local WelcomeText = Instance.new("TextLabel")
WelcomeText.Parent = MainFrame
WelcomeText.BackgroundTransparency = 1
WelcomeText.Position = UDim2.new(0, 0, 0, 102)
WelcomeText.Size = UDim2.new(1, 0, 0, 22)
WelcomeText.Font = Enum.Font.GothamMedium
WelcomeText.Text = "Welcome to GrudinsHub"
WelcomeText.TextColor3 = Color3.fromRGB(220, 220, 220)
WelcomeText.TextSize = 13

-- Tombol EXECUTE (Tepat di tengah, ukuran besar)
local ExecuteBtn = Instance.new("TextButton")
ExecuteBtn.Parent = MainFrame
ExecuteBtn.BackgroundColor3 = Color3.fromRGB(200, 25, 25)
ExecuteBtn.Position = UDim2.new(0.5, -150, 0, 135)
ExecuteBtn.Size = UDim2.new(0, 300, 0, 38)
ExecuteBtn.Font = Enum.Font.GothamBold
ExecuteBtn.Text = "EXECUTE"
ExecuteBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecuteBtn.TextSize = 14
ExecuteBtn.AutoButtonColor = true

local ExecCorner = Instance.new("UICorner")
ExecCorner.CornerRadius = UDim.new(0, 6)
ExecCorner.Parent = ExecuteBtn

-- Tombol Join Discord (Di bawah Execute, tertata rapi di tengah)
local DiscordBtn = Instance.new("TextButton")
DiscordBtn.Parent = MainFrame
DiscordBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
DiscordBtn.Position = UDim2.new(0.5, -150, 0, 182)
DiscordBtn.Size = UDim2.new(0, 300, 0, 34)
DiscordBtn.Font = Enum.Font.GothamMedium
DiscordBtn.Text = "Join Discord"
DiscordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
DiscordBtn.TextSize = 13
DiscordBtn.AutoButtonColor = true

local DiscCorner = Instance.new("UICorner")
DiscCorner.CornerRadius = UDim.new(0, 6)
DiscCorner.Parent = DiscordBtn

local DiscStroke = Instance.new("UIStroke")
DiscStroke.Parent = DiscordBtn
DiscStroke.Color = Color3.fromRGB(200, 25, 25)
DiscStroke.Thickness = 1

-- Tombol Donate (Berjajar rapi di bawah Discord)
local DonateBtn = Instance.new("TextButton")
DonateBtn.Parent = MainFrame
DonateBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
DonateBtn.Position = UDim2.new(0.5, -150, 0, 226)
DonateBtn.Size = UDim2.new(0, 300, 0, 34)
DonateBtn.Font = Enum.Font.GothamMedium
DonateBtn.Text = "Donate"
DonateBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
DonateBtn.TextSize = 13
DonateBtn.AutoButtonColor = true

local DonCorner = Instance.new("UICorner")
DonCorner.CornerRadius = UDim.new(0, 6)
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
    FullscreenBg:Destroy() -- Menghilangkan menu welcome saat tombol execute ditekan
    MainHubWindow.Visible = true -- Memunculkan menu utama hub
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

-- Fitur Dragging untuk Menu Utama Hub agar bisa digeser di layar HP
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
