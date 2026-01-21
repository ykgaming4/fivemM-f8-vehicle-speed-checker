-- Bericht in de chat wanneer de speler inlaadt
AddEventHandler('onClientResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then return end
    
    TriggerEvent('chat:addMessage', {
        color = { 50, 205, 50}, -- Limoengroen
        args = {"Hoogeveen RP", "Voertuig Analyse script geladen. Gemaakt door Yvo."}
    })

    TriggerEvent('chat:addSuggestion', '/topsnelheid', 'Toon uitgebreide technische informatie van dit voertuig.')
end)

RegisterCommand('topsnelheid', function()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if vehicle ~= 0 then
        -- Basis informatie
        local vehicleModel = GetEntityModel(vehicle)
        local vehicleName = GetLabelText(GetDisplayNameFromVehicleModel(vehicleModel))
        local plate = GetVehicleNumberPlateText(vehicle)
        
        -- Snelheid berekeningen
        -- 1. De standaard GTA handling topsnelheid
        local maxSpeedGTA = math.floor(GetVehicleEstimatedMaxSpeed(vehicle) * 3.6)
        
        -- 2. De gecalculeerde snelheid (vaak hoger in FiveM door aanpassingen)
        local maxSpeedFiveM = math.floor(GetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveMaxFlatVel") * 1.32)
        
        local gears = GetVehicleHighGear(vehicle)
        
        -- Status informatie
        local health = math.floor(GetVehicleEngineHealth(vehicle) / 10) 
        local fuel = math.floor(GetVehicleFuelLevel(vehicle))
        
        -- Aandrijving bepalen
        local driveBias = GetVehicleHandlingFloat(vehicle, "CHandlingData", "fDriveBiasFront")
        local driveType = "Achterwielaandrijving (RWD)"
        if driveBias == 1.0 then driveType = "Voorwielaandrijving (FWD)"
        elseif driveBias > 0.0 and driveBias < 1.0 then driveType = "Vierwielaandrijving (AWD)" end

        -- Uitgebreide F8 Output
        print(" ")
        print("=======================================")
        print("       HOOGEVEEN RP VOERTUIG RAPPORT    ")
        print("=======================================")
        print(" MODEL:       " .. vehicleName)
        print(" KENTEKEN:    " .. plate)
        print("---------------------------------------")
        print(" GTA STANDAARD: " .. maxSpeedGTA .. " KMPH")
        print(" FIVEM POTENTIE: " .. maxSpeedFiveM .. " KMPH")
        print(" VERSNELLING:   " .. gears .. " Versnellingen")
        print(" AANDRIJVING:   " .. driveType)
        print("---------------------------------------")
        print(" MOTOR CONDITIE: " .. health .. "%")
        print(" BRANDSTOF:      " .. fuel .. "%")
        print("---------------------------------------")
        print(" Gemaakt door Yvo voor Hoogeveen RP")
        print("=======================================")
        print(" ")
        
        TriggerEvent('chat:addMessage', {
            color = { 0, 100, 0}, -- Donkergroen
            args = {"Voertuig Info", "De analyse staat in je F8 console!"}
        })
    else
        TriggerEvent('chat:addMessage', {
            color = { 255, 0, 0},
            args = {"Systeem", "Je moet in een voertuig zitten om dit rapport op te vragen."}
        })
    end
end, false)
