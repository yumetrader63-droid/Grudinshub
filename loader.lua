-- =================================================================
-- Grudins Hub - Ultimate Loader with Game Detection & Universal Support
-- =================================================================

local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local LocalPlayer = Players.LocalPlayer

-- Hapus UI lama jika loader dijalankan ulang
if CoreGui:FindFirstChild("GrudinsHubLoader") then
    CoreGui.GrudinsHubLoader:Destroy()
end

-- =================================================================
-- KONFIGURASI LINK SCRIPT GAME (Ganti URL dengan raw link GitHub kamu)
-- =================================================================
local SupportedGames = {
    -- Format: [PlaceId] = "Link_Raw_Script_Game_Kamu.lua"
    [2753915549] = "https://raw.githubusercontent.com/username/namarepo/main/games/bloxfruits.lua", -- Contoh Blox Fruits
    [142823291]  = "https://raw.githubusercontent.com/username/namarepo/main/games/dahood.lua",      -- Contoh Da Hood
}

-- Link Script Universal (Jika game tidak ada di dalam daftar SupportedGames di atas)
local UniversalScriptUrl = "https://raw.githubusercontent.com/username/namarepo/main/universal.lua"

-- Asset ID Utama
local HubBgUrl = "rbxassetid://76695249700487"
local HubLogoUrl = "rbxassetid://134447790437387"

-- =================================================================
-- PEMBUATAN UI UTAMA (LOADER)
-- =================================================================
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

-- Background Gambar Kustom Full Layar
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

-- Overlay Gelap Semi-Transparan
local DarkOverlay = Instance.new("Frame")
DarkOverlay.Name = "DarkOverlay"
DarkOverlay.Parent = FullscreenBg
DarkOverlay.Size = UDim2.new(1, 0, 1, 0)
DarkOverlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
DarkOverlay.BackgroundTransparency = 0.55
DarkOverlay.BorderSizePixel = 0
DarkOverlay.ZIndex = 1

-- Container Utama di Tengah Layar
local CenterContainer = Instance.new("Frame")
CenterContainer.Name = "CenterContainer"
CenterContainer.Parent = FullscreenBg
CenterContainer.BackgroundTransparency = 1
CenterContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
CenterContainer.Size = UDim2.new(0, 320, 0, 240)
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

-- Tombol EXECUTE (Teks Putih Bersih, Border Putih Rapi)
local ExecuteBtn = Instance.new("TextButton")
ExecuteBtn.Name = "ExecuteBtn"
ExecuteBtn.Parent = CenterContainer
ExecuteBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
ExecuteBtn.Position = UDim2.new(0.5, -140, 0, 85)
ExecuteBtn.Size = UDim2.new(0, 280, 0, 42)
ExecuteBtn.Font = Enum.Font.GothamBold
ExecuteBtn.Text = "EXECUTE"
ExecuteBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecuteBtn.TextSize = 13
ExecuteBtn.AutoButtonColor = false
ExecuteBtn.ZIndex = 3

local ExecCorner = Instance.new("UICorner")
ExecCorner.CornerRadius = UDim.new(0, 8)
ExecCorner.Parent = ExecuteBtn

local ExecStroke = Instance.new("UIStroke")
ExecStroke.Parent = ExecuteBtn
ExecStroke.Color = Color3.fromRGB(255, 255, 255)
ExecStroke.Thickness = 1


-- CONTAINER TOMBOL SEJAJAR (Discord & Donate)
local RowContainer = Instance.new("Frame")
RowContainer.Parent = CenterContainer
RowContainer.BackgroundTransparency = 1
RowContainer.Position = UDim2.new(0.5, -140, 0, 140)
RowContainer.Size = UDim2.new(0, 280, 0, 42)
RowContainer.ZIndex = 3

-- Fungsi Pembuat Tombol Sejajar (Horizontal)
local function createHorizontalButton(name, text, xPos)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Parent = RowContainer
    btn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    btn.Position = UDim2.new(0, xPos, 0, 0)
    btn.Size = UDim2.new(0, 133, 0, 42)
    btn.Font = Enum.Font.GothamBold
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 12
    btn.AutoButtonColor = false
    btn.ZIndex = 3

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn

    local stroke = Instance.new("UIStroke")
    stroke.Parent = btn
    stroke.Color = Color3.fromRGB(255, 255, 255)
    stroke.Thickness = 1

    -- Animasi Interaksi Tombol
    btn.MouseButton1Down:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
    end)
    btn.MouseButton1Up:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(15, 15, 15)}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(15, 15, 15)}):Play()
    end)

    return btn
end

-- Tombol Discord & Donate Berdampingan
local DiscordBtn = createHorizontalButton("DiscordBtn", "💬  Discord", 0)
local DonateBtn = createHorizontalButton("DonateBtn", "🎁  Donate", 147)


-- Animasi Tombol Execute
ExecuteBtn.MouseButton1Down:Connect(function()
    TweenService:Create(ExecuteBtn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
end)
ExecuteBtn.MouseButton1Up:Connect(function()
    TweenService:Create(ExecuteBtn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(15, 15, 15)}):Play()
end)


-- =================================================================
-- POP-UP LOADING (Floating Statis, Ditengah Layar)
-- =================================================================
local LoadingPopup = Instance.new("Frame")
LoadingPopup.Name = "LoadingPopup"
LoadingPopup.Parent = ScreenGui
LoadingPopup.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
LoadingPopup.Position = UDim2.new(0.5, 0, 0.5, 0)
LoadingPopup.Size = UDim2.new(0, 280, 0, 190)
LoadingPopup.AnchorPoint = Vector2.new(0.5, 0.5)
LoadingPopup.Visible = false
LoadingPopup.ZIndex = 20

