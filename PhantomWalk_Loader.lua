-- ==========================================
-- PHANTOMWALK-PRO-1 | LOADER VVIP MANDIRI
-- Developer: kucing garong 😼
-- ==========================================

local player = game:GetService("Players").LocalPlayer
local myUserId = 8459930744 
local ayangId = 518969839  

local scriptLink = "https://raw.githubusercontent.com/PhantomWalk-PRO-1/PW-Data/main/PhantomWalk_Main.lua"

if player.UserId == myUserId or player.UserId == ayangId then
    print("Akses VIP Diterima, Bos!")
    loadstring(game:HttpGet(scriptLink))()
    return 
end

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
txtKey.PlaceholderText = "Membangun koneksi API Mandiri..."
txtKey.TextEditable = false 
Instance.new("UICorner", txtKey).CornerRadius = UDim.new(0, 6)

local btnLogin = Instance.new("TextButton", frame)
btnLogin.Size = UDim2.new(0.8, 0, 0, 40)
btnLogin.Position = UDim2.new(0.1, 0, 0.65, 0)
btnLogin.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
btnLogin.Text = "TUNGGU SEBENTAR..."
btnLogin.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", btnLogin).CornerRadius = UDim.new(0, 6)

task.spawn(function()
    local HttpService = game:GetService("HttpService")
    
    local Name = "PhantomWalk-PRO-1"
    local Ownerid = "drBGNk4DVL"
    local Version = "1.0"
    local sessionid = ""

    -- 1. SISTEM INIT API NATIVE (TANPA GITHUB ORANG LAIN!)
    local initUrl = "https://keyauth.win/api/1.2/?type=init&ver="..Version.."&name="..Name.."&ownerid="..Ownerid
    local initSuccess, initRes = pcall(function() return game:HttpGet(initUrl) end)
    
    if not initSuccess then
        title.Text = "KONEKSI API GAGAL"
        title.TextColor3 = Color3.fromRGB(255, 0, 0)
        txtKey.Text = "Sistem gagal menghubungi server KeyAuth."
        btnLogin.Text = "ERROR JARINGAN"
        return
    end

    local initData
    local jsonSuccess = pcall(function() initData = HttpService:JSONDecode(initRes) end)

    if not jsonSuccess or not initData.success then
        title.Text = "ERROR DARI SERVER"
        title.TextColor3 = Color3.fromRGB(255, 0, 0)
        txtKey.Text = initData and initData.message or "Respon JSON Rusak"
        btnLogin.Text = "GAGAL"
        return
    end

    sessionid = initData.sessionid

    -- 2. KONEKSI BERHASIL, BUKA KUNCI UI
    txtKey.Text = ""
    txtKey.PlaceholderText = "Masukkan License Key..."
    txtKey.TextEditable = true
    btnLogin.Text = "LOGIN & EXECUTE"
    btnLogin.BackgroundColor3 = Color3.fromRGB(160, 110, 220)

    btnLogin.MouseButton1Click:Connect(function()
        btnLogin.Text = "Mengecek Key..."
        
        local key = txtKey.Text
        local hwid = game:GetService("RbxAnalyticsService"):GetClientId()
        local licUrl = "https://keyauth.win/api/1.2/?type=license&key="..key.."&hwid="..hwid.."&sessionid="..sessionid.."&name="..Name.."&ownerid="..Ownerid.."&ver="..Version
        
        local licSuccess, licRes = pcall(function() return game:HttpGet(licUrl) end)
        
        if not licSuccess then
            btnLogin.Text = "TIMEOUT!"
            btnLogin.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
            task.wait(2)
            btnLogin.Text = "LOGIN & EXECUTE"
            btnLogin.BackgroundColor3 = Color3.fromRGB(160, 110, 220)
            return
        end
        
        local licData = HttpService:JSONDecode(licRes)
        
        if licData.success then
            btnLogin.Text = "BERHASIL!"
            btnLogin.BackgroundColor3 = Color3.fromRGB(40, 150, 50)
            task.wait(1)
            sg:Destroy()
            
            -- TARIK HARTA KARUN
            local mainSuccess, mainCode = pcall(function() return game:HttpGet(scriptLink) end)
            if mainSuccess and mainCode and not string.match(mainCode, "404: Not Found") then
                loadstring(mainCode)()
            else
                warn("Harta Karun gagal ditarik! Error: " .. tostring(mainCode))
            end
        else
            btnLogin.Text = "INVALID KEY!"
            txtKey.Text = ""
            txtKey.PlaceholderText = licData.message or "Key salah atau sudah dipakai!"
            btnLogin.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
            task.wait(2)
            btnLogin.Text = "LOGIN & EXECUTE"
            btnLogin.BackgroundColor3 = Color3.fromRGB(160, 110, 220)
        end
    end)
end)
                
                -- EKSEKUSI HARTA KARUN
                local mainSuccess, mainCode = pcall(function() return game:HttpGet(scriptLink) end)
                if mainSuccess and mainCode and not string.match(mainCode, "404: Not Found") then
                    loadstring(mainCode)()
                else
                    warn("Harta Karun gagal ditarik! Error: " .. tostring(mainCode))
                end
            else
                btnLogin.Text = "INVALID KEY!"
                btnLogin.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
                task.wait(2)
                btnLogin.Text = "LOGIN & EXECUTE"
                btnLogin.BackgroundColor3 = Color3.fromRGB(160, 110, 220)
            end
        end)
    else
        title.Text = "LOADSTRING KEYAUTH GAGAL"
        title.TextColor3 = Color3.fromRGB(255, 0, 0)
        txtKey.Text = tostring(KeyAuth)
    end
end)
    end
end)
