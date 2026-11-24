-- =============================================================================
-- PREMIUM AUTOMATIC SPAMJUMP & CAMERA-FLICK DRIVEN ENGINE (ORIGINAL WS METOD)
-- LÖSENORD: CHICLAO1SECRETSPEEDGLITCH
-- UPPCENTRAL: HELT INTEGRERAD MULTI-FUNKTIONSPANEL
-- =============================================================================

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local Debris = game:GetService("Debris")

-- Rensa gamla instanser
local existingGui = LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("SpeedglitchAntiStuffGUI")
if existingGui then existingGui:Destroy() end
 
-- Skapa Huvudgränssnitt
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SpeedglitchAntiStuffGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- =============================================================================
-- STYLINGPROFILER & DESIGNKOMPONENTER
-- =============================================================================
local COLOR_MAIN_BG      = Color3.fromRGB(16, 26, 46)
local COLOR_BORDER       = Color3.fromRGB(28, 48, 89)
local COLOR_ACCENT       = Color3.fromRGB(0, 150, 255)
local COLOR_BUTTON_OFF   = Color3.fromRGB(24, 38, 69)
local COLOR_BUTTON_ON    = Color3.fromRGB(0, 180, 110)
local COLOR_TEXT_WHITE   = Color3.fromRGB(245, 247, 250)
local COLOR_TEXT_DIM     = Color3.fromRGB(140, 155, 180)
local COLOR_TEXT_GREEN   = Color3.fromRGB(50, 235, 130)
local COLOR_WARNING      = Color3.fromRGB(255, 75, 75)

local function applyPremiumDesign(element, radius, hasBorder, customBorderColor)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    corner.Parent = element
    
    if hasBorder then
        local stroke = Instance.new("UIStroke")
        stroke.Thickness = 2.5
        stroke.Color = customBorderColor or COLOR_BORDER
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = element
    end
end

local function createMenuButton(text, yPos, parent)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -30, 0, 36)
    btn.Position = UDim2.new(0, 15, 0, yPos)
    btn.BackgroundColor3 = COLOR_BUTTON_OFF
    btn.Text = text
    btn.TextColor3 = COLOR_TEXT_WHITE
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 12
    btn.Parent = parent
    applyPremiumDesign(btn, 8, true, COLOR_BORDER)
    return btn
end

-- TARGET PASSWORD CONSTANT
local CORRECT_PASSWORD = "CHICLAO1SECRETSPEEDGLITCH"

-- =============================================================================
-- SYSTEM: BLÅTT LÖSENORDSFÖNSTER (CENTERERAT)
-- =============================================================================
local passFrame = Instance.new("Frame")
passFrame.Size = UDim2.new(0, 350, 0, 200)
passFrame.Position = UDim2.new(0.5, -175, 0.5, -100)
passFrame.BackgroundColor3 = COLOR_MAIN_BG
passFrame.Active = true
passFrame.Draggable = true
passFrame.Parent = ScreenGui
applyPremiumDesign(passFrame, 12, true, COLOR_BORDER)

local passGradient = Instance.new("UIGradient")
passGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 35, 64)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(12, 20, 38))
})
passGradient.Rotation = 45
passGradient.Parent = passFrame

local passTitle = Instance.new("TextLabel")
passTitle.Size = UDim2.new(1, 0, 0, 45)
passTitle.BackgroundTransparency = 1
passTitle.Text = "ENTER ACCESS KEY"
passTitle.TextColor3 = COLOR_TEXT_WHITE
passTitle.Font = Enum.Font.GothamBold
passTitle.TextSize = 16
passTitle.Parent = passFrame

local passInput = Instance.new("TextBox")
passInput.Size = UDim2.new(1, -40, 0, 45)
passInput.Position = UDim2.new(0, 20, 0, 60)
passInput.BackgroundColor3 = Color3.fromRGB(11, 18, 33)
passInput.Text = ""
passInput.PlaceholderText = "Enter password here..."
passInput.PlaceholderColor3 = COLOR_TEXT_DIM
passInput.TextColor3 = COLOR_ACCENT
passInput.Font = Enum.Font.Gotham
passInput.TextSize = 14
passInput.ClearTextOnFocus = false
passInput.Parent = passFrame
applyPremiumDesign(passInput, 8, true, COLOR_BORDER)

local passSubmitBtn = Instance.new("TextButton")
passSubmitBtn.Size = UDim2.new(1, -40, 0, 45)
passSubmitBtn.Position = UDim2.new(0, 20, 0, 125)
passSubmitBtn.BackgroundColor3 = COLOR_BUTTON_OFF
passSubmitBtn.Text = "SUBMIT"
passSubmitBtn.TextColor3 = COLOR_TEXT_WHITE
passSubmitBtn.Font = Enum.Font.GothamBold
passSubmitBtn.TextSize = 14
passSubmitBtn.Parent = passFrame
applyPremiumDesign(passSubmitBtn, 8, true, COLOR_BORDER)