local PopupCorner = Instance.new("UICorner")
PopupCorner.CornerRadius = UDim.new(0, 12)
PopupCorner.Parent = LoadingPopup

local PopupStroke = Instance.new("UIStroke")
PopupStroke.Parent = LoadingPopup
PopupStroke.Color = Color3.fromRGB(230, 30, 30)
PopupStroke.Thickness = 2

-- Logo di Dalam Pop-up Loading
local PopupLogo = Instance.new("ImageLabel")
PopupLogo.Parent = LoadingPopup
PopupLogo.BackgroundTransparency = 1
PopupLogo.Position = UDim2.new(0.5, -25, 0, 15)
PopupLogo.Size = UDim2.new(0, 50, 0, 50)
PopupLogo.Image = HubLogoUrl
PopupLogo.ScaleType = Enum.ScaleType.Fit
PopupLogo.ZIndex = 21

-- Teks Animasi "Loading"
local LoadingText = Instance.new("TextLabel")
LoadingText.Parent = LoadingPopup
LoadingText.BackgroundTransparency = 1
LoadingText.Position = UDim2.new(0, 0, 0, 72)
LoadingText.Size = UDim2.new(1, 0, 0, 25)
LoadingText.Font = Enum.Font.GothamBold
LoadingText.Text = "LOADING..."
LoadingText.TextColor3 = Color3.fromRGB(255, 50, 50)
LoadingText.TextSize = 15
LoadingText.ZIndex = 21

-- Teks Info Game & Status Pengecekan
local GameInfoText = Instance.new("TextLabel")
GameInfoText.Parent = LoadingPopup
GameInfoText.BackgroundTransparency = 1
GameInfoText.Position = UDim2.new(0, 15, 0, 105)
GameInfoText.Size = UDim2.new(1, -30, 0, 40)
GameInfoText.Font = Enum.Font.GothamMedium
GameInfoText.Text = "Mendeteksi game..."
GameInfoText.TextColor3 = Color3.fromRGB(200, 200, 200)
GameInfoText.TextSize = 11
GameInfoText.TextWrapped = true
GameInfoText.ZIndex = 21

-- Label Status Mode (Supported / Universal)
local ModeStatusText = Instance.new("TextLabel")
ModeStatusText.Parent = LoadingPopup
ModeStatusText.BackgroundTransparency = 1
ModeStatusText.Position = UDim2.new(0, 15, 0, 150)
ModeStatusText.Size = UDim2.new(1, -30, 0, 20)
ModeStatusText.Font = Enum.Font.GothamBold
ModeStatusText.Text = ""
ModeStatusText.TextColor3 = Color3.fromRGB(100, 255, 100)
ModeStatusText.TextSize = 11
ModeStatusText.ZIndex = 21


-- =================================================================
-- SISTEM LOGIKA EXECUTE & PENGECEKAN GAME OTOMATIS
-- =================================================================
ExecuteBtn.MouseButton1Click:Connect(function()
    -- Hilangkan background utama dan tampilkan pop-up loading
    FullscreenBg:Destroy()
    LoadingPopup.Visible = true

    local targetScriptUrl = nil
    local gameName = "Roblox Game"

    -- Ambil informasi nama game via MarketplaceService
    local success, gameInfo = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    
    if success and gameInfo and gameInfo.Name then
        gameName = gameInfo.Name
    end

    GameInfoText.Text = "Game: " .. gameName

    -- Animasi titik-titik loading bergerak halus
    local isLoaded = false
    task.spawn(function()
        local dots = {"", ".", "..", "..."}
        while not isLoaded do
            for _, d in ipairs(dots) do
                if not LoadingPopup.Parent then break end
                LoadingText.Text = "LOADING" .. d
                task.wait(0.4)
            end
        end
    end)

    -- Proses Pengecekan Game di Daftar Supported Games
    task.wait(1.2) -- Jeda sebentar untuk efek loading yang mulus

    if SupportedGames[game.PlaceId] then
        -- Jika game terdaftar di Supported Games
        targetScriptUrl = SupportedGames[game.PlaceId]
        ModeStatusText.TextColor3 = Color3.fromRGB(50, 255, 100) -- Hijau
        ModeStatusText.Text = "[ Status: Supported Game Script ]"
    else
        -- Jika tidak terdaftar, arahkan ke Universal Script
        targetScriptUrl = UniversalScriptUrl
        ModeStatusText.TextColor3 = Color3.fromRGB(255, 170, 50) -- Kuning/Orange
        ModeStatusText.Text = "[ Status: Universal Script Mode ]"
    end

    task.wait(1.5)
    isLoaded = true

    -- Tutup pop-up loading
    LoadingPopup:Destroy()

    -- Eksekusi script yang sesuai (Game spesifik atau Universal)
    if targetScriptUrl then
        local loadSuccess, err = pcall(function()
            loadstring(game:HttpGet(targetScriptUrl))()
        end)
        
        if not loadSuccess then
            warn("[Grudins Hub] Gagal memuat script: " .. tostring(err))
        end
    end
end)


-- =================================================================
-- FUNGSI TOMBOL LAINNYA (Discord & Donate)
-- =================================================================
DiscordBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard("https://discord.gg/linkdiscordmu")
        DiscordBtn.Text = "💬  Copied!"
        task.wait(1.5)
        DiscordBtn.Text = "💬  Discord"
    end
end)

DonateBtn.MouseButton1Click:Connect(function()
    print("[Grudins Hub] Terima kasih sudah ingin donate!")
end)
