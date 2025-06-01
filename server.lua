local function sendDiscordWebhookMessage(message)
    PerformHttpRequest(Config.Webhook, function(err, text, headers)
        if err ~= 200 and err ~= 204 then
            -- Detaillierte Ausgabe des Fehlers
            print("DeathLogger Error - Discord Webhook Error: " .. err)
            if text then
                print("Antworttext: " .. text)
            end
            if headers then
                print("Header: " .. json.encode(headers))
            end
            print("Webhook-Nachricht: " .. json.encode(message))
        end
    end, 'POST', json.encode(message), { ['Content-Type'] = 'application/json' })
end

local function getDiscordID(player)
    for _, id in ipairs(GetPlayerIdentifiers(player)) do
        if string.match(id, "^discord:") then
            return ('<@' .. string.gsub(id, "discord:", "") .. '>') or "Unknown"
        end
    end
end

AddEventHandler('playerDropped', function(reason, resourceName, clientDropReason)
    local src = source -- change global source to local variable
    local playerCoords = GetEntityCoords(GetPlayerPed(src))

    if Config.ShowMarker then
        TriggerClientEvent('fdokhfijsdh_LeaveLogger:generateMarker', -1, playerCoords, src, GetPlayerName(src), reason)
    end

    sendDiscordWebhookMessage({
        embeds = {{
            title = "LeaveLogger",
            color = Config.WebhookColor,

            fields = {
                {
                    name = "Identifier",
                    value = GetPlayerIdentifierByType(src, "license"),
                    inline = true
                },
                {
                    name = "Discord",
                    value = getDiscordID(src),
                    inline = true
                },

                {
                    name = "",
                    value = "",
                    inline = false
                },

                {
                    name = "Name",
                    value = GetPlayerName(src),
                    inline = true
                },
                {
                    name = "Player ID",
                    value = src,
                    inline = true
                },

                {
                    name = "",
                    value = "",
                    inline = false
                },

                {
                    name = "Coordinates",
                    value = string.format("X: %.2f Y: %.2f Z: %.2f", playerCoords.x, playerCoords.y, playerCoords.z),
                    inline = false
                },
                {
                    name = "Reason",
                    value = reason,
                    inline = false
                }
            },

            footer = {
                text = "LeaveLogger"
            },

            timestamp = os.date('!%Y-%m-%dT%H:%M:%SZ'):gsub('%z', '')
        }}
    })
end)