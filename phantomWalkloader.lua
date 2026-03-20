-- ==========================================
-- PHANTOMWALK PRO | ULTIMATE LOADER V3.1
-- Developer: Kucing garong .. utf8.char(128572)
-- Features: Username Detection, Custom Splash, Anti-Alien
-- ==========================================

local player = game:GetService("Players").LocalPlayer
local myName = player.Name 

-- ==========================================
-- ⚙️ [ AREA PENGATURAN EL KAPITAN ] ⚙️
-- WAJIB ISI DENGAN USERNAME ASLI ROBLOX!
-- ==========================================

local elKapitanName = "kenalin_r" 
local ayangName = "catcatkitty098"    

local pesanBuatAyang = "mangat ayyyy! " .. utf8.char(10084) .. utf8.char(128150)

-- 🌟 Daftar Spesial & VIP Member
local specialMembers = {
    ["OmGifar133"] = utf8.char(128081) .. " OM GIFAR " .. utf8.char(128081),
    ["Anomali_9950"] = "BEST PRENNN",
    ["jaja"] = "BEST PRENNN",
    ["hsj"] = "BEST PRENNN",
    ["haj"] = "BEST PRENNN",
    ["gahah"] = "BEST PRENNN",
    ["haha"] = "BEST PRENNN",
    ["vsga"] = "BEST PRENNN",
    ["hahh"] = "BEST PRENNN",
    ["ajjai"] = "BEST PRENNN",
}

local vipMembers = {
    ["KawanVIPSatu"] = true,
    ["KawanVIPDua"] = true
}

local freeMembers = {
    ["BocilGratisan1"] = true,
    ["BocilGratisan2"] = true
}

-- Link utama eksekusi script
local scriptLink = "https://raw.githubusercontent.com/PhantomWalk-PRO-1/PW-Data/main/PhantomWalk_Main.lua"

-- Link raw GitHub yang berisi daftar KEY (Buat file txt di repo GitHub-mu)
local keyDatabaseURL = "https://raw.githubusercontent.com/PhantomWalk-PRO-1/PW-Data/main/DaftarKey.txt"

-- ==========================================
-- 🚀 FUNGSI MESIN LOADER & UI
-- ==========================================

local sg = Instance.new("ScreenGui", game.CoreGui)
sg.Name = "PhantomAuthPro"

local function executeMain()
    local r = request or http_request or (http and http.request)
    local mainCode = ""
    pcall(function()
        if r then mainCode = r({Url = scriptLink .. "?v=" .. math.random(1,9999), Method = "GET"}).Body
        else mainCode = game:HttpGet(scriptLink .. "?v=" .. math.random(1,9999)) end
    end)
    sg:Destroy()
    if mainCode ~= "" then loadstring(mainCode)() end
end

local function showSplash(midText, bottomText, textColor)
    local frame = Instance.new("Frame", sg)
    frame.Size = UDim2.new(0, 360, 0, 220)
    frame.Position = UDim2.new(0.5, -180, 0.5, -110)
    frame.BackgroundColor3 = Color3.fromRGB(15, 10, 25)
    frame.BorderSizePixel = 0
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 15)

    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Color3.fromRGB(160, 110, 220)
    stroke.Thickness = 2
    
    local title = Instance.new("TextLabel", frame)
    title.Size = UDim2.new(1, 0, 0, 50)
    title.Position = UDim2.new(0, 0, 0, 15)
    title.BackgroundTransparency = 1
    title.Text = utf8.char(128640) .. " WELCOME TO PHANTOMWALK PRO"
    title.TextColor3 = Color3.fromRGB(200, 160, 255)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 16

    local midLabel = Instance.new("TextLabel", frame)
    midLabel.Size = UDim2.new(1, 0, 0, 60)
    midLabel.Position = UDim2.new(0, 0, 0, 75)
    midLabel.BackgroundTransparency = 1
    midLabel.Text = midText
    midLabel.TextColor3 = textColor or Color3.fromRGB(255, 255, 255)
    midLabel.Font = Enum.Font.GothamBold
    midLabel.TextSize = 22

    local bottomLabel = Instance.new("TextLabel", frame)
    bottomLabel.Size = UDim2.new(1, 0, 0, 30)
    bottomLabel.Position = UDim2.new(0, 0, 0, 150)
    bottomLabel.BackgroundTransparency = 1
    bottomLabel.Text = bottomText
    bottomLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
    bottomLabel.Font = Enum.Font.Gotham
    bottomLabel.TextSize = 13

    task.wait(3) 
    executeMain()
