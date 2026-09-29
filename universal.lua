-- =================================================================
-- Grudins Hub - Universal Script (Fixed Minimize/Restore Position)
-- =================================================================

local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Hapus UI Universal lama jika dijalankan ulang
if CoreGui:FindFirstChild("GrudinsHubUniversal") then
    CoreGui.GrudinsHubUniversal:Destroy()
end

-- Asset Logo
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
-- Posisi awal pas di tengah layar (AnchorPoint 0.5, 0.5)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 350, 0, 260)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Visible = true
MainFrame.ZIndex = 10

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Parent = MainFrame
MainStroke.Color = Color3.fromRGB(255, 255, 255)
MainStroke.Thickness = 1.5

-- TopBar (Area untuk Dragging / Geser Window Utama)
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundTransparency = 1
TopBar.Size = UDim2.new(1, 0, 0, 45)
TopBar.ZIndex = 11

-- Logo di TopBar
local LogoIcon = Instance.new("ImageLabel")
LogoIcon.Parent = TopBar
LogoIcon.BackgroundTransparency = 1
LogoIcon.Position = UDim2.new(0, 15, 0, 10)
LogoIcon.Size = UDim2.new(0, 25, 0, 25)
LogoIcon.Image = HubLogoUrl
LogoIcon.ScaleType = Enum.ScaleType.Fit
LogoIcon.ZIndex = 12

-- Judul Grudins Hub Universal
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

-- Garis Pembatas TopBar
local Divider = Instance.new("Frame")
Divider.Parent = MainFrame
Divider.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Divider.BorderSizePixel = 0
Divider.Position = UDim2.new(0, 15, 0, 45)
Divider.Size = UDim2.new(1, -30, 0, 1)
Divider.ZIndex = 11

-- Konten / Fitur Universal di Dalam Frame
local ContentContainer = Instance.new("ScrollingFrame")
ContentContainer.Parent = MainFrame
ContentContainer.BackgroundTransparency = 1
ContentContainer.Position = UDim2.new(0, 15, 0, 55)
ContentContainer.Size = UDim2.new(1, -30, 1, -65)
ContentContainer.CanvasSize = UDim2.new(0, 0, 0, 300)
ContentContainer.ScrollBarThickness = 4
ContentContainer.ZIndex = 11

local ContentText = Instance.new("TextLabel")
ContentText.Parent = ContentContainer
ContentText.BackgroundTransparency = 1
ContentText.Size = UDim2.new(1, 0, 0, 250)
ContentText.Font = Enum.Font.Gotham
ContentText.Text = "• Status: Universal Mode Aktif\n• Place ID: " .. tostring(game.PlaceId) .. "\n\nGame ini tidak memiliki script khusus di database Grudins Hub, sehingga fitur universal dasar diaktifkan otomatis.\n\n- Gunakan tombol minimize (-) di atas untuk memperkecil hub menjadi ikon melayang."
ContentText.TextColor3 = Color3.fromRGB(210, 210, 210)
ContentText.TextSize = 12
ContentText.TextWrapped = true
ContentText.TextXAlignment = Enum.TextXAlignment.Left
ContentText.TextYAlignment = Enum.TextYAlignment.Top
ContentText.ZIndex = 11


-- =================================================================
-- 2. MINIMIZED ICON (LINGKARAN HITAM BERLOGO)
-- =================================================================
local MinimizedIcon = Instance.new("ImageButton")
MinimizedIcon.Name = "MinimizedIcon"
MinimizedIcon.Parent = ScreenGui
MinimizedIcon.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
-- Posisi awal ikon minimize di pojok kiri atas/tengah agar aman
MinimizedIcon.Position = UDim2.new(0.05, 0, 0.15, 0)
MinimizedIcon.Size = UDim2.new(0, 50, 0, 50)
MinimizedIcon.Visible = false
MinimizedIcon.AutoButtonColor = false
MinimizedIcon.ZIndex = 30

local IconCorner = Instance.new("UICorner")
IconCorner.CornerRadius = UDim.new(1, 0) -- Lingkaran penuh
IconCorner.Parent = MinimizedIcon

local IconStroke = Instance.new("UIStroke")
IconStroke.Parent = MinimizedIcon
IconStroke.Color = Color3.fromRGB(255, 50, 50)
IconStroke.Thickness = 2

-- Gambar Logo di Dalam Lingkaran
local IconLogo = Instance.new("ImageLabel")
IconLogo.Parent = MinimizedIcon
IconLogo.BackgroundTransparency = 1
IconLogo.Position = UDim2.new(0.5, -16, 0.5, -16)
IconLogo.Size = UDim2.new(0, 32, 0, 32)
IconLogo.Image = HubLogoUrl
IconLogo.ScaleType = Enum.ScaleType.Fit
IconLogo.ZIndex = 31


-- =================================================================
-- 3. FUNGSI MINIMIZE & RESTORE (Tanpa Geser Otomatis yang Rusak)
-- =================================================================
MinimizeBtn.MouseButton1Click:Connect(function()
    -- Sembunyikan menu utama, tampilkan ikon lingkaran
    MainFrame.Visible = false
    MinimizedIcon.Visible = true
end)

MinimizedIcon.MouseButton1Click:Connect(function()
    -- Sembunyikan ikon lingkaran, tampilkan kembali menu utama
    -- (Posisi MainFrame tidak diubah secara paksa agar tetap diam/stabil di tempatnya)
    MinimizedIcon.Visible = false
    MainFrame.Visible = true
end)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)


-- =================================================================
-- 4. SISTEM DRAGGING (Hanya Bergeser Saat Ditarik Manual)
-- =================================================================
local function makeDraggable(frame, dragHandle)
    local dragging = false
    local dragInput, dragStart, startPos

    dragHandle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            
            -- Ubah AnchorPoint sementara ke (0,0) agar perhitungan geser manual akurat
            frame.AnchorPoint = Vector2.new(0, 0)
            frame.Position = UDim2.new(0, frame.AbsolutePosition.X, 0, frame.AbsolutePosition.Y)
            
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

-- Terapkan fungsi drag (hanya aktif saat ditarik manual)
makeDraggable(MainFrame, TopBar)
makeDraggable(MinimizedIcon, MinimizedIcon)

print("[Grudins Hub] Universal script (Fixed Position) berhasil dimuat!")
