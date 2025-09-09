if not game:IsLoaded() then game.Loaded:Wait(); end 
local v0 = game:GetService("Players");
local v1 = game:GetService("RunService");
local v2 = game:GetService("VirtualUser");
local v3 = game:GetService("UserInputService");
local v4 = v0.LocalPlayer;
local v5 = v4.Character or v4.CharacterAdded:Wait();
local v6 = v5:WaitForChild("HumanoidRootPart");
local v7 = v5:WaitForChild("Humanoid");

local v8 = Instance.new("ScreenGui");
v8.Name = "VortexGlobalGui";
v8.Parent = v4:WaitForChild("PlayerGui");

local v11 = Instance.new("Frame", v8);
v11.Size = UDim2.new(0, 200, 0, 300);
v11.Position = UDim2.new(0, 20, 0, 100);
v11.BackgroundColor3 = Color3.fromRGB(30,30,30);
v11.Active = true;
v11.Draggable = true;

local v17 = Instance.new("UICorner", v11);
v17.CornerRadius = UDim.new(0, 10);

local v19 = Instance.new("TextLabel", v11);
v19.Size = UDim2.new(1, 0, 0, 30);
v19.BackgroundTransparency = 1;
v19.Text = "Vortex | GLOBAL";
v19.TextColor3 = Color3.fromRGB(255,255,255);
v19.Font = Enum.Font.GothamBold;
v19.TextSize = 16;

-- Fungsi buat bikin tombol
local function v27(y, txt, col)
    local v66 = Instance.new("TextButton", v11);
    v66.Size = UDim2.new(1, -20, 0, 25);
    v66.Position = UDim2.new(0, 10, 0, y);
    v66.Text = txt;
    v66.BackgroundColor3 = col;
    v66.TextColor3 = Color3.new(1,1,1);
    v66.Font = Enum.Font.Gotham;
    v66.TextSize = 14;
    local v75 = Instance.new("UICorner", v66);
    v75.CornerRadius = UDim.new(0, 5);
    return v66;
end

-- TextBox untuk input nama player
local vInput = Instance.new("TextBox", v11);
vInput.Size = UDim2.new(1, -20, 0, 25);
vInput.Position = UDim2.new(0, 10, 0, 40);
vInput.PlaceholderText = "Masukkan Username/Display";
vInput.BackgroundColor3 = Color3.fromRGB(50,50,50);
vInput.TextColor3 = Color3.new(1,1,1);
vInput.Font = Enum.Font.Gotham;
vInput.TextSize = 14;
local vInputCorner = Instance.new("UICorner", vInput);
vInputCorner.CornerRadius = UDim.new(0,5);

-- Tombol Teleport
local vTeleport = v27(80, "Teleport to Player", Color3.fromRGB(0,170,255));
-- Tombol Bring
local vBring = v27(110, "Bring Player", Color3.fromRGB(255,70,70));

-- Cari player berdasarkan username / display name
local function findPlayer(name)
    for _, plr in ipairs(v0:GetPlayers()) do
        if string.lower(plr.Name) == string.lower(name) or string.lower(plr.DisplayName) == string.lower(name) then
            return plr;
        end
    end
    return nil;
end

-- Event Teleport
vTeleport.MouseButton1Click:Connect(function()
    local targetName = vInput.Text;
    local target = findPlayer(targetName);
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        v6.CFrame = target.Character.HumanoidRootPart.CFrame + Vector3.new(0,3,0);
    end
end)

-- Event Bring
vBring.MouseButton1Click:Connect(function()
    local targetName = vInput.Text;
    local target = findPlayer(targetName);
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        target.Character.HumanoidRootPart.CFrame = v6.CFrame + Vector3.new(2,0,0);
    end
end)
