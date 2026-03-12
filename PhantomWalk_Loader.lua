-- ==========================================
-- PHANTOMWALK-PRO-1 | LOADER VVIP (CLEAN)
-- Developer: kucing garong 😼
-- ==========================================

local player = game:GetService("Players").LocalPlayer
local myUserId = 8459930744 
local ayangId = 518969839  

-- JALUR HARTA KARUN MURNI
local scriptLink = "https://raw.githubusercontent.com/PhantomWalk-PRO-1/PW-Data/main/PhantomWalk_Main.lua"

-- 1. JALUR VIP KHUSUS (BOS & AYANG)
if player.UserId == myUserId or player.UserId == ayangId then
    print("Akses VIP Diterima, Bos!")
    loadstring(game:HttpGet(scriptLink))()
    return 
end

-- 2. UI LOGIN PREMIUM
local sg = Instance.new("ScreenGui", game.CoreGui)
sg.Name = "PhantomAuth"

local frame = Instance.new("Frame", sg)
frame.Size = UDim2.new(0, 350, 0, 200)
frame.Position = UDim2.new(0.5, -175, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(15, 10, 20)
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Text = "PHANTOMWALK-PRO-1 LOGIN"
title.TextColor3 = Color3.fromRGB(160, 110, 220)
title.Font = Enum.Font.GothamBold
title.TextSize = 16

local txtKey = Instance.new("TextBox", frame)
txtKey.Size = UDim2.new(0.8, 0, 0, 40)
txtKey.Position = UDim2.new(0.1, 0, 0.35, 0)
txtKey.BackgroundColor3 = Color3.fromRGB(30, 20, 40)
txtKey.TextColor3 = Color3.fromRGB(255, 255, 255)
txtKey.PlaceholderText = "Sabar, menyambungkan ke server..."
txtKey.TextEditable = false 
Instance.new("UICorner", txtKey).CornerRadius = UDim.new(0, 6)

local btnLogin = Instance.new("TextButton", frame)
btnLogin.Size = UDim2.new(0.8, 0, 0, 40)
btnLogin.Position = UDim2.new(0.1, 0, 0.65, 0)
btnLogin.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
btnLogin.Text = "MEMUAT DATA..."
btnLogin.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", btnLogin).CornerRadius = UDim.new(0, 6)

-- 3. PROSES KEYAUTH EKSKLUSIF
task.spawn(function()
    local Name = "PhantomWalk-PRO-1"
    local Ownerid = "drBGNk4DVL"
    local Secret = "7701abd392686be2e893a03ad30d4370842d6ce11949275976ca1ba311c4ef6e"
    local Version = "1.0"

    local success, KeyAuthScript = pcall(function()
        return game:HttpGet("https://raw.githubusercontent.com/KeyAuth/KeyAuth-Roblox/main/keyauth.lua")
    end)

    if not success or string.match(KeyAuthScript, "404: Not Found") then
        title.Text = "GAGAL MENARIK KEYAUTH"
        title.TextColor3 = Color3.fromRGB(255, 0, 0)
        return
    end

    local envSuccess, KeyAuth = pcall(function() return loadstring(KeyAuthScript)() end)

    if envSuccess and KeyAuth then
        KeyAuth.api.name = Name
        KeyAuth.api.ownerid = Ownerid
        KeyAuth.api.secret = Secret
        KeyAuth.api.version = Version
        
        pcall(function() KeyAuth.api:init() end)

        -- BUKA KUNCI UI
        txtKey.PlaceholderText = "Masukkan License Key..."
        txtKey.TextEditable = true
        btnLogin.Text = "LOGIN & EXECUTE"
        btnLogin.BackgroundColor3 = Color3.fromRGB(160, 110, 220)

        btnLogin.MouseButton1Click:Connect(function()
            btnLogin.Text = "Checking..."
            KeyAuth.api:license(txtKey.Text)

            if KeyAuth.api.success then
                btnLogin.Text = "BERHASIL!"
                btnLogin.BackgroundColor3 = Color3.fromRGB(40, 150, 50)
                task.wait(1)
                sg:Destroy()
                
                -- EKSEKUSI HARTA KARUN
                local mainCode = game:HttpGet(scriptLink)
                if mainCode and not string.match(mainCode, "404: Not Found") then
                    loadstring(mainCode)()
                else
                    warn("Harta Karun gagal ditarik! Cek nama file di GitHub.")
                end
            else
                btnLogin.Text = "INVALID KEY!"
                btnLogin.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
                task.wait(2)
                btnLogin.Text = "LOGIN & EXECUTE"
                btnLogin.BackgroundColor3 = Color3.fromRGB(160, 110, 220)
            end
        end)
    end
end)
