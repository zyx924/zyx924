--========================================
-- ZYX EGG FINDER V2.2
-- GUI FIX
--========================================

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local Player = Players.LocalPlayer

-- CLEAN OLD GUI
pcall(function()
    local old = gethui():FindFirstChild("ZYX_EGG_FINDER")
    if old then old:Destroy() end
end)

pcall(function()
    local old = CoreGui:FindFirstChild("ZYX_EGG_FINDER")
    if old then old:Destroy() end
end)

-- GUI
local GUI = Instance.new("ScreenGui")
GUI.Name = "ZYX_EGG_FINDER"
GUI.ResetOnSpawn = false
GUI.IgnoreGuiInset = true
GUI.DisplayOrder = 999999
GUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- PARENT FIX
local parented = false

if gethui then
    parented = pcall(function()
        GUI.Parent = gethui()
    end)
end

if not parented then
    parented = pcall(function()
        GUI.Parent = CoreGui
    end)
end

if not parented then
    GUI.Parent = Player:WaitForChild("PlayerGui")
end

-- CREATE FUNCTION
local function Create(class, properties, parent)
    local obj = Instance.new(class)

    for key, value in pairs(properties) do
        obj[key] = value
    end

    obj.Parent = parent
    return obj
end

-- MAIN
local Main = Create("Frame", {
    Size = UDim2.fromOffset(340, 430),
    Position = UDim2.new(0.5, -170, 0.5, -215),
    BackgroundColor3 = Color3.fromRGB(20, 20, 32),
    BorderSizePixel = 0,
    Visible = true
}, GUI)

Create("UICorner", {
    CornerRadius = UDim.new(0, 15)
}, Main)

Create("UIStroke", {
    Color = Color3.fromRGB(160, 50, 255),
    Thickness = 2
}, Main)

-- HEADER
local Header = Create("Frame", {
    Size = UDim2.new(1, 0, 0, 60),
    BackgroundColor3 = Color3.fromRGB(135, 0, 230),
    BorderSizePixel = 0
}, Main)

Create("UICorner", {
    CornerRadius = UDim.new(0, 15)
}, Header)

local Title = Create("TextLabel", {
    Size = UDim2.new(1, -100, 1, 0),
    Position = UDim2.fromOffset(15, 0),
    BackgroundTransparency = 1,
    Text = "ZYX EGG FINDER",
    TextColor3 = Color3.new(1, 1, 1),
    TextSize = 20,
    Font = Enum.Font.GothamBlack,
    TextXAlignment = Enum.TextXAlignment.Left
}, Header)

-- MINIMIZE
local Minimize = Create("TextButton", {
    Size = UDim2.fromOffset(35, 35),
    Position = UDim2.new(1, -82, 0, 12),
    BackgroundColor3 = Color3.fromRGB(80, 40, 130),
    Text = "—",
    TextColor3 = Color3.new(1, 1, 1),
    TextSize = 22,
    Font = Enum.Font.GothamBold
}, Header)

Create("UICorner", {
    CornerRadius = UDim.new(0, 8)
}, Minimize)

-- CLOSE
local Close = Create("TextButton", {
    Size = UDim2.fromOffset(35, 35),
    Position = UDim2.new(1, -42, 0, 12),
    BackgroundColor3 = Color3.fromRGB(220, 45, 65),
    Text = "X",
    TextColor3 = Color3.new(1, 1, 1),
    TextSize = 17,
    Font = Enum.Font.GothamBold
}, Header)

Create("UICorner", {
    CornerRadius = UDim.new(0, 8)
}, Close)

-- STATUS
local Status = Create("TextLabel", {
    Size = UDim2.new(1, -20, 0, 30),
    Position = UDim2.fromOffset(10, 70),
    BackgroundTransparency = 1,
    Text = "● ZYX SYSTEM ONLINE",
    TextColor3 = Color3.fromRGB(70, 255, 140),
    TextSize = 13,
    Font = Enum.Font.GothamBold,
    TextXAlignment = Enum.TextXAlignment.Left
}, Main)

