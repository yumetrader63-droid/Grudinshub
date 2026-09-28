-- =================================================================
-- Grudins Hub Loader (UI Test Version)
-- =================================================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local baseURL = "https://raw.githubusercontent.com/yumetrader63-droid/Grudinshub/main/"
local HubLogo = baseURL .. "assets/grudinslogo.png"

-- Hapus UI lama jika loader dijalankan ulang
if CoreGui:FindFirstChild("GrudinsHubLoader") then
    CoreGui.GrudinsHubLoader:Destroy()
end

-- Membuat ScreenGui utama
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GrudinsHubLoader"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Membuat Kotak Utama (Responsive menggunakan UIAspectRatioConstraint atau ukuran relatif)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20) -- Warna Hitam Elegan
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)

-- Efek Border/Garis Merah di pinggir kotak
local UIStroke = Instance.new("UIStroke")
UIStroke.Parent = MainFrame
UIStroke.Color = Color3.fromRGB(220, 20, 60) -- Warna Merah
UIStroke.Thickness = 2

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

-- Top Bar / Judul Kotak
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Parent = MainFrame
TitleLabel.BackgroundColor3 = Color3.fromRGB(220, 20, 60) -- Aksen Merah
TitleLabel.BorderSizePixel = 0
TitleLabel.Size = UDim2.new(1, 0, 0, 40)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "GRUDINS HUB"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 16

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10)
TitleCorner.Parent = TitleLabel

-- Memperbaiki sudut bawah TitleBar agar rata
local FixCorner = Instance.new("Frame")
FixCorner.Parent = TitleLabel
FixCorner.BackgroundColor3 = Color3.fromRGB(220, 20, 60)
FixCorner.BorderSizePixel = 0
FixCorner.Position = UDim2.new(0, 0, 1, -5)
FixCorner.Size = UDim2.new(1, 0, 0, 5)

-- Logo Image
local LogoImage = Instance.new("ImageLabel")
LogoImage.Parent = MainFrame
LogoImage.BackgroundTransparency = 1
LogoImage.Position = UDim2.new(0.5, -35, 0, 55)
LogoImage.Size = UDim2.new(0, 70, 0, 70)
LogoImage.Image = HubLogo

-- Status Text di bagian bawah
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Parent = MainFrame
StatusLabel.BackgroundTransparency = 1
StatusLabel.Position = UDim2.new(0, 10, 1, -45)
StatusLabel.Size = UDim2.new(1, -20, 0, 30)
StatusLabel.Font = Enum.Font.GothamMedium
StatusLabel.Text = "Status: Berhasil Dimuat!"
StatusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
StatusLabel.TextSize = 13

-- Efek Drag/Geser GUI agar bisa digerakkan di layar
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

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
