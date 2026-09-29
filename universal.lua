-- =================================================================
-- Grudins Hub - Universal Script (Fallback / Non-Supported Games)
-- =================================================================

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- Hapus UI Universal lama jika ada
if CoreGui:FindFirstChild("GrudinsHubUniversal") then
    CoreGui.GrudinsHubUniversal:Destroy()
end

-- Notifikasi bahwa Universal Script Berjalan
local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", {
    Title = "Grudins Hub",
    Text = "Game tidak memiliki script khusus. Mengaktifkan Universal Mode!",
    Duration = 5
})

-- Membuat UI Sederhana untuk Universal Menu (Contoh: Float Menu / Panel)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GrudinsHubUniversal"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

-- Main Frame Universal Hub
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -125)
MainFrame.Size = UDim2.new(0, 350, 0, 250)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Parent = MainFrame
UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.Thickness = 1.5

-- Judul Universal Hub
local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 15, 0, 15)
Title.Size = UDim2.new(1, -30, 0, 30)
Title.Font = Enum.Font.GothamBold
Title.Text = "GRUDINS HUB : UNIVERSAL"
Title.TextColor3 = Color3.fromRGB(255, 50, 50)
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Status Info Game
local GameStatus = Instance.new("TextLabel")
GameStatus.Parent = MainFrame
GameStatus.BackgroundTransparency = 1
GameStatus.Position = UDim2.new(0, 15, 0, 50)
GameStatus.Size = UDim2.new(1, -30, 0, 20)
GameStatus.Font = Enum.Font.GothamMedium
GameStatus.Text = "Place ID: " .. tostring(game.PlaceId)
GameStatus.TextColor3 = Color3.fromRGB(180, 180, 180)
GameStatus.TextSize = 11
GameStatus.TextXAlignment = Enum.TextXAlignment.Left

-- Garis Pembatas
local Divider = Instance.new("Frame")
Divider.Parent = MainFrame
Divider.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Divider.BorderSizePixel = 0
Divider.Position = UDim2.new(0, 15, 0, 80)
Divider.Size = UDim2.new(1, -30, 0, 1)

-- Tempat Fitur Universal (Contoh: WalkSpeed, JumpPower, ESP Sederhana)
local ContentLabel = Instance.new("TextLabel")
ContentLabel.Parent = MainFrame
ContentLabel.BackgroundTransparency = 1
ContentLabel.Position = UDim2.new(0, 15, 0, 95)
ContentLabel.Size = UDim2.new(1, -30, 0, 100)
ContentLabel.Font = Enum.Font.Gotham
ContentLabel.Text = "Fitur Universal aktif:\n- Gunakan panel ini untuk fitur dasar.\n- Hubungi admin jika ingin request game baru."
ContentLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
ContentLabel.TextSize.TextSize = 12
ContentLabel.TextWrapped = true
ContentLabel.TextXAlignment = Enum.TextXAlignment.Left
ContentLabel.TextYAlignment = Enum.TextYAlignment.Top

-- Tombol Close / Minimize Hub
local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = MainFrame
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 30, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 15)
CloseBtn.Size = UDim2.new(0, 20, 0, 20)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 11

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 4)
CloseCorner.Parent = CloseBtn

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

print("[Grudins Hub] Universal script berhasil dimuat!")