-- =============================================================================
-- HUVUDMENY: PREMIUM SPEEDGLITCH PANEL
-- =============================================================================
local speedFrame = Instance.new("Frame")
speedFrame.Size = UDim2.new(0, 400, 0, 780)
speedFrame.Position = UDim2.new(0, 100, 0, 100)
speedFrame.BackgroundColor3 = COLOR_MAIN_BG
speedFrame.Active = true
speedFrame.Draggable = true
speedFrame.Visible = false
speedFrame.Parent = ScreenGui

local mainGradient = Instance.new("UIGradient")
mainGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(22, 36, 64)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(14, 22, 40))
})
mainGradient.Rotation = 45
mainGradient.Parent = speedFrame

local speedTitle = Instance.new("TextLabel")
speedTitle.Size = UDim2.new(1, -50, 0, 40)
speedTitle.Position = UDim2.new(0, 15, 0, 5)
speedTitle.BackgroundTransparency = 1
speedTitle.Text = "SPEEDGLITCH BY NIGHTSHIFT485 ON TIKTOK"
speedTitle.TextColor3 = COLOR_TEXT_WHITE
speedTitle.Font = Enum.Font.GothamBold
speedTitle.TextSize = 12
speedTitle.TextXAlignment = Enum.TextXAlignment.Left
speedTitle.Parent = speedFrame

local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0, 26, 0, 26)
minBtn.Position = UDim2.new(1, -36, 0, 7)
minBtn.BackgroundColor3 = COLOR_BUTTON_OFF
minBtn.Text = "—"
minBtn.TextColor3 = COLOR_TEXT_WHITE
minBtn.Font = Enum.Font.GothamBold
minBtn.TextSize = 12
minBtn.Parent = speedFrame
applyPremiumDesign(minBtn, 6, true, COLOR_BORDER)

-- Container för Varning + Clipboard-knapp
local warningContainer = Instance.new("Frame")
warningContainer.Size = UDim2.new(1, -30, 0, 45)
warningContainer.Position = UDim2.new(0, 15, 0, 45)
warningContainer.BackgroundTransparency = 0.95
warningContainer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
warningContainer.Parent = speedFrame
applyPremiumDesign(warningContainer, 6, true, Color3.fromRGB(28, 48, 89))

local warningLabel = Instance.new("TextLabel")
warningLabel.Size = UDim2.new(0, 230, 1, 0)
warningLabel.Position = UDim2.new(0, 5, 0, 0)
warningLabel.BackgroundTransparency = 1
warningLabel.Text = "WARNING: This script was made by @nightshift485 on tiktok, please do not steal this script, give credits if ur making a video with this script"
warningLabel.TextColor3 = Color3.fromRGB(0, 150, 255)
warningLabel.Font = Enum.Font.GothamBold
warningLabel.TextSize = 8
warningLabel.TextWrapped = true
warningLabel.TextXAlignment = Enum.TextXAlignment.Left
warningLabel.Parent = warningContainer

local copyClipboardBtn = Instance.new("TextButton")
copyClipboardBtn.Size = UDim2.new(1, -245, 0, 30)
copyClipboardBtn.Position = UDim2.new(0, 240, 0.5, -15)
copyClipboardBtn.BackgroundColor3 = COLOR_BUTTON_OFF
copyClipboardBtn.Text = "COPY NAME TO CLIPBOARD"
copyClipboardBtn.TextColor3 = COLOR_TEXT_WHITE
copyClipboardBtn.Font = Enum.Font.GothamBold
copyClipboardBtn.TextSize = 8
copyClipboardBtn.TextWrapped = true
copyClipboardBtn.Parent = warningContainer
applyPremiumDesign(copyClipboardBtn, 6, true, COLOR_BORDER)

copyClipboardBtn.MouseButton1Click:Connect(function()
    local targetText = "nightshift485"
    if setclipboard then
        setclipboard(targetText)
        copyClipboardBtn.Text = "COPIED!"
        copyClipboardBtn.BackgroundColor3 = COLOR_BUTTON_ON
        task.wait(1.5)
        copyClipboardBtn.Text = "COPY NAME TO CLIPBOARD"
        copyClipboardBtn.BackgroundColor3 = COLOR_BUTTON_OFF
    else
        copyClipboardBtn.Text = "NAME: " .. targetText
        copyClipboardBtn.BackgroundColor3 = COLOR_ACCENT
        task.wait(3)
        copyClipboardBtn.Text = "COPY NAME TO CLIPBOARD"
        copyClipboardBtn.BackgroundColor3 = COLOR_BUTTON_OFF
    end
end)

local glitchToggleBtn = Instance.new("TextButton")
glitchToggleBtn.Size = UDim2.new(1, -30, 0, 44)
glitchToggleBtn.Position = UDim2.new(0, 15, 0, 100)
glitchToggleBtn.BackgroundColor3 = COLOR_BUTTON_OFF
glitchToggleBtn.Text = "SPEEDGLITCH OFF"
glitchToggleBtn.TextColor3 = COLOR_TEXT_WHITE
glitchToggleBtn.Font = Enum.Font.GothamBold
glitchToggleBtn.TextSize = 13
glitchToggleBtn.Parent = speedFrame
applyPremiumDesign(glitchToggleBtn, 8, true, COLOR_BORDER)

