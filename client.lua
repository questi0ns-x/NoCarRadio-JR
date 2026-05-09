-- NoCarRadio-JR: Disable radio when entering vehicle

RegisterNetEvent('playerEnteredVehicle')
AddEventHandler('playerEnteredVehicle', function(vehicle, seat, _, vehicleNetworkId)
    -- Disable vehicle radio
    SetVehicleRadioEnabled(vehicle, false)
end)

-- Also disable radio on vehicle enter (alternative event)
RegisterNetEvent('EnteringVehicle')
AddEventHandler('EnteringVehicle', function(vehicle, seat, _, vehicleNetworkId)
    -- Disable radio immediately when entering
    SetVehicleRadioEnabled(vehicle, false)
end)

-- Disable on foot for current vehicle (backup)
CreateThread(function()
    while true do
        Wait(1000)
        local ped = PlayerPedId()
        if IsPedInAnyVehicle(ped, false) then
            local vehicle = GetVehiclePedIsIn(ped, false)
            if vehicle ~= 0 then
                SetVehicleRadioEnabled(vehicle, false)
            end
        end
    end
end)