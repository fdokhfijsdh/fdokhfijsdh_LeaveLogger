# fdokhfijsdh_LeaveLogger
This project is inspired by [ms_anticombatlog](https://www.youtube.com/watch?v=WyfSbakxf9U). I decided to create LeaveLogger because the original script isn’t available for download as shown in their video. While the idea comes from ms_anticombatlog, this script is an entirely original, built from the ground up to be simple, customizable, and open-source.

## 📦 What is LeaveLogger?

LeaveLogger helps server staff monitor when players leave your FiveM server. Each time a player disconnects, the script logs:

- **Player Name**
- **RockstarGames license**
- **Reason for leaving** (if available)
- **Timestamp**

All logs are sent directly to your Discord via a configurable webhook using a [Convar](https://docs.fivem.net/docs/scripting-reference/convars/).

## 💡 What Does LeaveLogger Do?

- **Monitors disconnects:**  
  Automatically tracks every player who leaves your FiveM server, capturing key details like timestamp, disconnect reason, and player identifiers (Steam, license, Discord, etc).
- **Real-time Discord notifications:**  
  Instantly sends detailed leave logs to your Discord using webhooks, keeping admins informed.
- **Supports server moderation:**  
  Helps staff detect combat logging and suspicious disconnects—perfect for roleplay and competitive servers.

## ⚙️ Installation

1. **Download** the latest release from the [Releases page](https://github.com/fdokhfijsdh/fdokhfijsdh_LeaveLogger/releases)
2. **Extract** the archive and place the folder in your server's `resources` directory
3. **Add** the resource to your `server.cfg`:
   ```
   ensure fdokhfijsdh_LeaveLogger
   ```
4. **Configure** your Discord webhook (optional):
   ```
   setr leaveLogger_webhook "YOUR_WEBHOOK_URL_HERE"
   ```
5. **Customize** settings in `config.lua` (optional)

## 🛠️ Configuration

Edit `config.lua` to customize:

- Marker creation and appearance (type, size, color)
- Marker display duration and range
- Discord webhook
- Color of Discord webhook

---

If you want to use ESX to get the players identifier e. g. Identifier `licence:identifier` to `char(1, 2, etc.):identifier` replace the following.

server.lua - Line 25 till end:
```lua
AddEventHandler('playerDropped', function(reason, resourceName, clientDropReason)
    local src = source -- change global source to local variable
    local xPlayer = ESX.GetPlayerFromId(src)
    local playerCoords = xPlayer.getCoords(true)

    if Config.ShowMarker then
        TriggerClientEvent('fdokhfijsdh_LeaveLogger:generateMarker', -1, playerCoords, xPlayer.playerId, GetPlayerName(xPlayer.source), reason)
    end

    sendDiscordWebhookMessage({
        embeds = {{
            title = "LeaveLogger",
            color = 16776960,

            fields = {
                {
                    name = "Identifier",
                    value = xPlayer.identifier,
                    inline = true
                },
                {
                    name = "Discord",
                    value = getDiscordID(xPlayer.source),
                    inline = true
                },

                {
                    name = "",
                    value = "",
                    inline = false
                },

                {
                    name = "Name",
                    value = GetPlayerName(xPlayer.source),
                    inline = true
                },
                {
                    name = "Player ID",
                    value = xPlayer.playerId,
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
```

fxmanifest.lua
```lua
shared_scripts {
    '@es_extended/imports.lua', -- Uncomment if using ESX
    'config.lua',
}
```

## 🤝 Support & Contributing

We welcome feedback, bug reports, and feature suggestions!  
- [Report Issues](https://github.com/fdokhfijsdh/fdokhfijsdh_LeaveLogger/issues)
- [Submit Pull Requests](https://github.com/fdokhfijsdh/fdokhfijsdh_LeaveLogger/pulls)

## 📄 License

This project is licensed under the [GNU General Public License v2.0](https://github.com/fdokhfijsdh/fdokhfijsdh_LeaveLogger?tab=GPL-2.0-1-ov-file).

## 🌟 Screenshots
![Project Logo](https://forum-cfx-re.akamaized.net/original/5X/d/4/7/3/d473ee7c5ba0ae3bed0abc5d6572143254561f72.jpeg)
![Discord Webhook](https://forum-cfx-re.akamaized.net/original/5X/1/7/d/4/17d47f0dacc1364d60c1733e809e4e034df47b6d.png)

Happy logging and have fun on your server! 🚀