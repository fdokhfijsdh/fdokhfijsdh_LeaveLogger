local threadId

local function draw3DText(x, y, z, msg, r, g, b, a)
    SetDrawOrigin(x, y, z, 0)
    BeginTextCommandDisplayText('STRING')
    AddTextComponentSubstringPlayerName(msg)
    SetTextFont(4)
    SetTextScale(0.35, 0.35)
    SetTextColour(r, g, b, a)
    SetTextCentre(true)
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()
end

RegisterNetEvent('fdokhfijsdh_LeaveLogger:generateMarker')
AddEventHandler('fdokhfijsdh_LeaveLogger:generateMarker', function(coords, leaverId, leaverName, reason)
    Citizen.CreateThread(function()
        threadId = GetIdOfThisThread()

        while true do
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            local distance = #(playerCoords - coords)

            if distance < Config.Distance then
                -- Draw marker
                DrawMarker(Config.Marker.Type, coords.x, coords.y, coords.z + .3, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Marker.Scale.x, Config.Marker.Scale.y, Config.Marker.Scale.z, Config.Marker.Color.r, Config.Marker.Color.g, Config.Marker.Color.b, Config.Marker.Color.a, false, true, 2, false, nil, nil, false)
                draw3DText(coords.x, coords.y, coords.z - .5, Config.Text.Text:format(leaverId, leaverName, reason), Config.Text.Color.r, Config.Text.Color.g, Config.Text.Color.b, Config.Text.Color.a)
            end

            Wait(0)
        end
    end)

    -- Stop the marker after 6.5 seconds
    Citizen.SetTimeout(Config.DisplayTime, function()
        TerminateThread(threadId)
    end)
end)