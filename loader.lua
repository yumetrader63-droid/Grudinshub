-- =================================================================
-- Grudins Hub Loader (Test Public Roblox Asset ID)
-- =================================================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

if CoreGui:FindFirstChild("GrudinsHubLoader") then
    CoreGui.GrudinsHubLoader:Destroy()
end

-- Menggunakan Asset ID Publik Roblox untuk tes (Contoh: Ikon / Gambar bawaan Roblox yang valid)
local TestLogoUrl = "rbxassetid://6023426915" -- Contoh Asset ID ikon verifikasi/logo publik

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GrudinsHubLoader"
ScreenGui.ResetOnSpawn = false

local successUI = pcall(function()
    ScreenGui.Parent = CoreGui
end)
if not successUI then
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

-- Background Gelap Transparan
local FullscreenBg = Instance.new("Frame")
FullscreenBg.Parent = ScreenGui
FullscreenBg.Size = UDim2.new(1, 0, 1, 0)
FullscreenBg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
FullscreenBg.BackgroundTransparency = 0.65
FullscreenBg.BorderSizePixel = 0

-- Container Tengah
local CenterContainer = Instance.new("Frame")
CenterContainer.Parent = FullscreenBg
CenterContainer.BackgroundTransparency = 1
CenterContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
CenterContainer.Size = UDim2.new(0, 320, 0, 250)
CenterContainer.AnchorPoint = Vector2.new(0.5, 0.5)

-- Logo Image Test
local LogoImage = Instance.new("ImageLabel")
LogoImage.Parent = CenterContainer
LogoImage.BackgroundTransparency = 1
LogoImage.Position = UDim2.new(0.5, -30, 0, 0)
LogoImage.Size = UDim2.new(0, 60, 0, 60)
LogoImage.Image = TestLogoUrl
LogoImage.ScaleType = Enum.ScaleType.Fit

-- Judul
local TitleText = Instance.new("TextLabel")
TitleText.Parent = CenterContainer
TitleText.BackgroundTransparency = 1
TitleText.Position = UDim2.new(0, 0, 0, 70)
TitleText.Size = UDim2.new(1, 0, 0, 30)
TitleText.Font = Enum.Font.GothamBold
TitleText.Text = "TEST ASSET ID PUBLIK"
TitleText.TextColor3 = Color3.fromRGB(255, 50, 50)
TitleText.TextSize = 15

-- Tombol Execute (Untuk keluar tes)
local ExecuteBtn = Instance.new("TextButton")
ExecuteBtn.Parent = CenterContainer
ExecuteBtn.BackgroundColor3 = Color3.fromRGB(200, 25, 25)
ExecuteBtn.Position = UDim2.new(0.5, -140, 0, 120)
ExecuteBtn.Size = UDim2.new(0, 280, 0, 40)
ExecuteBtn.Font = Enum.Font.GothamBold
ExecuteBtn.Text = "TUTUP TEST"
ExecuteBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecuteBtn.TextSize = 14

local ExecCorner = Instance.new("UICorner")
ExecCorner.CornerRadius = UDim.new(0, 8)
ExecCorner.Parent = ExecuteBtn

ExecuteBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)
