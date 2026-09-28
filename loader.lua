-- =================================================================
-- Grudins Hub Loader
-- =================================================================

local PlaceId = game.PlaceId

-- Ganti "UsernameKamu" dengan username GitHub kamu yang sebenarnya
local baseURL = "https://raw.githubusercontent.com/yumetrader63-droid/GrudinsHub/main/"

-- URL Aset Logo (bisa digunakan di UI Roblox kamu nantinya)
local HubLogo = baseURL .. "assets/grudinslogo.png"

-- Tabel daftar game yang didukung beserta script dan ikonnya
local supportedGames = {
    [1234567890] = { -- Ganti dengan PlaceId game "Steal a Egg"
        name = "Steal a Egg",
        script = "scripts/games/steal_a_egg.lua",
        icon = baseURL .. "assets/icons/steal_a_egg.png"
    },
    -- Tambahkan game lain di sini dengan format yang sama:
    -- [PLACE_ID_LAIN] = {
    --     name = "Nama Game Lain",
    --     script = "scripts/games/game_lainnya.lua",
    --     icon = baseURL .. "assets/icons/game_lainnya.png"
    -- },
}

-- Cek game yang sedang dimainkan
local gameData = supportedGames[PlaceId]

print("[Grudins Hub] Memuat Hub...")
print("[Grudins Hub] Logo URL: " .. HubLogo)

if gameData then
    print("[Grudins Hub] Game terdeteksi: " .. gameData.name)
    -- Eksekusi script khusus game
    local success, err = pcall(function()
        loadstring(game:HttpGet(baseURL .. gameData.script))()
    end)
    
    if not success then
        warn("[Grudins Hub] Gagal memuat script game: " .. tostring(err))
    end
else
    print("[Grudins Hub] Game tidak terdeteksi, memuat Universal Menu...")
    -- Eksekusi script universal jika game tidak terdaftar
    local success, err = pcall(function()
        loadstring(game:HttpGet(baseURL .. "scripts/universal.lua"))()
    end)
    
    if not success then
        warn("[Grudins Hub] Gagal memuat script universal: " .. tostring(err))
    end
end
