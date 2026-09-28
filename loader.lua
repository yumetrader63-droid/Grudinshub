-- =================================================================
-- Grudins Hub Loader (Final Fixed Version for Delta)
-- =================================================================

local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Hapus UI lama jika loader dijalankan ulang agar tidak menumpuk
if CoreGui:FindFirstChild("GrudinsHubLoader") then
    CoreGui.GrudinsHubLoader:Destroy()
end

-- Base URL GitHub kamu (Pastikan huruf besar/kecil 'Grudinshub' sesuai)
local baseURL = "https://raw.githubusercontent.com/yumetrader63-droid/Grudinshub/main/"
local HubLogoUrl = baseURL .. "assets/grudinslogo.png"

-- ScreenGui Utama
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GrudinsHubLoader"
ScreenGui.ResetOnSpawn = false

-- Ambil CoreGui, fallback ke PlayerGui jika dibatasi executor
local successUI = pcall(function()
    ScreenGui.Parent = CoreGui
end)
if not successUI then
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

-- Main Frame (Kotak Hitam-Merah Responsif)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15) -- Hitam Elegan
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)

-- Border / Garis Pinggir Merah
local UIStroke = Instance.new("UIStroke")
UIStroke.Parent = MainFrame
UIStroke.Color = Color3.fromRGB(230, 30, 30) -- Merah Menyala
UIStroke.Thickness = 2

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

-- Title Bar (Header)
local TitleBar = Instance.new("Frame")
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(200, 25, 25)
TitleBar.Size = UDim2.new(1, 0, 0, 35)
TitleBar.BorderSizePixel = 0

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 8)
TitleCorner.Parent = TitleBar

-- Penutup sudut bawah TitleBar agar menyatu rapi
local FixCover = Instance.new("Frame")
FixCover.Parent = TitleBar
FixCover.BackgroundColor3 = Color3.fromRGB(200, 25, 25)
FixCover.Position = UDim2.new(0, 0, 1, -5)
FixCover.Size = UDim2.new(1, 0, 0, 5)
FixCover.BorderSizePixel = 0

-- Teks Judul "GRUDINS HUB"
local TitleText = Instance.new("TextLabel")
TitleText.Parent = TitleBar
TitleText.BackgroundTransparency = 1
TitleText.Size = UDim2.new(1, 0, 1, 0)
TitleText.Font = Enum.Font.GothamBold
TitleText.Text = "GRUDINS HUB"
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.TextSize = 14

-- Kotak Gambar Logo (ImageLabel)
local LogoImage = Instance.new("ImageLabel")
LogoImage.Parent = MainFrame
LogoImage.BackgroundTransparency = 1
LogoImage.Position = UDim2.new(0.5, -35, 0, 45)
LogoImage.Size = UDim2.new(0, 70, 0, 70)
LogoImage.Image = HubLogoUrl
LogoImage.ScaleType = Enum.ScaleType.Fit

-- Teks Status di Bagian Bawah
local StatusText = Instance.new("TextLabel")
StatusText.Parent = MainFrame
StatusText.BackgroundTransparency = 1
StatusText.Position = UDim2.new(0, 10, 1, -45)
StatusText.Size = UDim2.new(1, -20, 0, 30)
StatusText.Font = Enum.Font.GothamMedium
StatusText.Text = "Status: Berhasil Dimuat!"
StatusText.TextColor3 = Color3.fromRGB(200, 200, 200)
StatusText.TextSize = 12

-- Fitur Dragging (Bisa digeser-geser pakai sentuhan HP di Delta)
local dragging, dragInput, dragStart, startPos

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