local controlRow = Instance.new("Frame")
controlRow.Size = UDim2.new(1, -30, 0, 44)
controlRow.Position = UDim2.new(0, 15, 0, 155)
controlRow.BackgroundTransparency = 1
controlRow.Parent = speedFrame

local minusBtn = Instance.new("TextButton")
minusBtn.Size = UDim2.new(0, 44, 1, 0)
minusBtn.BackgroundColor3 = COLOR_BUTTON_OFF
minusBtn.Text = "-"
minusBtn.TextColor3 = COLOR_TEXT_WHITE
minusBtn.Font = Enum.Font.GothamBold
minusBtn.TextSize = 18
minusBtn.Parent = controlRow
applyPremiumDesign(minusBtn, 8, true, COLOR_BORDER)

local speedValLabel = Instance.new("TextLabel")
speedValLabel.Size = UDim2.new(1, -108, 1, 0)
speedValLabel.Position = UDim2.new(0, 54, 0, 0)
speedValLabel.BackgroundColor3 = Color3.fromRGB(11, 18, 33)
speedValLabel.Text = "Multiplier: 800"
speedValLabel.TextColor3 = COLOR_ACCENT
speedValLabel.Font = Enum.Font.GothamBold
speedValLabel.TextSize = 13 
speedValLabel.Parent = controlRow 
applyPremiumDesign(speedValLabel, 8, true, COLOR_BORDER) local plusBtn = Instance.new("TextButton")
plusBtn.Size = UDim2.new(0, 44, 1, 0)
plusBtn.Position = UDim2.new(1, -44, 0, 0)
plusBtn.BackgroundColor3 = COLOR_BUTTON_OFF
plusBtn.Text = "+"
plusBtn.TextColor3 = COLOR_TEXT_WHITE
plusBtn.Font = Enum.Font.GothamBold
plusBtn.Parent = controlRow
applyPremiumDesign(plusBtn, 8, true, COLOR_BORDER)


