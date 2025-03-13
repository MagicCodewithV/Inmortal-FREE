-- Simple ESP from 1aqua & inmortal.wtf dont be skid and change this line :)
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

local function showNotification(text, duration)
    StarterGui:SetCore("SendNotification", {
        Title = "ALERT",
        Text = text,
        Duration = duration
    })
end

showNotification("ESP IS WORKING? inmortal.wtf solutions", 15)

task.wait(3)

local function sendPrivateChatMessage(text, color)
    StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = text,
        Color = color,
        Font = Enum.Font.SourceSansBold,
        FontSize = Enum.FontSize.Size24
    })
end

local function applyESP(player)
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then

        if player.Character:FindFirstChild("ESP_Highlight") then
            player.Character.ESP_Highlight:Destroy()
        end
        if player.Character:FindFirstChild("ESP_Name") then
            player.Character.ESP_Name:Destroy()
        end

        local highlight = Instance.new("Highlight")
        highlight.Parent = player.Character
        highlight.Name = "ESP_Highlight"
        highlight.FillColor = Color3.fromRGB(255, 0, 0)
        highlight.OutlineColor = Color3.fromRGB(255, 255, 0)
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop

        local billboard = Instance.new("BillboardGui")
        billboard.Parent = player.Character.HumanoidRootPart
        billboard.Name = "ESP_Name"
        billboard.Size = UDim2.new(5, 0, 1, 0)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.AlwaysOnTop = true

        local nameLabel = Instance.new("TextLabel")
        nameLabel.Parent = billboard
        nameLabel.Size = UDim2.new(1, 0, 1, 0)
        nameLabel.Text = player.Name
        nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        nameLabel.BackgroundTransparency = 1
        nameLabel.TextScaled = true
        nameLabel.Font = Enum.Font.GothamBold

        if player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
        end
    end
end

task.spawn(function()
    while true do
        for _, player in ipairs(Players:GetPlayers()) do
            applyESP(player)
        end
        task.wait(3)
    end
end)
