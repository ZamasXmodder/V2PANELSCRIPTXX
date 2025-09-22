-- GUI Panel Hacker para Roblox
-- Crear ScreenGui principal
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "HackerPanelGUI"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true

-- Fondo negro completo que cubre toda la pantalla
local backgroundFrame = Instance.new("Frame")
backgroundFrame.Name = "HackerBackground"
backgroundFrame.Parent = screenGui
backgroundFrame.Size = UDim2.new(1, 0, 1, 50)
backgroundFrame.Position = UDim2.new(0, 0, 0, -50)
backgroundFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
backgroundFrame.BorderSizePixel = 0
backgroundFrame.ZIndex = 1

-- Crear efecto Matrix (código verde cayendo)
local matrixChars = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "-", "+", "=", "[", "]", "{", "}", "|", "\\", ":", ";", "'", "\"", "<", ">", ",", ".", "?", "/"}

for i = 1, 80 do -- Crear 80 columnas de código
    local xPos = (i - 1) / 80
    
    for j = 1, 40 do -- 40 caracteres por columna
        local codeLabel = Instance.new("TextLabel")
        codeLabel.Name = "MatrixCode_" .. i .. "_" .. j
        codeLabel.Parent = backgroundFrame
        codeLabel.Size = UDim2.new(0, 15, 0, 18)
        codeLabel.Position = UDim2.new(xPos, math.random(-5, 5), 0, (j - 1) * 18 - math.random(0, 500))
        codeLabel.BackgroundTransparency = 1
        codeLabel.Text = matrixChars[math.random(1, #matrixChars)]
        codeLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        codeLabel.TextScaled = true
        codeLabel.Font = Enum.Font.Code
        codeLabel.TextTransparency = math.random(20, 80) / 100
        codeLabel.ZIndex = 2
        
        -- Animación de caída
        spawn(function()
            while screenGui.Parent do
                wait(math.random(1, 5) / 100)
                codeLabel.Text = matrixChars[math.random(1, #matrixChars)]
                codeLabel.Position = codeLabel.Position + UDim2.new(0, 0, 0, 2)
                
                if codeLabel.Position.Y.Offset > 800 then
                    codeLabel.Position = UDim2.new(xPos, math.random(-5, 5), 0, -math.random(50, 200))
                end
            end
        end)
    end
end

-- Panel principal con efecto borroso y semi-transparente
local mainPanel = Instance.new("Frame")
mainPanel.Name = "MainPanel"
mainPanel.Parent = screenGui
mainPanel.Size = UDim2.new(0, 450, 0, 350)
mainPanel.Position = UDim2.new(0.5, -225, 0.5, -175)
mainPanel.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
mainPanel.BackgroundTransparency = 0.3
mainPanel.BorderSizePixel = 0
mainPanel.ZIndex = 10

-- Esquinas redondeadas del panel
local panelCorner = Instance.new("UICorner")
panelCorner.Parent = mainPanel
panelCorner.CornerRadius = UDim.new(0, 20)

-- Efecto de blur (desenfoque) para el panel
local blurEffect = Instance.new("Frame")
blurEffect.Name = "BlurEffect"
blurEffect.Parent = mainPanel
blurEffect.Size = UDim2.new(1, 0, 1, 0)
blurEffect.Position = UDim2.new(0, 0, 0, 0)
blurEffect.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
blurEffect.BackgroundTransparency = 0.7
blurEffect.BorderSizePixel = 0
blurEffect.ZIndex = 9

local blurCorner = Instance.new("UICorner")
blurCorner.Parent = blurEffect
blurCorner.CornerRadius = UDim.new(0, 20)

-- Borde neon rojo brillante con gradiente
local neonBorder = Instance.new("UIStroke")
neonBorder.Parent = mainPanel
neonBorder.Color = Color3.fromRGB(255, 20, 60)
neonBorder.Thickness = 4
neonBorder.Transparency = 0

-- Borde exterior adicional para más luminosidad
local outerGlow = Instance.new("Frame")
outerGlow.Name = "OuterGlow"
outerGlow.Parent = screenGui
outerGlow.Size = UDim2.new(0, 470, 0, 370)
outerGlow.Position = UDim2.new(0.5, -235, 0.5, -185)
outerGlow.BackgroundColor3 = Color3.fromRGB(255, 20, 60)
outerGlow.BackgroundTransparency = 0.8
outerGlow.BorderSizePixel = 0
outerGlow.ZIndex = 8

local outerGlowCorner = Instance.new("UICorner")
outerGlowCorner.Parent = outerGlow
outerGlowCorner.CornerRadius = UDim.new(0, 25)

local outerGlowStroke = Instance.new("UIStroke")
outerGlowStroke.Parent = outerGlow
outerGlowStroke.Color = Color3.fromRGB(255, 40, 80)
outerGlowStroke.Thickness = 2
outerGlowStroke.Transparency = 0.5

-- Efecto de brillo animado para los bordes
spawn(function()
    while screenGui.Parent do
        -- Animar borde principal
        for i = 0, 100 do
            neonBorder.Transparency = math.sin(i * 0.1) * 0.3 + 0.1
            neonBorder.Color = Color3.fromRGB(255, 20 + i/5, 60 + i/3)
            outerGlow.BackgroundTransparency = 0.7 + math.sin(i * 0.1) * 0.2
            wait(0.03)
        end
        for i = 100, 0, -1 do
            neonBorder.Transparency = math.sin(i * 0.1) * 0.3 + 0.1
            neonBorder.Color = Color3.fromRGB(255, 20 + i/5, 60 + i/3)
            outerGlow.BackgroundTransparency = 0.7 + math.sin(i * 0.1) * 0.2
            wait(0.03)
        end
    end
end)

-- Título "Steal A PremiumX" con efectos de glitch
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Parent = mainPanel
titleLabel.Size = UDim2.new(1, 0, 0, 60)
titleLabel.Position = UDim2.new(0, 0, 0, 15)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Steal A PremiumX"
titleLabel.TextColor3 = Color3.fromRGB(255, 40, 80)
titleLabel.TextScaled = true
titleLabel.Font = Enum.Font.GothamBold
titleLabel.ZIndex = 11

-- Efecto de glitch en el título
spawn(function()
    local originalText = "Steal A PremiumX"
    local glitchChars = {"$", "#", "@", "&", "%", "!", "?", "*", "^", "~"}
    
    while screenGui.Parent do
        wait(math.random(3, 8)) -- Glitch aleatorio cada 3-8 segundos
        
        -- Crear efecto de glitch
        for glitchCount = 1, 3 do
            local glitchedText = ""
            for i = 1, #originalText do
                if math.random(1, 10) <= 3 then -- 30% chance de glitch por carácter
                    glitchedText = glitchedText .. glitchChars[math.random(1, #glitchChars)]
                else
                    glitchedText = glitchedText .. originalText:sub(i, i)
                end
            end
            
            titleLabel.Text = glitchedText
            titleLabel.TextColor3 = Color3.fromRGB(math.random(200, 255), math.random(0, 50), math.random(50, 120))
            titleLabel.Position = titleLabel.Position + UDim2.new(0, math.random(-2, 2), 0, math.random(-1, 1))
            
            wait(0.05)
        end
        
        -- Restaurar texto original
        titleLabel.Text = originalText
        titleLabel.TextColor3 = Color3.fromRGB(255, 40, 80)
        titleLabel.Position = UDim2.new(0, 0, 0, 15)
    end
end)

-- Label para instrucciones con efectos de typing
local instructionLabel = Instance.new("TextLabel")
instructionLabel.Name = "InstructionLabel"
instructionLabel.Parent = mainPanel
instructionLabel.Size = UDim2.new(1, -40, 0, 30)
instructionLabel.Position = UDim2.new(0, 20, 0, 95)
instructionLabel.BackgroundTransparency = 1
instructionLabel.Text = ""
instructionLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
instructionLabel.TextScaled = true
instructionLabel.Font = Enum.Font.Gotham
instructionLabel.ZIndex = 11

-- Efecto de escritura (typewriter) para las instrucciones
spawn(function()
    local fullText = "Place your key here!"
    local currentText = ""
    
    while screenGui.Parent do
        -- Escribir letra por letra
        for i = 1, #fullText do
            currentText = fullText:sub(1, i)
            instructionLabel.Text = currentText .. (math.random(1, 2) == 1 and "_" or "")
            instructionLabel.TextColor3 = Color3.fromRGB(150 + math.random(0, 100), 150 + math.random(0, 100), 150 + math.random(0, 100))
            wait(0.1)
        end
        
        -- Mostrar texto completo sin cursor
        instructionLabel.Text = fullText
        wait(5)
        
        -- Borrar letra por letra
        for i = #fullText, 0, -1 do
            currentText = fullText:sub(1, i)
            instructionLabel.Text = currentText .. "_"
            wait(0.05)
        end
        
        wait(1)
    end
end)

-- TextBox para ingresar la clave con efectos mejorados
local keyTextBox = Instance.new("TextBox")
keyTextBox.Name = "KeyTextBox"
keyTextBox.Parent = mainPanel
keyTextBox.Size = UDim2.new(1, -40, 0, 45)
keyTextBox.Position = UDim2.new(0, 20, 0, 140)
keyTextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
keyTextBox.BackgroundTransparency = 0.4
keyTextBox.BorderSizePixel = 0
keyTextBox.Text = ""
keyTextBox.PlaceholderText = "Enter your key..."
keyTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
keyTextBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
keyTextBox.TextScaled = true
keyTextBox.Font = Enum.Font.Gotham
keyTextBox.ZIndex = 11

local textBoxCorner = Instance.new("UICorner")
textBoxCorner.Parent = keyTextBox
textBoxCorner.CornerRadius = UDim.new(0, 12)

local textBoxStroke = Instance.new("UIStroke")
textBoxStroke.Parent = keyTextBox
textBoxStroke.Color = Color3.fromRGB(255, 20, 60)
textBoxStroke.Thickness = 3
textBoxStroke.Transparency = 0

-- Efecto de brillo para TextBox
spawn(function()
    while screenGui.Parent do
        wait(1) -- Desfase diferente
        for i = 0, 100 do
            textBoxStroke.Transparency = math.sin(i * 0.1) * 0.3 + 0.2
            textBoxStroke.Color = Color3.fromRGB(255, 20 + i/4, 60 + i/2)
            wait(0.03)
        end
        for i = 100, 0, -1 do
            textBoxStroke.Transparency = math.sin(i * 0.1) * 0.3 + 0.2
            textBoxStroke.Color = Color3.fromRGB(255, 20 + i/4, 60 + i/2)
            wait(0.03)
        end
    end
end)

-- Botón "Get Key" con efectos luminosos
local getKeyButton = Instance.new("TextButton")
getKeyButton.Name = "GetKeyButton"
getKeyButton.Parent = mainPanel
getKeyButton.Size = UDim2.new(0.45, -10, 0, 50)
getKeyButton.Position = UDim2.new(0, 20, 0, 210)
getKeyButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
getKeyButton.BackgroundTransparency = 0.3
getKeyButton.BorderSizePixel = 0
getKeyButton.Text = "Get Key"
getKeyButton.TextColor3 = Color3.fromRGB(0, 255, 120)
getKeyButton.TextScaled = true
getKeyButton.Font = Enum.Font.GothamBold
getKeyButton.ZIndex = 11

local getKeyCorner = Instance.new("UICorner")
getKeyCorner.Parent = getKeyButton
getKeyCorner.CornerRadius = UDim.new(0, 15)

local getKeyStroke = Instance.new("UIStroke")
getKeyStroke.Parent = getKeyButton
getKeyStroke.Color = Color3.fromRGB(255, 20, 60)
getKeyStroke.Thickness = 3
getKeyStroke.Transparency = 0

-- Efecto de brillo para botón Get Key (ahora en rojo neon)
spawn(function()
    while screenGui.Parent do
        wait(0.3) -- Desfase
        for i = 0, 100 do
            getKeyStroke.Transparency = math.sin(i * 0.15) * 0.4 + 0.1
            getKeyStroke.Color = Color3.fromRGB(255, 20 + i/3, 60 + i/2)
            wait(0.04)
        end
        for i = 100, 0, -1 do
            getKeyStroke.Transparency = math.sin(i * 0.15) * 0.4 + 0.1
            getKeyStroke.Color = Color3.fromRGB(255, 20 + i/3, 60 + i/2)
            wait(0.04)
        end
    end
end)

-- Botón "Submit" con efectos luminosos
local submitButton = Instance.new("TextButton")
submitButton.Name = "SubmitButton"
submitButton.Parent = mainPanel
submitButton.Size = UDim2.new(0.45, -10, 0, 50)
submitButton.Position = UDim2.new(0.55, 10, 0, 210)
submitButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
submitButton.BackgroundTransparency = 0.3
submitButton.BorderSizePixel = 0
submitButton.Text = "Submit"
submitButton.TextColor3 = Color3.fromRGB(255, 140, 0)
submitButton.TextScaled = true
submitButton.Font = Enum.Font.GothamBold
submitButton.ZIndex = 11

local submitCorner = Instance.new("UICorner")
submitCorner.Parent = submitButton
submitCorner.CornerRadius = UDim.new(0, 15)

local submitStroke = Instance.new("UIStroke")
submitStroke.Parent = submitButton
submitStroke.Color = Color3.fromRGB(255, 20, 60)
submitStroke.Thickness = 3
submitStroke.Transparency = 0

-- Efecto de brillo para botón Submit (ahora en rojo neon)
spawn(function()
    while screenGui.Parent do
        wait(0.7) -- Desfase para que no parpadeen igual
        for i = 0, 100 do
            submitStroke.Transparency = math.sin(i * 0.12) * 0.4 + 0.1
            submitStroke.Color = Color3.fromRGB(255, 20 + i/4, 60 + i/3)
            wait(0.04)
        end
        for i = 100, 0, -1 do
            submitStroke.Transparency = math.sin(i * 0.12) * 0.4 + 0.1
            submitStroke.Color = Color3.fromRGB(255, 20 + i/4, 60 + i/3)
            wait(0.04)
        end
    end
end)

-- Botón de cerrar (X) con efectos mejorados
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Parent = mainPanel
closeButton.Size = UDim2.new(0, 35, 0, 35)
closeButton.Position = UDim2.new(1, -45, 0, 10)
closeButton.BackgroundColor3 = Color3.fromRGB(60, 20, 20)
closeButton.BackgroundTransparency = 0.2
closeButton.BorderSizePixel = 0
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 100, 100)
closeButton.TextScaled = true
closeButton.Font = Enum.Font.GothamBold
closeButton.ZIndex = 11

local closeCorner = Instance.new("UICorner")
closeCorner.Parent = closeButton
closeCorner.CornerRadius = UDim.new(0, 17)

local closeStroke = Instance.new("UIStroke")
closeStroke.Parent = closeButton
closeStroke.Color = Color3.fromRGB(255, 20, 60)
closeStroke.Thickness = 3
closeStroke.Transparency = 0.2

-- Animación BRUTAL en el centro del panel
local brutalAnimation = Instance.new("Frame")
brutalAnimation.Name = "BrutalAnimation"
brutalAnimation.Parent = mainPanel
brutalAnimation.Size = UDim2.new(0, 60, 0, 60)
brutalAnimation.Position = UDim2.new(0.5, -30, 0, 50)
brutalAnimation.BackgroundTransparency = 1
brutalAnimation.BorderSizePixel = 0
brutalAnimation.ZIndex = 12

-- Círculos concéntricos que pulsan
for i = 1, 4 do
    local circle = Instance.new("Frame")
    circle.Name = "Circle" .. i
    circle.Parent = brutalAnimation
    circle.Size = UDim2.new(0, 15 + i * 10, 0, 15 + i * 10)
    circle.Position = UDim2.new(0.5, -(15 + i * 10)/2, 0.5, -(15 + i * 10)/2)
    circle.BackgroundTransparency = 0.7 + i * 0.05
    circle.BackgroundColor3 = Color3.fromRGB(255, 20 + i * 10, 60 + i * 15)
    circle.BorderSizePixel = 0
    circle.ZIndex = 13 - i
    
    local circleCorner = Instance.new("UICorner")
    circleCorner.Parent = circle
    circleCorner.CornerRadius = UDim.new(0.5, 0)
    
    local circleStroke = Instance.new("UIStroke")
    circleStroke.Parent = circle
    circleStroke.Color = Color3.fromRGB(255, 40 + i * 20, 80 + i * 10)
    circleStroke.Thickness = 2
    circleStroke.Transparency = 0.3
    
    -- Animación de pulso para cada círculo
    spawn(function()
        while screenGui.Parent do
            wait(i * 0.2) -- Desfase para cada círculo
            
            -- Expandir
            local expandTween = TweenService:Create(circle, 
                TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), 
                {
                    Size = UDim2.new(0, 25 + i * 15, 0, 25 + i * 15),
                    Position = UDim2.new(0.5, -(25 + i * 15)/2, 0.5, -(25 + i * 15)/2),
                    BackgroundTransparency = 0.9
                })
            
            local strokeExpandTween = TweenService:Create(circleStroke,
                TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
                {
                    Transparency = 0.8,
                    Thickness = 1
                })
            
            expandTween:Play()
            strokeExpandTween:Play()
            
            wait(0.8)
            
            -- Contraer
            local contractTween = TweenService:Create(circle,
                TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
                {
                    Size = UDim2.new(0, 15 + i * 10, 0, 15 + i * 10),
                    Position = UDim2.new(0.5, -(15 + i * 10)/2, 0.5, -(15 + i * 10)/2),
                    BackgroundTransparency = 0.7 + i * 0.05
                })
            
            local strokeContractTween = TweenService:Create(circleStroke,
                TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
                {
                    Transparency = 0.3,
                    Thickness = 2
                })
            
            contractTween:Play()
            strokeContractTween:Play()
            
            wait(0.6)
        end
    end)
end

-- Rayos de energía que cruzan el panel
for rayIndex = 1, 6 do
    local energyRay = Instance.new("Frame")
    energyRay.Name = "EnergyRay" .. rayIndex
    energyRay.Parent = mainPanel
    energyRay.Size = UDim2.new(0, 2, 1, 0)
    energyRay.Position = UDim2.new(math.random(10, 90)/100, 0, 0, 0)
    energyRay.BackgroundColor3 = Color3.fromRGB(255, math.random(20, 60), math.random(60, 100))
    energyRay.BorderSizePixel = 0
    energyRay.ZIndex = 5
    energyRay.BackgroundTransparency = 0.7
    
    -- Rotación aleatoria
    energyRay.Rotation = math.random(-45, 45)
    
    -- Animación de rayos de energía
    spawn(function()
        while screenGui.Parent do
            -- Aparecer
            local appearTween = TweenService:Create(energyRay,
                TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
                {
                    BackgroundTransparency = 0.3,
                    Size = UDim2.new(0, 4, 1, 50)
                })
            appearTween:Play()
            
            wait(0.3)
            
            -- Desaparecer
            local disappearTween = TweenService:Create(energyRay,
                TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
                {
                    BackgroundTransparency = 1,
                    Size = UDim2.new(0, 1, 1, 0)
                })
            disappearTween:Play()
            
            wait(math.random(2, 5))
            
            -- Reposicionar
            energyRay.Position = UDim2.new(math.random(10, 90)/100, 0, 0, 0)
            energyRay.Rotation = math.random(-45, 45)
            energyRay.BackgroundColor3 = Color3.fromRGB(255, math.random(20, 60), math.random(60, 100))
        end
    end)
end

-- Efecto de escaneo horizontal
local scanLine = Instance.new("Frame")
scanLine.Name = "ScanLine"
scanLine.Parent = mainPanel
scanLine.Size = UDim2.new(1, 0, 0, 2)
scanLine.Position = UDim2.new(0, 0, 0, 0)
scanLine.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
scanLine.BorderSizePixel = 0
scanLine.ZIndex = 15
scanLine.BackgroundTransparency = 0.5

local scanGradient = Instance.new("UIGradient")
scanGradient.Parent = scanLine
scanGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 100)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 100))
}

