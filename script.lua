-- Обновлённый KereiGui с FreeCam
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local humanoid = char:WaitForChild("Humanoid")
local hrp = char:WaitForChild("HumanoidRootPart")

pcall(function() player.PlayerGui.KereiGui:Destroy() end)

local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.Name = "KereiGui"
local frame = Instance.new("Frame", gui)
frame.Position = UDim2.new(0, 50, 0, 50)
frame.Size = UDim2.new(0, 220, 0, 510)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)

local function makeButton(text, yPos, callback)
	local btn = Instance.new("TextButton", frame)
	btn.Text = text
	btn.Size = UDim2.new(1, 0, 0, 40)
	btn.Position = UDim2.new(0, 0, 0, yPos)
	btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.Font = Enum.Font.SourceSansBold
	btn.TextSize = 18
	btn.MouseButton1Click:Connect(callback)
end

-- Стандартные функции
makeButton("Скорость x2", 0, function()
	humanoid.WalkSpeed = 64
end)

makeButton("Супер Прыжок", 45, function()
	humanoid.JumpPower = 150
end)

makeButton("Авто-исцеление", 90, function()
	humanoid.HealthChanged:Connect(function(hp)
		if hp < humanoid.MaxHealth / 2 then
			humanoid.Health = humanoid.MaxHealth
		end
	end)
end)

-- === Телепорты ===
makeButton("ТП в Форт", 135, function()
	hrp.CFrame = CFrame.new(Vector3.new(1200, 50, 400))
end)

makeButton("ТП в Стерлинг", 180, function()
	hrp.CFrame = CFrame.new(Vector3.new(100, 50, 200))
end)

makeButton("ТП в Пещеру", 225, function()
	hrp.CFrame = CFrame.new(Vector3.new(850, 30, 1500))
end)

makeButton("ТП к Маске", 270, function()
	hrp.CFrame = CFrame.new(Vector3.new(900, 40, 1800))
end)

makeButton("ТП в Вампирский замок", 315, function()
	hrp.CFrame = CFrame.new(Vector3.new(1600, 50, 2300))
end)

-- === ESP и Трекеры ===
local espEnabled = false
local mobESP = {}
local itemESP = {}
local unicornESP = {}

local function createESP(object, color)
	local espPart = Instance.new("