end

-- ==========================================
-- 🕵️ DETEKSI IDENTITAS PLAYER
-- ==========================================

if myName == elKapitanName then
    showSplash("EL KAPITAN!!\n" .. utf8.char(128572), " WELCOME BACK BOSSS...", Color3.fromRGB(255, 220, 50))
    return
elseif myName == ayangName then
    showSplash("NYONYA RATU!! " .. utf8.char(128081), pesanBuatAyang, Color3.fromRGB(255, 105, 180))
    return
elseif specialMembers[myName] then
    showSplash("SPESIAL MEMBER\n" .. specialMembers[myName], "WELCOME BACK BROO!", Color3.fromRGB(100, 200, 255))
    return
elseif vipMembers[myName] then
    showSplash("VIP MEMBER " .. utf8.char(11088), "WELCOME BACK BROO!", Color3.fromRGB(255, 215, 0))
    return
elseif freeMembers[myName] then
    showSplash("FREE MEMBER", "Akses Gratis Terbatas Diberikan...", Color3.fromRGB(150, 150, 150))
    return
end

-- ==========================================
-- 🔐 SISTEM LOGIN PENGGUNA BUKAN MEMBER (VIA GITHUB)
-- ==========================================

local frame = Instance.new("Frame", sg)
frame.Size = UDim2.new(0, 360, 0, 220)
frame.Position = UDim2.new(0.5, -180, 0.5, -110)
frame.BackgroundColor3 = Color3.fromRGB(15, 10, 25)
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 15)

local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(160, 110, 220)
stroke.Thickness = 2

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Text = utf8.char(128640) .. " PHANTOMWALK LOGIN"
title.TextColor3 = Color3.fromRGB(200, 160, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 16

local infoLabel = Instance.new("TextLabel", frame)
infoLabel.Size = UDim2.new(0.9, 0, 0, 30)
infoLabel.Position = UDim2.new(0.05, 0, 0.25, 0)
infoLabel.BackgroundTransparency = 1
infoLabel.Text = "Silahkan masukkan License Key kamu"
infoLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
infoLabel.Font = Enum.Font.Gotham
infoLabel.TextSize = 12

local txtKey = Instance.new("TextBox", frame)
txtKey.Size = UDim2.new(0.8, 0, 0, 40)
txtKey.Position = UDim2.new(0.1, 0, 0.45, 0)
txtKey.BackgroundColor3 = Color3.fromRGB(30, 20, 45)
txtKey.TextColor3 = Color3.fromRGB(255, 255, 255)
txtKey.PlaceholderText = "Masukkan License Key..."
Instance.new("UICorner", txtKey).CornerRadius = UDim.new(0, 8)

local btnLogin = Instance.new("TextButton", frame)
btnLogin.Size = UDim2.new(0.8, 0, 0, 40)
btnLogin.Position = UDim2.new(0.1, 0, 0.7, 0)
btnLogin.BackgroundColor3 = Color3.fromRGB(160, 110, 220)
btnLogin.Text = "LOGIN & EXECUTE"
btnLogin.TextColor3 = Color3.fromRGB(255, 255, 255)
btnLogin.Font = Enum.Font.GothamBold
Instance.new("UICorner", btnLogin).CornerRadius = UDim.new(0, 8)

task.spawn(function()
    btnLogin.MouseButton1Click:Connect(function()
        local inputKey = txtKey.Text
        if inputKey == "" then
            infoLabel.Text = "Key tidak boleh kosong!"
            return
        end

        btnLogin.Text = "Mengecek Key di Server..."
        infoLabel.Text = "Mohon tunggu sebentar..."

        -- Mengambil data key dari GitHub
        local success, result = pcall(function()
            return game:HttpGet(keyDatabaseURL .. "?v=" .. math.random(1, 9999))
        end)

        if not success then
            infoLabel.Text = "Gagal terhubung ke GitHub!"
            btnLogin.Text = "LOGIN & EXECUTE"
            return
        end

        -- Mengecek apakah inputKey ada di dalam file txt GitHub
        if string.find(result, inputKey) then
            frame:Destroy()
            showSplash("VIP MEMBER " .. utf8.char(11088), "License Valid! Akses Diberikan.", Color3.fromRGB(255, 215, 0))
        else
            infoLabel.Text = "Key Salah atau Expired!"
            btnLogin.Text = "LOGIN & EXECUTE"
        end
    end)
end)
