local isAThreadRunning, threadId
local markers = {}

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

local function handleThread()
    Citizen.CreateThread(function()
        threadId = GetIdOfThisThread()

        while true do
            local playerCoords = GetEntityCoords(PlayerPedId())
            for i = #markers, 1, -1 do
                local markerUtils = markers[i]
                local distance = #(playerCoords - markerUtils.coords)

                if distance <= Config.Distance then
                    -- Draw marker
                    DrawMarker(Config.Marker.Type, markerUtils.coords.x, markerUtils.coords.y, markerUtils.coords.z + .3, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Marker.Scale.x, Config.Marker.Scale.y, Config.Marker.Scale.z, Config.Marker.Color.r, Config.Marker.Color.g, Config.Marker.Color.b, Config.Marker.Color.a, false, true, 2, false, nil, nil, false)
                    draw3DText(markerUtils.coords.x, markerUtils.coords.y, markerUtils.coords.z - .5, Config.Text.Text:format(markerUtils.leaverId, markerUtils.leaverName, markerUtils.reason), Config.Text.Color.r, Config.Text.Color.g, Config.Text.Color.b, Config.Text.Color.a)
                end

                -- Remove marker if it's older than 6.5 seconds
                if GetGameTimer() - markerUtils.timestamp > Config.DisplayTime then
                    table.remove(markers, i)
                end
            end

            -- If there are no markers left, stop the thread
            if #markers == 0 then
                isAThreadRunning = false
                TerminateThread(threadId)
                break
            end

            Wait(0)
        end
    end)
end

RegisterNetEvent('fdokhfijsdh_LeaveLogger:generateMarker')
AddEventHandler('fdokhfijsdh_LeaveLogger:generateMarker', function(coords, leaverId, leaverName, reason)
    table.insert(markers, {
        coords = coords,
        leaverId = leaverId,
        leaverName = leaverName,
        reason = reason,
        timestamp = GetGameTimer()
    })

    if not isAThreadRunning then
        isAThreadRunning = true
        handleThread()
    end
end)