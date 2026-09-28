-- Grudins Hub Loader
local PlaceId = game.PlaceId

-- Base URL GitHub kamu (ubah Username & NamaRepo)
local baseURL = "https://raw.githubusercontent.com/UsernameKamu/GrudinsHub/main/"

-- Daftar ID Game dan file script-nya
local supportedGames = {
    [1234567890] = "scripts/games/steal_a_egg.lua", -- Ganti dengan PlaceId "Steal a Egg"
    -- [ID_GAME_LAIN] = "scripts/games/game_lainnya.lua",
}

-- Cek game yang sedang dimainkan
local targetScript = supportedGames[PlaceId]

if targetScript then
    print("[Grudins Hub] Game terdeteksi, memuat script...")
    loadstring(game:HttpGet(baseURL .. targetScript))()
else
    print("[Grudins Hub] Game tidak terdeteksi, memuat Universal Menu...")
    loadstring(game:HttpGet(baseURL .. "scripts/universal.lua"))()
end