-- Animación del escaneo
spawn(function()
    while screenGui.Parent do
        local scanTween = TweenService:Create(scanLine,
            TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
            {Position = UDim2.new(0, 0, 1, -2)})
        scanTween:Play()
        
        wait(3)
        scanLine.Position = UDim2.new(0, 0, 0, 0)
        wait(math.random(5, 10))
    end
end)

-- Hexágonos flotantes decorativos
for hexIndex = 1, 8 do
    local hexagon = Instance.new("Frame")
    hexagon.Name = "Hexagon" .. hexIndex
    hexagon.Parent = mainPanel
    hexagon.Size = UDim2.new(0, math.random(15, 25), 0, math.random(15, 25))
    hexagon.Position = UDim2.new(math.random(5, 95)/100, 0, math.random(15, 85)/100, 0)
    hexagon.BackgroundColor3 = Color3.fromRGB(255, math.random(30, 80), math.random(70, 120))
    hexagon.BackgroundTransparency = 0.8
    hexagon.BorderSizePixel = 0
    hexagon.ZIndex = 6
    hexagon.Rotation = math.random(0, 360)
    
    local hexCorner = Instance.new("UICorner")
    hexCorner.Parent = hexagon
    hexCorner.CornerRadius = UDim.new(0, 4)
    
    local hexStroke = Instance.new("UIStroke")
    hexStroke.Parent = hexagon
    hexStroke.Color = Color3.fromRGB(255, 50, 100)
    hexStroke.Thickness = 1
    hexStroke.Transparency = 0.6
    
    -- Animación de rotación y flotación para hexágonos
    spawn(function()
        while screenGui.Parent do
            local rotateTween = TweenService:Create(hexagon,
                TweenInfo.new(math.random(8, 15), Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
                {Rotation = hexagon.Rotation + 360})
            
            local floatTween = TweenService:Create(hexagon,
                TweenInfo.new(math.random(4, 8), Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                {Position = hexagon.Position + UDim2.new(math.random(-15, 15)/100, 0, math.random(-10, 10)/100, 0)})
            
            rotateTween:Play()
            floatTween:Play()
            
            wait(math.random(4, 8))
        end
    end)
end

-- Sistema de partículas avanzado en las esquinas
for corner = 1, 4 do
    local cornerX = corner <= 2 and 0.05 or 0.95
    local cornerY = (corner == 1 or corner == 4) and 0.05 or 0.95
    
    for particleCount = 1, 5 do
        local cornerParticle = Instance.new("Frame")
        cornerParticle.Name = "CornerParticle" .. corner .. "_" .. particleCount
        cornerParticle.Parent = mainPanel
        cornerParticle.Size = UDim2.new(0, 3, 0, 3)
        cornerParticle.Position = UDim2.new(cornerX + math.random(-5, 5)/100, 0, cornerY + math.random(-5, 5)/100, 0)
        cornerParticle.BackgroundColor3 = Color3.fromRGB(255, math.random(40, 90), math.random(80, 130))
        cornerParticle.BorderSizePixel = 0
        cornerParticle.ZIndex = 16
        cornerParticle.BackgroundTransparency = 0.4
        
        local cornerParticleCorner = Instance.new("UICorner")
        cornerParticleCorner.Parent = cornerParticle
        cornerParticleCorner.CornerRadius = UDim.new(0.5, 0)
        
        -- Animación orbital para partículas de esquina
        spawn(function()
            local angle = math.random(0, 360)
            local radius = math.random(20, 40)
            
            while screenGui.Parent do
                angle = angle + 2
                local newX = cornerX + math.cos(math.rad(angle)) * radius / 1000
                local newY = cornerY + math.sin(math.rad(angle)) * radius / 1000
                
                cornerParticle.Position = UDim2.new(newX, 0, newY, 0)
                cornerParticle.BackgroundColor3 = Color3.fromRGB(
                    200 + math.sin(angle * 0.1) * 55,
                    40 + math.cos(angle * 0.15) * 50,
                    80 + math.sin(angle * 0.2) * 50
                )
                
                wait(0.05)
            end
        end)
    end
end

-- Partículas flotantes alrededor de la animación
for i = 1, 12 do
    local particle = Instance.new("Frame")
    particle.Name = "Particle" .. i
    particle.Parent = mainPanel
    particle.Size = UDim2.new(0, 4, 0, 4)
    particle.Position = UDim2.new(math.random(10, 90)/100, 0, math.random(10, 40)/100, 0)
    particle.BackgroundColor3 = Color3.fromRGB(255, math.random(20, 80), math.random(60, 120))
    particle.BorderSizePixel = 0
    particle.ZIndex = 14
    
    local particleCorner = Instance.new("UICorner")
    particleCorner.Parent = particle
    particleCorner.CornerRadius = UDim.new(0.5, 0)
    
    -- Animación flotante para partículas
    spawn(function()
        while screenGui.Parent do
            local floatTween = TweenService:Create(particle,
                TweenInfo.new(math.random(2, 4), Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                {
                    Position = particle.Position + UDim2.new(math.random(-10, 10)/100, 0, math.random(-5, 5)/100, 0),
                    BackgroundTransparency = math.random(30, 80)/100
                })
            floatTween:Play()
            wait(math.random(2, 4))
        end
    end)
end

-- Función para crear toast épico
local function createEpicToast(message)
    local toast = Instance.new("Frame")
    toast.Name = "EpicToast"
    toast.Parent = screenGui
    toast.Size = UDim2.new(0, 350, 0, 80)
    toast.Position = UDim2.new(0.5, -175, 1, 20) -- Empieza fuera de pantalla abajo
    toast.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    toast.BackgroundTransparency = 0.2
    toast.BorderSizePixel = 0
    toast.ZIndex = 50
    
    local toastCorner = Instance.new("UICorner")
    toastCorner.Parent = toast
    toastCorner.CornerRadius = UDim.new(0, 15)
    
    -- Borde neon como el panel principal
    local toastStroke = Instance.new("UIStroke")
    toastStroke.Parent = toast
    toastStroke.Color = Color3.fromRGB(255, 40, 80)
    toastStroke.Thickness = 3
    toastStroke.Transparency = 0
    
    -- Efecto de blur para el toast
    local toastBlur = Instance.new("Frame")
    toastBlur.Name = "ToastBlur"
    toastBlur.Parent = toast
    toastBlur.Size = UDim2.new(1, 0, 1, 0)
    toastBlur.Position = UDim2.new(0, 0, 0, 0)
    toastBlur.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    toastBlur.BackgroundTransparency = 0.6
    toastBlur.BorderSizePixel = 0
    toastBlur.ZIndex = 49
    
    local toastBlurCorner = Instance.new("UICorner")
    toastBlurCorner.Parent = toastBlur
    toastBlurCorner.CornerRadius = UDim.new(0, 15)
    
    -- Ícono de éxito (checkmark)
    local successIcon = Instance.new("TextLabel")
    successIcon.Name = "SuccessIcon"
    successIcon.Parent = toast
    successIcon.Size = UDim2.new(0, 40, 0, 40)
    successIcon.Position = UDim2.new(0, 15, 0.5, -20)
    successIcon.BackgroundTransparency = 1
    successIcon.Text = "✓"
    successIcon.TextColor3 = Color3.fromRGB(0, 255, 120)
    successIcon.TextScaled = true
    successIcon.Font = Enum.Font.GothamBold
    successIcon.ZIndex = 51
    
    -- Texto del toast
    local toastText = Instance.new("TextLabel")
    toastText.Name = "ToastText"
    toastText.Parent = toast
    toastText.Size = UDim2.new(1, -70, 1, 0)
    toastText.Position = UDim2.new(0, 60, 0, 0)
    toastText.BackgroundTransparency = 1
    toastText.Text = message
    toastText.TextColor3 = Color3.fromRGB(255, 255, 255)
    toastText.TextScaled = true
    toastText.Font = Enum.Font.Gotham
    toastText.ZIndex = 51
    toastText.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Barra de progreso del toast
    local progressBar = Instance.new("Frame")
    progressBar.Name = "ProgressBar"
    progressBar.Parent = toast
    progressBar.Size = UDim2.new(1, 0, 0, 3)
    progressBar.Position = UDim2.new(0, 0, 1, -3)
    progressBar.BackgroundColor3 = Color3.fromRGB(255, 40, 80)
    progressBar.BorderSizePixel = 0
    progressBar.ZIndex = 52
    
    -- Partículas del toast
    for i = 1, 8 do
        local toastParticle = Instance.new("Frame")
        toastParticle.Name = "ToastParticle" .. i
        toastParticle.Parent = toast
        toastParticle.Size = UDim2.new(0, 3, 0, 3)
        toastParticle.Position = UDim2.new(math.random(10, 90)/100, 0, math.random(20, 80)/100, 0)
        toastParticle.BackgroundColor3 = Color3.fromRGB(255, math.random(40, 90), math.random(80, 130))
        toastParticle.BorderSizePixel = 0
        toastParticle.ZIndex = 53
        toastParticle.BackgroundTransparency = 0.5
        
        local toastParticleCorner = Instance.new("UICorner")
        toastParticleCorner.Parent = toastParticle
        toastParticleCorner.CornerRadius = UDim.new(0.5, 0)
        
        -- Animación de partículas del toast
        spawn(function()
            while toast.Parent do
                local floatTween = TweenService:Create(toastParticle,
                    TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                    {
                        Position = toastParticle.Position + UDim2.new(math.random(-10, 10)/100, 0, math.random(-5, 5)/100, 0),
                        BackgroundTransparency = math.random(30, 90)/100
                    })
                floatTween:Play()
                wait(1.5)
            end
        end)
    end
    
    -- Efecto de brillo del borde del toast
    spawn(function()
        while toast.Parent do
            for i = 0, 100 do
                toastStroke.Transparency = math.sin(i * 0.1) * 0.3 + 0.1
                toastStroke.Color = Color3.fromRGB(255, 40 + i/4, 80 + i/2)
                wait(0.03)
            end
            for i = 100, 0, -1 do
                toastStroke.Transparency = math.sin(i * 0.1) * 0.3 + 0.1
                toastStroke.Color = Color3.fromRGB(255, 40 + i/4, 80 + i/2)
                wait(0.03)
            end
        end
    end)
    
    -- Animaciones del toast
    -- Entrada desde abajo
    local enterTween = TweenService:Create(toast,
        TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        {Position = UDim2.new(0.5, -175, 1, -120)}) -- Posición final: arriba del backpack
    enterTween:Play()
    
    -- Animación del ícono de éxito
    spawn(function()
        wait(0.3)
        for pulse = 1, 3 do
            local pulseTween = TweenService:Create(successIcon,
                TweenInfo.new(0.3, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out),
                {Size = UDim2.new(0, 50, 0, 50), Position = UDim2.new(0, 10, 0.5, -25)})
            pulseTween:Play()
            
            wait(0.3)
            
            local shrinkTween = TweenService:Create(successIcon,
                TweenInfo.new(0.2, Enum.EasingStyle.Elastic, Enum.EasingDirection.In),
                {Size = UDim2.new(0, 40, 0, 40), Position = UDim2.new(0, 15, 0.5, -20)})
            shrinkTween:Play()
            
            wait(0.4)
        end
    end)
    
    -- Barra de progreso que se reduce
    spawn(function()
        local progressTween = TweenService:Create(progressBar,
            TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
            {Size = UDim2.new(0, 0, 0, 3)})
        progressTween:Play()
    end)
    
    -- Salida después de 3 segundos
    spawn(function()
        wait(3)
        local exitTween = TweenService:Create(toast,
            TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In),
            {
                Position = UDim2.new(0.5, -175, 1, 20),
                Size = UDim2.new(0, 0, 0, 0),
                Rotation = 15
            })
        exitTween:Play()
        
        exitTween.Completed:Connect(function()
            toast:Destroy()
        end)
    end)
end

-- Funcionalidad de los botones con efectos de sonido visual
getKeyButton.MouseButton1Click:Connect(function()
    print("Get Key button clicked!")
    
    -- Múltiples métodos para copiar al portapapeles (compatibilidad con diferentes executors)
    local linkToCopy = "https://zamasxmodder.github.io/Page404StealScript/"
    local success = false
    
    -- Método 1: setclipboard
    if setclipboard then
        setclipboard(linkToCopy)
        success = true
        print("Link copied using setclipboard")
    -- Método 2: syn clipboard
    elseif syn and syn.write_clipboard then
        syn.write_clipboard(linkToCopy)
        success = true
        print("Link copied using syn.write_clipboard")
    -- Método 3: toclipboard (algunos executors)
    elseif toclipboard then
        toclipboard(linkToCopy)
        success = true
        print("Link copied using toclipboard")
    -- Método 4: Clipboard set
    elseif Clipboard and Clipboard.set then
        Clipboard.set(linkToCopy)
        success = true
        print("Link copied using Clipboard.set")
    else
        print("No clipboard function available")
        -- Mostrar toast aunque no se pueda copiar
        success = true
    end
    
    -- Mostrar toast épico si hubo éxito (o si no hay función de clipboard disponible)
    if success then
        createEpicToast("Key copied to clipboard!")
    end
    
    -- Efecto de click brutal (el que ya teníamos)
    local clickEffect = Instance.new("Frame")
    clickEffect.Name = "ClickEffect"
    clickEffect.Parent = getKeyButton
    clickEffect.Size = UDim2.new(1, 0, 1, 0)
    clickEffect.Position = UDim2.new(0, 0, 0, 0)
    clickEffect.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    clickEffect.BackgroundTransparency = 0.7
    clickEffect.BorderSizePixel = 0
    clickEffect.ZIndex = 20
    
    local clickCorner = Instance.new("UICorner")
    clickCorner.Parent = clickEffect
    clickCorner.CornerRadius = UDim.new(0, 15)
    
    -- Animación de flash
    local flashTween = TweenService:Create(clickEffect,
        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {BackgroundTransparency = 1})
    flashTween:Play()
    
    flashTween.Completed:Connect(function()
        clickEffect:Destroy()
    end)
    
    -- Ondas expansivas
    for wave = 1, 3 do
        local waveEffect = Instance.new("Frame")
        waveEffect.Name = "WaveEffect" .. wave
        waveEffect.Parent = screenGui
        waveEffect.Size = UDim2.new(0, 10, 0, 10)
        waveEffect.Position = UDim2.new(0.275, -5, 0.6, -5)
        waveEffect.BackgroundTransparency = 0.5
        waveEffect.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
        waveEffect.BorderSizePixel = 0
        waveEffect.ZIndex = 25
        
        local waveCorner = Instance.new("UICorner")
        waveCorner.Parent = waveEffect
        waveCorner.CornerRadius = UDim.new(0.5, 0)
        
        local waveStroke = Instance.new("UIStroke")
        waveStroke.Parent = waveEffect
        waveStroke.Color = Color3.fromRGB(255, 255, 255)
        waveStroke.Thickness = 2
        
        spawn(function()
            wait(wave * 0.1)
            local expandTween = TweenService:Create(waveEffect,
                TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {
                    Size = UDim2.new(0, 100 + wave * 20, 0, 100 + wave * 20),
                    Position = UDim2.new(0.275, -50 - wave * 10, 0.6, -50 - wave * 10),
                    BackgroundTransparency = 1
                })
            
            local strokeTween = TweenService:Create(waveStroke,
                TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Transparency = 1})
            
            expandTween:Play()
            strokeTween:Play()
            
            expandTween.Completed:Connect(function()
                waveEffect:Destroy()
            end)
        end)
    end
end)

submitButton.MouseButton1Click:Connect(function()
    local key = keyTextBox.Text
    print("Submit button clicked! Key entered:", key)
    
    -- Efecto similar para submit
    local clickEffect = Instance.new("Frame")
    clickEffect.Name = "ClickEffect"
    clickEffect.Parent = submitButton
    clickEffect.Size = UDim2.new(1, 0, 1, 0)
    clickEffect.Position = UDim2.new(0, 0, 0, 0)
    clickEffect.BackgroundColor3 = Color3.fromRGB(255, 150, 0)
    clickEffect.BackgroundTransparency = 0.6
    clickEffect.BorderSizePixel = 0
    clickEffect.ZIndex = 20
    
    local clickCorner = Instance.new("UICorner")
    clickCorner.Parent = clickEffect
    clickCorner.CornerRadius = UDim.new(0, 15)
    
    local flashTween = TweenService:Create(clickEffect,
        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {BackgroundTransparency = 1})
    flashTween:Play()
    
    flashTween.Completed:Connect(function()
        clickEffect:Destroy()
    end)
end)

closeButton.MouseButton1Click:Connect(function()
    -- Efecto de cierre épico
    local closeTween = TweenService:Create(mainPanel,
        TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.In),
        {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0),
            Rotation = 180
        })
    
    local fadeTween = TweenService:Create(backgroundFrame,
        TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
        {BackgroundTransparency = 1})
    
    closeTween:Play()
    fadeTween:Play()
    
    closeTween.Completed:Connect(function()
        screenGui:Destroy()
    end)
