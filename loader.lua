-- =================================================================
-- Grudins Hub Loader (Fixed URL)
-- =================================================================

local PlaceId = game.PlaceId

-- URL disesuaikan dengan huruf kecil 'Grudinshub' sesuai screenshot kamu
local baseURL = "https://raw.githubusercontent.com/yumetrader63-droid/Grudinshub/main/"
local HubLogo = baseURL .. "assets/grudinslogo.png"

local supportedGames = {
    [1234567890] = { -- Ganti dengan PlaceId game kamu
        name = "Steal a Egg",
        script = "scripts/games/steal_a_egg.lua",
        icon = baseURL .. "assets/icons/steal_a_egg.png"
    },
}

local gameData = supportedGames[PlaceId]

if gameData then
    print("[Grudins Hub] Memuat script untuk: " .. gameData.name)
    local success, err = pcall(function()
        loadstring(game:HttpGet(baseURL .. gameData.script))()
    end)
    if not success then
        warn("[Grudins Hub] Gagal memuat script: " .. tostring(err))
    end
else
    print("[Grudins Hub] Game tidak terdaftar, memuat Universal Menu...")
    local success, err = pcall(function()
        loadstring(game:HttpGet(baseURL .. "scripts/universal.lua"))()
    end)
    if not success then
        warn("[Grudins Hub] Gagal memuat script universal: " .. tostring(err))
    end
end
