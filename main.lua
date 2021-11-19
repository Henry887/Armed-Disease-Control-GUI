-- Made by Henry1887#6969
-- If u want to showcase this script or use bits of the script from this then please credit me!
-- DM me if u found Bugs or wanna give me feedback
-- Hit Execute once ur  character is loaded
if game.PlaceId == 6370195843 then
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("Armed Disease Control", "Synapse")
    local CureTab = Window:NewTab("Cure")
    local CureSection = CureTab:NewSection("Cure Yourself")
    local StatusTab = Window:NewTab("Status")
    local localTab = Window:NewTab("LocalPlayer")
    local KeybindTab = Window:NewTab("Keybinds")
    local CreditTab = Window:NewTab("Henry1887#6969")
    local KeybindSection = KeybindTab:NewSection("Keybinds")
    local PlayerSection = localTab:NewSection("Local")
    local YourStatusSection = StatusTab:NewSection("Your Status:")
    local OtherStatusSection = StatusTab:NewSection("Others Status:")
    local chosenPlayer = ""
    local Player = game:GetService("Players").LocalPlayer.Character
    local yourDiseases = {}
    local yourSymptoms = {}
    local antiafk = false
    CureSection:NewDropdown("Cure Specific Disease", "Cures the specified disease if you have it", {"Bloxpox", "The Farts", "Flu", "Fever", "Killer", "Bloxulosis"}, function(dis)
        a = Player.Diseases:FindFirstChild(dis)
        if a then
            a:Destroy()
        end
    end)
    KeybindSection:NewKeybind("Open/Close GUI", "this opens and closes this gui", Enum.KeyCode.F, function()
	    Library:ToggleUI()
    end)
    PlayerSection:NewToggle("Toggle AntiAFK", "You can Farm exp with this", function(state)
        antiafk = state
    end)
    PlayerSection:NewButton("GodMode (Rejoin to Disable)", "You cannot die, but at what cost?", function()
        local player = game.Players.LocalPlayer
        if player.Character then
            if player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.Name = "1"
            end
            local l = player.Character["1"]:Clone()
            l.Parent = player.Character
            l.Name = "Humanoid"; wait(0.1)
            player.Character["1"]:Destroy()
            workspace.CurrentCamera.CameraSubject = player.Character.Humanoid
            player.Character.Animate.Disabled = true; wait(0.1)
            player.Character.Animate.Disabled = false
        end
    end)
    CureSection:NewButton("Cure Every Disease", "This removes all diseases and symptoms from you", function()
        local Diseases = Player.Diseases:GetChildren()
        local Symptoms = Player.Symptoms:GetChildren()
        if Diseases then
            for i, v in pairs(Diseases) do
                if v then
                    v:Destroy()
                end
            end
        end
        if Symptoms then
            for i, v in pairs(Symptoms) do
                if v then
                    v:Destroy()
                end
            end
        end
    end)
    CureSection:NewButton("Remove only Symptoms", "This only removes all symptoms from you", function()
        local Symptoms = Player.Symptoms:GetChildren()
        if Symptoms then
            for i, v in pairs(Symptoms) do
                if v then
                    v:Destroy()
                end
            end
        end
    end)
    
    
    
    local DiseasesLabel = YourStatusSection:NewLabel("Initializing...")
    local SymptomsLabel = YourStatusSection:NewLabel("Initializing...")
    OtherStatusSection:NewTextBox("Player Name", "Selects the player from which the status is", function(name)
	    if game.Workspace:FindFirstChild(name) then
	        chosenPlayer = name
	    end
    end)
    local SelectedLabel = OtherStatusSection:NewLabel("Chosen: None")
    local ODieseasesLabel = OtherStatusSection:NewLabel("Initializing...")
    local OSymptomsLabel = OtherStatusSection:NewLabel("Initializing...")
    print("Loaded!")
    while wait(1) do
        if antiafk then
            game:GetService("ReplicatedStorage").Remotes.AFKToggle:FireServer(false)
        end
        SelectedLabel:UpdateLabel("Chosen: " .. chosenPlayer)
        local yourDiseases = {}
        local yourSymptoms = {}
        local Diseases = Player.Diseases:GetChildren()
        local Symptoms = Player.Symptoms:GetChildren()
        if Diseases then
            for i, v in pairs(Diseases) do
                if v then
                    table.insert(yourDiseases, v.Name)
                end
            end
        end
        if Symptoms then
            for i, v in pairs(Symptoms) do
                if v then
                    table.insert(yourSymptoms, v.Name)
                end
            end
        end
        local d = ""
        local s = ""
        if #yourDiseases > 0 then
            for i, v in ipairs(yourDiseases) do
                if yourDiseases[i + 1] then
                    d = d .. v .. ", "
                else
                    d = d .. v
                end
            end
        else
            d = "No Diseases"
        end
        if #yourSymptoms > 0 then
            for i, v in ipairs(yourSymptoms) do
                if yourSymptoms[i + 1] then
                    s = s .. v .. ", "
                else
                    s = s .. v
                end
            end
        else
            s = "No Symptoms"
        end
        DiseasesLabel:UpdateLabel(d)
        SymptomsLabel:UpdateLabel(s)
        if game.Workspace:FindFirstChild(chosenPlayer) then
            local otherDiseases = {}
            local otherSymptoms = {}
            local OPlayer = game.Workspace[chosenPlayer]
            local ODiseases = OPlayer.Diseases:GetChildren()
            local OSymptoms = OPlayer.Symptoms:GetChildren()
            if ODiseases then
                for i, v in pairs(ODiseases) do
                    if v then
                        table.insert(otherDiseases, v.Name)
                    end
                end
            end
            if OSymptoms then
                for i, v in pairs(OSymptoms) do
                    if v then
                        table.insert(otherSymptoms, v.Name)
                    end
                end
            end
            local od = ""
            local os = ""
            if #otherDiseases >  0 then
                for i, v in ipairs(otherDiseases) do
                    if otherDiseases[i + 1] then
                        od = od .. v .. ", "
                    else
                        od = od .. v
                    end
                end
            else
                od = "No Diseases"
            end
            if #otherSymptoms >  0 then
                for i, v in ipairs(otherSymptoms) do
                    if otherSymptoms[i + 1] then
                        os = os .. v .. ", "
                    else
                        os = os .. v
                    end
                end
            else
                os = "No Symptoms"
            end
            ODieseasesLabel:UpdateLabel(od)
            OSymptomsLabel:UpdateLabel(os)
        else
            ODieseasesLabel:UpdateLabel("Player Doesnt Exist anymore!")
            OSymptomsLabel:UpdateLabel("Player Doesnt Exist anymore!")
        end
    end
end