-- ELI-BOMB SPAWNER BUTTON
local eliBombActive = false
local eliBombBtn = Instance.new("TextButton")
eliBombBtn.Size = UDim2.new(1, -30, 0, 42)
eliBombBtn.Position = UDim2.new(0, 15, 0, 210)
eliBombBtn.BackgroundColor3 = COLOR_BUTTON_OFF
eliBombBtn.Text = "ELI-BOMB SPAWNER OFF"
eliBombBtn.TextColor3 = COLOR_TEXT_WHITE
eliBombBtn.Font = Enum.Font.GothamBold
eliBombBtn.TextSize = 13
eliBombBtn.Parent = speedFrame
applyPremiumDesign(eliBombBtn, 8, true, COLOR_BORDER)
eliBombBtn.MouseButton1Click:Connect(function()
eliBombActive = not eliBombActive
if eliBombActive then
eliBombBtn.Text = "ELI-BOMB SPAWNER ON"
eliBombBtn.BackgroundColor3 = COLOR_BUTTON_ON
task.spawn(function()
pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/antonioffxslegend-collab/Elii-black-bomb/main/script.lua"))()
end)
end)
else
eliBombBtn.Text = "ELI-BOMB SPAWNER OFF"
eliBombBtn.BackgroundColor3 = COLOR_BUTTON_OFF
pcall(function()
if LocalPlayer.PlayerGui:FindFirstChild("C4_Final_Menu") then LocalPlayer.PlayerGui.C4_Final_Menu:Destroy() end
local bp = LocalPlayer:FindFirstChild("Backpack")
if bp and bp:FindFirstChild("Bomb") then bp.Bomb:Destroy() end
if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Bomb") then LocalPlayer.Character.Bomb:Destroy() end
end)
end
end)
-- NO RELOAD ANIM-EQUIP SOUND BUTTON
local noReloadActive = false
local noReloadBtn = Instance.new("TextButton")
noReloadBtn.Size = UDim2.new(1, -30, 0, 42)
noReloadBtn.Position = UDim2.new(0, 15, 0, 260)
noReloadBtn.BackgroundColor3 = COLOR_BUTTON_OFF
noReloadBtn.Text = "NO RELOAD ANIM-EQUIP SOUND OFF"
noReloadBtn.TextColor3 = COLOR_TEXT_WHITE
noReloadBtn.Font = Enum.Font.GothamBold
noReloadBtn.TextSize = 12
noReloadBtn.Parent = speedFrame
applyPremiumDesign(noReloadBtn, 8, true, COLOR_BORDER)
noReloadBtn.MouseButton1Click:Connect(function()
noReloadActive = not noReloadActive
if noReloadActive then
noReloadBtn.Text = "NO RELOAD ANIM-EQUIP SOUND ON"
noReloadBtn.BackgroundColor3 = COLOR_BUTTON_ON
task.spawn(function()
pcall(function()
loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-mmv-no-reload-animation-226822"))()
end)
end)
else
noReloadBtn.Text = "NO RELOAD ANIM-EQUIP SOUND OFF"
noReloadBtn.BackgroundColor3 = COLOR_BUTTON_OFF
end
end)
-- GRAY MAGIC CARPET LOADSTRING BUTTON
local carpetActive = false
local carpetBtn = Instance.new("TextButton")
carpetBtn.Size = UDim2.new(1, -30, 0, 42)
carpetBtn.Position = UDim2.new(0, 15, 0, 310)
carpetBtn.BackgroundColor3 = COLOR_BUTTON_OFF
carpetBtn.Text = "GRAY MAGIC CARPET LOADSTRING OFF"
carpetBtn.TextColor3 = COLOR_TEXT_WHITE
carpetBtn.Font = Enum.Font.GothamBold
carpetBtn.TextSize = 12
carpetBtn.Parent = speedFrame
applyPremiumDesign(carpetBtn, 8, true, COLOR_BORDER)
carpetBtn.MouseButton1Click:Connect(function()
carpetActive = not carpetActive
if carpetActive then
carpetBtn.Text = "GRAY MAGIC CARPET LOADSTRING ON"
carpetBtn.BackgroundColor3 = COLOR_BUTTON_ON
task.spawn(function()
pcall(function()
loadstring(game:HttpGet("https://pastefy.app/U1zk3Dqt/raw"))()
end)
end)
else
carpetBtn.Text = "GRAY MAGIC CARPET LOADSTRING OFF"
carpetBtn.BackgroundColor3 = COLOR_BUTTON_OFF
pcall(function()
if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Carpet") then LocalPlayer.Character.Carpet:Destroy() end
end)
end
end)
-- LIFETIME BOMB BY GOJO BUTTON (FIXAD STRUKTUR MED RAW-TEXT LÄNK)
local gojoActive = false
local gojoBombBtn = Instance.new("TextButton")
gojoBombBtn.Size = UDim2.new(1, -30, 0, 42)
gojoBombBtn.Position = UDim2.new(0, 15, 0, 360)
gojoBombBtn.BackgroundColor3 = COLOR_BUTTON_OFF
gojoBombBtn.Text = "LIFETIME BOMB BY GOJO OFF"
gojoBombBtn.TextColor3 = COLOR_TEXT_WHITE
gojoBombBtn.Font = Enum.Font.GothamBold
gojoBombBtn.TextSize = 12
gojoBombBtn.Parent = speedFrame
applyPremiumDesign(gojoBombBtn, 8, true, COLOR_BORDER)
gojoBombBtn.MouseButton1Click:Connect(function()
gojoActive = not gojoActive
if gojoActive then
gojoBombBtn.Text = "LIFETIME BOMB BY GOJO ON"
gojoBombBtn.BackgroundColor3 = COLOR_BUTTON_ON
task.spawn(function()
pcall(function()
loadstring(game:HttpGet("https://pastefy.app/8KNkehAO/raw"))()
end)
end)
else
gojoBombBtn.Text = "LIFETIME BOMB BY GOJO OFF"
gojoBombBtn.BackgroundColor3 = COLOR_BUTTON_OFF
pcall(function()
if LocalPlayer.PlayerGui:FindFirstChild("CombinedBombGUI") then LocalPlayer.PlayerGui.CombinedBombGUI:Destroy() end
end)
end
end)
-- RAINBOW SWORD SPAWNER BUTTON
local rainbowSwordActive = false
local rainbowSwordBtn = Instance.new("TextButton")
rainbowSwordBtn.Size = UDim2.new(1, -30, 0, 42)
rainbowSwordBtn.Position = UDim2.new(0, 15, 0, 410)
rainbowSwordBtn.BackgroundColor3 = COLOR_BUTTON_OFF
rainbowSwordBtn.Text = "RAINBOW SWORD SPAWNER OFF"
rainbowSwordBtn.TextColor3 = COLOR_TEXT_WHITE
rainbowSwordBtn.Font = Enum.Font.GothamBold
rainbowSwordBtn.TextSize = 12
rainbowSwordBtn.Parent = speedFrame
applyPremiumDesign(rainbowSwordBtn, 8, true, COLOR_BORDER)
rainbowSwordBtn.MouseButton1Click:Connect(function()
rainbowSwordActive = not rainbowSwordActive
if rainbowSwordActive then
rainbowSwordBtn.Text = "RAINBOW SWORD SPAWNER ON"
rainbowSwordBtn.BackgroundColor3 = COLOR_BUTTON_ON
task.spawn(function()
pcall(function()
loadstring(game:HttpGet("https://scriptblox.com/ingest/clientv2.lua"))("proj_d7454a74dba6", "1.0.0", false)
end)
pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/GGSOZI/Rip-offPeriastron/refs/heads/main/Periastron.lua"))()
end)
end)
else
rainbowSwordBtn.Text = "RAINBOW SWORD SPAWNER OFF"
rainbowSwordBtn.BackgroundColor3 = COLOR_BUTTON_OFF
pcall(function()
local bp = LocalPlayer:FindFirstChild("Backpack")
if bp and bp:FindFirstChild("Rip-off Rainbow Periastron OMEGA") then bp["Rip-off Rainbow Periastron OMEGA"]:Destroy() end
if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Rip-off Rainbow Periastron OMEGA") then LocalPlayer.Character["Rip-off Rainbow Periastron OMEGA"]:Destroy() end
if getgenv and getgenv().IvoryCleanup then pcall(getgenv().IvoryCleanup) end
end)
end
end)
-- YUKI SPEEDGLITCH, NEW VERS. BUTTON
local yukiActive = false
local yukiBtn = Instance.new("TextButton")
yukiBtn.Size = UDim2.new(1, -30, 0, 42)
yukiBtn.Position = UDim2.new(0, 15, 0, 460)
yukiBtn.BackgroundColor3 = COLOR_BUTTON_OFF
yukiBtn.Text = "YUKI SPEEDGLITCH, NEW VERS. OFF"
yukiBtn.TextColor3 = COLOR_TEXT_WHITE
yukiBtn.Font = Enum.Font.GothamBold
yukiBtn.TextSize = 12
yukiBtn.Parent = speedFrame
applyPremiumDesign(yukiBtn, 8, true, COLOR_BORDER)
yukiBtn.MouseButton1Click:Connect(function()
yukiActive = not yukiActive
if yukiActive then
yukiBtn.Text = "YUKI SPEEDGLITCH, NEW VERS. ON"
yukiBtn.BackgroundColor3 = COLOR_BUTTON_ON
task.spawn(function()
pcall(function()
loadstring(game:HttpGet("https://pastefy.app/cO8G5H1y/raw"))()
end)
end)
else
yukiBtn.Text = "YUKI SPEEDGLITCH, NEW VERS. OFF"
yukiBtn.BackgroundColor3 = COLOR_BUTTON_OFF
pcall(function()
if LocalPlayer.PlayerGui:FindFirstChild("YukiSGUI") then LocalPlayer.PlayerGui.YukiSGUI:Destroy() end
end)
end
end)
-- NY KNAPP 1: DARK PEGASUS GEAR BUTTON
local pegasusActive = false
local pegasusBtn = Instance.new("TextButton")
pegasusBtn.Size = UDim2.new(1, -30, 0, 42)
pegasusBtn.Position = UDim2.new(0, 15, 0, 510)
pegasusBtn.BackgroundColor3 = COLOR_BUTTON_OFF
pegasusBtn.Text = "DARK PEGASUS GEAR OFF"
pegasusBtn.TextColor3 = COLOR_TEXT_WHITE
pegasusBtn.Font = Enum.Font.GothamBold
pegasusBtn.TextSize = 12
pegasusBtn.Parent = speedFrame
applyPremiumDesign(pegasusBtn, 8, true, COLOR_BORDER)
pegasusBtn.MouseButton1Click:Connect(function()
pegasusActive = not pegasusActive
if pegasusActive then
pegasusBtn.Text = "DARK PEGASUS GEAR ON"
pegasusBtn.BackgroundColor3 = COLOR_BUTTON_ON
task.spawn(function()
pcall(function()
loadstring(game:HttpGet("https://pastefy.app/MVITXPKt/raw"))()
end)
end)
else
pegasusBtn.Text = "DARK PEGASUS GEAR OFF"
pegasusBtn.BackgroundColor3 = COLOR_BUTTON_OFF
pcall(function()
local bp = LocalPlayer:FindFirstChild("Backpack")
if bp and bp:FindFirstChild("PegasusWings") then bp.PegasusWings:Destroy() end
if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("PegasusWings") then LocalPlayer.Character.PegasusWings:Destroy() end
end)
end
end)
-- NY KNAPP 2: HAIRDRYER NEW GEAR BUTTON
local hairdryerActive = false
local hairdryerBtn = Instance.new("TextButton")
hairdryerBtn.Size = UDim2.new(1, -30, 0, 42)
hairdryerBtn.Position = UDim2.new(0, 15, 0, 560)
hairdryerBtn.BackgroundColor3 = COLOR_BUTTON_OFF
hairdryerBtn.Text = "HAIRDRYER NEW GEAR OFF"
hairdryerBtn.TextColor3 = COLOR_TEXT_WHITE
hairdryerBtn.Font = Enum.Font.GothamBold
hairdryerBtn.TextSize = 12
hairdryerBtn.Parent = speedFrame
applyPremiumDesign(hairdryerBtn, 8, true, COLOR_BORDER)
hairdryerBtn.MouseButton1Click:Connect(function()
hairdryerActive = not hairdryerActive
if hairdryerActive then
hairdryerBtn.Text = "HAIRDRYER NEW GEAR ON"
hairdryerBtn.BackgroundColor3 = COLOR_BUTTON_ON
task.spawn(function()
pcall(function()
loadstring(game:HttpGet("https://pastefy.app/l7rUVPB8/raw"))()
end)
end)
else
hairdryerBtn.Text = "HAIRDRYER NEW GEAR OFF"
hairdryerBtn.BackgroundColor3 = COLOR_BUTTON_OFF
pcall(function()
local bp = LocalPlayer:FindFirstChild("Backpack")
if bp and bp:FindFirstChild("Hair Dryer") then bp["Hair Dryer"]:Destroy() end
if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Hair Dryer") then LocalPlayer.Character["Hair Dryer"]:Destroy() end
end)
end
end)
-- SÄKER AVSTÄNGNINGSKNAPP
local destroyScriptBtn = Instance.new("TextButton")
destroyScriptBtn.Size = UDim2.new(1, -30, 0, 42)
destroyScriptBtn.Position = UDim2.new(0, 15, 0, 620)
destroyScriptBtn.BackgroundColor3 = COLOR_WARNING
destroyScriptBtn.Text = "CLOSE & DESTROY MENU"
destroyScriptBtn.TextColor3 = COLOR_TEXT_WHITE
destroyScriptBtn.Font = Enum.Font.GothamBold
destroyScriptBtn.TextSize = 13
destroyScriptBtn.Parent = speedFrame
applyPremiumDesign(destroyScriptBtn, 8, false)
-- OPEN ANTI-STUFF MENU KNAPP
local tabBtn = Instance.new("TextButton")
tabBtn.Size = UDim2.new(1, -30, 0, 40)
tabBtn.Position = UDim2.new(0, 15, 1, -55)
tabBtn.BackgroundColor3 = COLOR_BORDER
tabBtn.Text = "OPEN ANTI-STUFF MENU"
tabBtn.TextColor3 = COLOR_TEXT_WHITE
tabBtn.Font = Enum.Font.GothamBold
tabBtn.TextSize = 13
tabBtn.Parent = speedFrame
applyPremiumDesign(tabBtn, 8, false)
-- =============================================================================
-- SEKUNDÄR MENY: ANTI-STUFF PANEL
-- =============================================================================
local antiFrame = Instance.new("Frame")
antiFrame.Size = UDim2.new(0, 310, 0, 350)
antiFrame.Position = UDim2.new(0, 450, 0, 300)
antiFrame.BackgroundColor3 = COLOR_MAIN_BG
antiFrame.Visible = false
antiFrame.Active = true
antiFrame.Draggable = true
antiFrame.Parent = ScreenGui
applyPremiumDesign(antiFrame, 12, true, COLOR_BORDER)
local antiTitle = Instance.new("TextLabel")
antiTitle.Size = UDim2.new(1, -50, 0, 45)
antiTitle.Position = UDim2.new(0, 15, 0, 0)
antiTitle.BackgroundTransparency = 1
antiTitle.Text = "MM2 ANTI-STUFF MENU"
antiTitle.TextColor3 = COLOR_TEXT_WHITE
antiTitle.Font = Enum.Font.GothamBold
antiTitle.TextSize = 15
antiTitle.TextXAlignment = Enum.TextXAlignment.Left
antiTitle.Parent = antiFrame
local closeAntiBtn = Instance.new("TextButton")
closeAntiBtn.Size = UDim2.new(0, 28, 0, 28)
closeAntiBtn.Position = UDim2.new(1, -38, 0, 9)
closeAntiBtn.BackgroundColor3 = COLOR_BUTTON_OFF
closeAntiBtn.Text = "×"
closeAntiBtn.TextColor3 = COLOR_TEXT_WHITE
closeAntiBtn.Font = Enum.Font.GothamBold
closeAntiBtn.TextSize = 18
closeAntiBtn.Parent = antiFrame
applyPremiumDesign(closeAntiBtn, 6, true, COLOR_BORDER)
local antiWalkBtn = createMenuButton("ANTI-WALK: OFF", 50, antiFrame)
local antiJumpBtn = createMenuButton("ANTI-JUMP: OFF", 95, antiFrame)
local antiLagBtn = createMenuButton("ANTI-LAG/CONFETE: OFF", 140, antiFrame)
local antiFlingBtn = createMenuButton("ANTI-FLING: OFF", 185, antiFrame)
local antiCoinsBtn = createMenuButton("ANTI-COINS: OFF", 230, antiFrame)
tabBtn.MouseButton1Click:Connect(function() antiFrame.Visible = not antiFrame.Visible end)
closeAntiBtn.MouseButton1Click:Connect(function() antiFrame.Visible = false end)
-- =============================================================================
-- PREMIUM MINIMERAD REKTANGEL MED REGNBÅGSRAM (DRAGGABLE)
-- =============================================================================
local minIcon = Instance.new("TextButton")
minIcon.Size = UDim2.new(0, 260, 0, 48)
minIcon.Position = UDim2.new(0.05, 0, 0.2, 0)
minIcon.BackgroundColor3 = COLOR_MAIN_BG
minIcon.Text = "@nightshift485 speedglitch menu"
minIcon.TextColor3 = COLOR_TEXT_WHITE
minIcon.Font = Enum.Font.GothamBold
minIcon.TextSize = 12
minIcon.Visible = false
minIcon.Active = true
minIcon.Draggable = true
minIcon.Parent = ScreenGui
local iconStroke = Instance.new("UIStroke")
iconStroke.Thickness = 3
iconStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
iconStroke.Parent = minIcon
local iconGradient = Instance.new("UIGradient")
iconGradient.Color = ColorSequence.new({
ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
ColorSequenceKeypoint.new(0.2, Color3.fromRGB(255, 255, 0)),
ColorSequenceKeypoint.new(0.4, Color3.fromRGB(0, 255, 0)),
ColorSequenceKeypoint.new(0.6, Color3.fromRGB(0, 255, 255)),
ColorSequenceKeypoint.new(0.8, Color3.fromRGB(0, 0, 255)),
ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
})
iconGradient.Parent = iconStroke
applyPremiumDesign(minIcon, 8, false)
local rainbowLoop = task.spawn(function()
while true do
for t = 0, 1, 0.01 do
iconGradient.Offset = Vector2.new(-t, 0)
task.wait(0.015)
end
end
end)
minBtn.MouseButton1Click:Connect(function()
speedFrame.Visible = false
antiFrame.Visible = false
minIcon.Visible = true
end)
minIcon.MouseButton1Click:Connect(function()
speedFrame.Visible = true
minIcon.Visible = false
end)
-- =============================================================================
-- SMART LÖSENORDSVALIDERING
-- =============================================================================
passSubmitBtn.MouseButton1Click:Connect(function()
local cleanedInput = passInput.Text:gsub("%s+", ""):upper()
if cleanedInput == CORRECT_PASSWORD then
passFrame:Destroy()
speedFrame.Visible = true
else
passInput.Text = ""
passInput.PlaceholderText = "Wrong Password! Try again..."
passInput.PlaceholderColor3 = Color3.fromRGB(220, 50, 50)
end
end)
-- =============================================================================
-- SÄKRAD AUTOMATISK SPAMJUMP MOTOR
-- =============================================================================
local sistemaAtivo = false
local speedBoost = 800
local lastCameraCFrame = Workspace.CurrentCamera.CFrame
local lastJumpTime = 0
local spamActive = false
local cameraHistory = {}
plusBtn.MouseButton1Click:Connect(function()
speedBoost = math.min(800, speedBoost + 50)
speedValLabel.Text = "Multiplier: " .. tostring(speedBoost)
end)
minusBtn.MouseButton1Click:Connect(function()
speedBoost = math.max(10, speedBoost - 50)
speedValLabel.Text = "Multiplier: " .. tostring(speedBoost)
end)
glitchToggleBtn.MouseButton1Click:Connect(function()
sistemaAtivo = not sistemaAtivo
if sistemaAtivo then
glitchToggleBtn.Text = "SPEEDGLITCH ON"
glitchToggleBtn.BackgroundColor3 = COLOR_BUTTON_ON
else
glitchToggleBtn.Text = "SPEEDGLITCH OFF"
glitchToggleBtn.BackgroundColor3 = COLOR_BUTTON_OFF
spamActive = false
end
end)
UserInputService.JumpRequest:Connect(function()
if not sistemaAtivo then return end
lastJumpTime = tick()
spamActive = true
end)
local loopConnection
local function conectarHumanoid(hum)
local char = hum.Parent
local rootPart = char:WaitForChild("HumanoidRootPart", 5)
if loopConnection then loopConnection:Disconnect() end
loopConnection = RunService.RenderStepped:Connect(function()
if not sistemaAtivo or not hum or not rootPart or not rootPart.Parent then return end
local currentCameraCFrame = Workspace.CurrentCamera.CFrame
local cameraDelta = (currentCameraCFrame.LookVector - lastCameraCFrame.LookVector).Magnitude
lastCameraCFrame = currentCameraCFrame
table.insert(cameraHistory, cameraDelta)
if #cameraHistory > 4 then table.remove(cameraHistory, 1) end
local averageCameraMovement = 0
for _, val in ipairs(cameraHistory) do averageCameraMovement = averageCameraMovement + val end
averageCameraMovement = averageCameraMovement / #cameraHistory
if tick() - lastJumpTime > 0.55 then
spamActive = false
end
local isJumping = (hum.FloorMaterial == Enum.Material.Air)
if isJumping and spamActive and averageCameraMovement > 0.002 and hum.MoveDirection.Magnitude > 0 then
local baseGlitchPower = 45
local dynamicFactor = 0.05 + (speedBoost / 1100)
local calculatedSpeed = baseGlitchPower + (speedBoost * dynamicFactor)
local targetVelocity = hum.MoveDirection * calculatedSpeed
local velX = math.clamp(targetVelocity.X, -115, 115)
local velZ = math.clamp(targetVelocity.Z, -115, 115)
rootPart.AssemblyLinearVelocity = Vector3.new(velX, rootPart.AssemblyLinearVelocity.Y, velZ)
end
end)
end
if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
conectarHumanoid(LocalPlayer.Character:FindFirstChildOfClass("Humanoid"))
end
local charConnectionMain = LocalPlayer.CharacterAdded:Connect(function(char)
local hum = char:WaitForChild("Humanoid")
spamActive = false
cameraHistory = {}
conectarHumanoid(hum)
end)
-- =============================================================================
-- PREMIUM ANTI-STUFF MODULER
-- =============================================================================
local antiWalk = false
local antiJump = false
local antiLag = false
local antiCoins = false
local antiFling = false
antiWalkBtn.MouseButton1Click:Connect(function()
antiWalk = not antiWalk
antiWalkBtn.Text = antiWalk and "ANTI-WALK: ON" or "ANTI-WALK: OFF"
antiWalkBtn.BackgroundColor3 = antiWalk and COLOR_BUTTON_ON or COLOR_BUTTON_OFF
end)
antiJumpBtn.MouseButton1Click:Connect(function()
antiJump = not antiJump
antiJumpBtn.Text = antiJump and "ANTI-JUMP: ON" or "ANTI-JUMP: OFF"
antiJumpBtn.BackgroundColor3 = antiJump and COLOR_BUTTON_ON or COLOR_BUTTON_OFF
end)
antiCoinsBtn.MouseButton1Click:Connect(function()
antiCoins = not antiCoins
antiCoinsBtn.Text = antiCoins and "ANTI-COINS: ON" or "ANTI-COINS: OFF"
antiCoinsBtn.BackgroundColor3 = antiCoins and COLOR_BUTTON_ON or COLOR_BUTTON_OFF
end)
antiFlingBtn.MouseButton1Click:Connect(function()
antiFling = not antiFling
antiFlingBtn.Text = antiFling and "ANTI-FLING: ON" or "ANTI-FLING: OFF"
antiFlingBtn.BackgroundColor3 = antiFling and COLOR_BUTTON_ON or COLOR_BUTTON_OFF
end)
local heartbeatConnection = RunService.Heartbeat:Connect(function()
local char = LocalPlayer.Character
if char then
for _, v in pairs(char:GetDescendants()) do
if v:IsA("Sound") then
if antiWalk and (v.Name:lower():find("step") or v.Name:lower():find("walk") or v.Name:lower():find("run")) then v.Volume = 0 end
if antiJump and (v.Name:lower():find("jump") or v.Name:lower():find("land")) then v.Volume = 0 end
end
end
end
for _, v in pairs(SoundService:GetDescendants()) do
if v:IsA("Sound") then
if antiWalk and (v.Name:lower():find("step") or v.Name:lower():find("walk")) then v.Volume = 0 end
if antiJump and (v.Name:lower():find("jump") or v.Name:find("land")) then v.Volume = 0 end
end
end
if antiCoins then
for _, obj in pairs(Workspace:GetDescendants()) do
if obj:IsA("BasePart") and (obj.Name:lower():find("coin") or obj.Name:lower():find("coincontainer") or obj.Name:lower():find("pickup")) then
obj.CanTouch = false
end
end
end
if antiFling then
for _, player in pairs(Players:GetPlayers()) do
if player ~= LocalPlayer and player.Character then
for _, part in pairs(player.Character:GetDescendants()) do
if part:IsA("BasePart") then
part.CanCollide = false
end
end
end
end
end
end)
antiLagBtn.MouseButton1Click:Connect(function()
antiLag = not antiLag
antiLagBtn.Text = antiLag and "ANTI-LAG/CONFETE: ON" or "ANTI-LAG/CONFETE: OFF"
antiLagBtn.BackgroundColor3 = antiLag and COLOR_BUTTON_ON or COLOR_BUTTON_OFF
if antiLag then
for _, obj in pairs(Workspace:GetDescendants()) do
if obj:IsA("ParticleEmitter") or obj:IsA("Sparkles") or obj:IsA("Smoke") or obj:IsA("Fire") then
obj.Enabled = false
end
end
end
end)
-- =============================================================================
-- COMPLETE DESTROY LOGIC
-- =============================================================================
destroyScriptBtn.MouseButton1Click:Connect(function()
sistemaAtivo = false
antiFling = false
antiCoins = false
antiWalk = false
antiJump = false
if loopConnection then loopConnection:Disconnect() end
if heartbeatConnection then heartbeatConnection:Disconnect() end
if charConnectionMain then charConnectionMain:Disconnect() end
if rainbowLoop then task.cancel(rainbowLoop) end
if getgenv then
if getgenv().YukiCleanup then pcall(getgenv().YukiCleanup) end
if getgenv().IvoryCleanup then pcall(getgenv().IvoryCleanup) end
end
ScreenGui:Destroy()
end)