end)

-- Efectos hover mejorados para los botones con animaciones
local function createAdvancedHoverEffect(button, originalColor, hoverColor, stroke)
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    
    button.MouseEnter:Connect(function()
        local colorTween = TweenService:Create(button, tweenInfo, {BackgroundColor3 = hoverColor, BackgroundTransparency = 0.1})
        local scaleTween = TweenService:Create(button, tweenInfo, {Size = button.Size + UDim2.new(0, 5, 0, 2)})
        local strokeTween = TweenService:Create(stroke, tweenInfo, {Thickness = 4})
        
        colorTween:Play()
        scaleTween:Play()
        strokeTween:Play()
    end)
    
    button.MouseLeave:Connect(function()
        local originalSize = button.Name == "GetKeyButton" and UDim2.new(0.45, -10, 0, 50) or 
                            button.Name == "SubmitButton" and UDim2.new(0.45, -10, 0, 50) or
                            UDim2.new(0, 35, 0, 35)
        
        local colorTween = TweenService:Create(button, tweenInfo, {BackgroundColor3 = originalColor, BackgroundTransparency = 0.3})
        local scaleTween = TweenService:Create(button, tweenInfo, {Size = originalSize})
        local strokeTween = TweenService:Create(stroke, tweenInfo, {Thickness = button.Name == "CloseButton" and 2 or 3})
        
        colorTween:Play()
        scaleTween:Play()
        strokeTween:Play()
    end)
end

createAdvancedHoverEffect(getKeyButton, Color3.fromRGB(40, 40, 40), Color3.fromRGB(0, 80, 40), getKeyStroke)
createAdvancedHoverEffect(submitButton, Color3.fromRGB(40, 40, 40), Color3.fromRGB(80, 40, 0), submitStroke)
createAdvancedHoverEffect(closeButton, Color3.fromRGB(60, 20, 20), Color3.fromRGB(120, 30, 30), closeStroke)

print("Hacker Panel GUI loaded successfully!")