-- SCAN
local Scan = Create("TextButton", {
    Size = UDim2.new(1, -20, 0, 45),
    Position = UDim2.fromOffset(10, 110),
    BackgroundColor3 = Color3.fromRGB(35, 190, 100),
    Text = "START SCAN",
    TextColor3 = Color3.new(1, 1, 1),
    TextSize = 16,
    Font = Enum.Font.GothamBold
}, Main)

Create("UICorner", {
    CornerRadius = UDim.new(0, 8)
}, Scan)

-- FILTER
local Filter = Create("TextBox", {
    Size = UDim2.new(1, -20, 0, 40),
    Position = UDim2.fromOffset(10, 165),
    BackgroundColor3 = Color3.fromRGB(40, 40, 55),
    Text = "0",
    PlaceholderText = "Minimum Income",
    TextColor3 = Color3.new(1, 1, 1),
    TextSize = 14,
    Font = Enum.Font.Gotham,
    ClearTextOnFocus = false
}, Main)

Create("UICorner", {
    CornerRadius = UDim.new(0, 8)
}, Filter)

-- RESULTS
local Results = Create("ScrollingFrame", {
    Size = UDim2.new(1, -20, 0, 175),
    Position = UDim2.fromOffset(10, 220),
    BackgroundColor3 = Color3.fromRGB(30, 30, 43),
    BorderSizePixel = 0,
    ScrollBarThickness = 4,
    CanvasSize = UDim2.new(0, 0, 0, 0)
}, Main)

Create("UICorner", {
    CornerRadius = UDim.new(0, 8)
}, Results)

local Layout = Create("UIListLayout", {
    Padding = UDim.new(0, 6)
}, Results)

-- FOOTER
Create("TextLabel", {
    Size = UDim2.new(1, -20, 0, 25),
    Position = UDim2.new(0, 10, 1, -28),
    BackgroundTransparency = 1,
    Text = "ZYX EGG FINDER | V2.2",
    TextColor3 = Color3.fromRGB(150, 150, 170),
    TextSize = 11,
    Font = Enum.Font.GothamBold
}, Main)

-- FLOATING BUTTON
local Floating = Create("TextButton", {
    Size = UDim2.fromOffset(58, 58),
    Position = UDim2.new(0.8, 0, 0.45, 0),
    BackgroundColor3 = Color3.fromRGB(140, 0, 230),
    Text = "ZYX",
    TextColor3 = Color3.new(1, 1, 1),
    TextSize = 18,
    Font = Enum.Font.GothamBlack,
    Visible = false
}, GUI)

Create("UICorner", {
    CornerRadius = UDim.new(1, 0)
}, Floating)

Create("UIStroke", {
    Color = Color3.fromRGB(220, 160, 255),
    Thickness = 2
}, Floating)

-- MINIMIZE / RESTORE
Minimize.Activated:Connect(function()
    Main.Visible = false
    Floating.Visible = true
end)

Floating.Activated:Connect(function()
    Main.Visible = true
    Floating.Visible = false
end)

-- CLOSE
Close.Activated:Connect(function()
    GUI:Destroy()
end)

-- DRAG MAIN
local function MakeDraggable(handle, target)

    local dragging = false
    local dragStart
    local startPos
    local dragInput

    handle.InputBegan:Connect(function(input)

        if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then

            dragging = true
            dragStart = input.Position
            startPos = target.Position
            dragInput = input

        end

    end)

    UIS.InputChanged:Connect(function(input)

        if dragging and (
            input.UserInputType == Enum.UserInputType.Touch
            or input.UserInputType == Enum.UserInputType.MouseMovement
        ) then

            local delta = input.Position - dragStart

            target.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )

        end

    end)

    UIS.InputEnded:Connect(function(input)

        if input == dragInput then
            dragging = false
        end

    end)

end

MakeDraggable(Header, Main)
MakeDraggable(Floating, Floating)

-- TEST BUTTON
Scan.Activated:Connect(function()

    Status.Text = "● UI WORKING - SCANNER NOT CONNECTED"
    Status.TextColor3 = Color3.fromRGB(255, 210, 70)

end)

print("================================")
print("ZYX EGG FINDER V2.2 LOADED")
print("GUI PARENT:", GUI.Parent:GetFullName())
print("================================")
