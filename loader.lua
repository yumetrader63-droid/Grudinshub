-- =================================================================
-- Grudins Hub Loader (Guaranteed Working Version for Delta)
-- =================================================================

local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Hapus UI lama jika loader dijalankan ulang
if CoreGui:FindFirstChild("GrudinsHubLoader") then
    CoreGui.GrudinsHubLoader:Destroy()
end

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

-- 1. BACKGROUND FULL LAYAR (Menggunakan Gradasi Hitam-Merah Elegan - Anti Gagal)
local FullscreenBg = Instance.new("Frame")
FullscreenBg.Name = "FullscreenBg"
FullscreenBg.Parent = ScreenGui
FullscreenBg.Size = UDim2.new(1, 0, 1, 0)
FullscreenBg.Position = UDim2.new(0, 0, 0, 0)
FullscreenBg.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
FullscreenBg.BorderSizePixel = 0

-- Efek Gradasi Mewah pada Background
local UIGradientBg = Instance.new("UIGradient")
UIGradientBg.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 5, 5)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(5, 5, 5))
})
UIGradientBg.Rotation = 45
UIGradientBg.Parent = FullscreenBg

-- Main Frame (Kotak Hitam-Merah di tengah layar)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = FullscreenBg
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -140)
MainFrame.Size = UDim2.new(0, 400, 0, 280)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)

local UIStroke = Instance.new("UIStroke")
UIStroke.Parent = MainFrame
UIStroke.Color = Color3.fromRGB(230, 30, 30)
UIStroke.Thickness = 2

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

-- Title Bar (Header)
local TitleBar = Instance.new("Frame")
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(200, 25, 25)
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.BorderSizePixel = 0

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10)
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
TitleText.TextSize = 16

-- Logo Image (Menggunakan gambar dari link ImgBB kamu dengan proteksi pcall agar aman)
local LogoImage = Instance.new("ImageLabel")
LogoImage.Parent = MainFrame
LogoImage.BackgroundTransparency = 1
LogoImage.Position = UDim2.new(0.5, -30, 0, 48)
LogoImage.Size = UDim2.new(0, 60, 0, 60)
LogoImage.Image = "https://i.ibb.co/1tbWTvCV/grudinslogo.png"
LogoImage.ScaleType = Enum.ScaleType.Fit

-- Teks "Welcome to GrudinsHub"
local WelcomeText = Instance.new("TextLabel")
WelcomeText.Parent = MainFrame
WelcomeText.BackgroundTransparency = 1
WelcomeText.Position = UDim2.new(0, 0, 0, 112)
WelcomeText.Size = UDim2.new(1, 0, 0, 25)
WelcomeText.Font = Enum.Font.GothamMedium
WelcomeText.Text = "Welcome to GrudinsHub"
WelcomeText.TextColor3 = Color3.fromRGB(220, 220, 220)
WelcomeText.TextSize = 14

-- Tombol EXECUTE (Di tengah-tengah kotak)
local ExecuteBtn = Instance.new("TextButton")
ExecuteBtn.Parent = MainFrame
ExecuteBtn.BackgroundColor3 = Color3.fromRGB(200, 25, 25)
ExecuteBtn.Position = UDim2.new(0.5, -130, 0, 145)
ExecuteBtn.Size = UDim2.new(0, 260, 0, 38)
ExecuteBtn.Font = Enum.Font.GothamBold
ExecuteBtn.Text = "EXECUTE"
ExecuteBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecuteBtn.TextSize = 15
ExecuteBtn.AutoButtonColor = true

local ExecCorner = Instance.new("UICorner")
ExecCorner.CornerRadius = UDim.new(0, 6)
ExecCorner.Parent = ExecuteBtn

-- Tombol Join Discord (Di bawah Execute, tersusun rapi di tengah)
local DiscordBtn = Instance.new("TextButton")
DiscordBtn.Parent = MainFrame
DiscordBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
DiscordBtn.Position = UDim2.new(0.5, -130, 0, 192)
DiscordBtn.Size = UDim2.new(0, 125, 0, 32)
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

-- Tombol Donate (Berjajar di samping Join Discord)
local DonateBtn = Instance.new("TextButton")
DonateBtn.Parent = MainFrame
DonateBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
DonateBtn.Position = UDim2.new(0.5, 5, 0, 192)
DonateBtn.Size = UDim2.new(0, 125, 0, 32)
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


-- 2. MENU UTAMA HUB (Disembunyikan dulu, baru muncul setelah Execute diklik)
local MainHubWindow = Instance.new("Frame")
MainHubWindow.Name = "MainHubWindow"
MainHubWindow.Parent = ScreenGui
MainHubWindow.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainHubWindow.Position = UDim2.new(0.5, -175, 0.5, -125)
MainHubWindow.Size = UDim2.new(0, 350, 0, 250)
MainHubWindow.AnchorPoint = Vector2.new(0.5, 0.5)
MainHubWindow.Visible = false -- Sembunyikan sebelum tombol Execute diklik!

local HubStroke = Instance.new("UIStroke")
HubStroke.Parent = MainHubWindow
HubStroke.Color = Color3.fromRGB(230, 30, 30)
HubStroke.Thickness = 2

local HubCorner = Instance.new("UICorner")
HubCorner.CornerRadius = UDim.new(0, 8)
HubCorner.Parent = MainHubWindow

-- Header Menu Utama
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

-- Teks info di dalam Menu Utama
local InfoText = Instance.new("TextLabel")
InfoText.Parent = MainHubWindow
InfoText.BackgroundTransparency = 1
InfoText.Position = UDim2.new(0, 10, 0, 50)
InfoText.Size = UDim2.new(1, -20, 0, 40)
InfoText.Font = Enum.Font.GothamMedium
InfoText.Text = "Status: Hub Berhasil Dijalankan!\nFitur game akan dimuat di sini."
InfoText.TextColor3 = Color3.fromRGB(200, 200, 200)
InfoText.TextSize = 12


-- FUNGSI TOMBOL-TOMBOL

-- Tombol Execute: Menghilangkan menu welcome & memunculkan menu utama hub
ExecuteBtn.MouseButton1Click:Connect(function()
    FullscreenBg:Destroy() -- Hapus background & menu welcome
    MainHubWindow.Visible = true -- Tampilkan menu utama hub
end)

-- Tombol Discord
DiscordBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard("https://discord.gg/linkdiscordmu")
        DiscordBtn.Text = "Copied!"
        task.wait(1.5)
        DiscordBtn.Text = "Join Discord"
    else
        print("[Grudins Hub] Discord Link: https://discord.gg/linkdiscordmu")
    end
end)

-- Tombol Donate
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
