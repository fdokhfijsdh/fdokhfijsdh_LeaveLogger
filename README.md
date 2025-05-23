# FiveM Leave Logger (IMPORTANT: THE SCRIPT IS MINE, BUT IT IS NOT MY IDEA)

This lightweight script helps server owners track when players leave their FiveM server, making it easier to monitor unwanted disconnects, spot combat logging, and keep accurate moderation records.

## 📦 **What is LeaveLogger?**

LeaveLogger is a standalone logging utility for FiveM servers. When a player disconnects, the script logs:

- Player Name
- RockstarGames License
- Reason for leaving (if available)
- Timestamp

Logs are sent directly to your Discord via a configurable webhook using a server Convar.

## 🌟 **Features**

- Standalone resource - no framework dependencies
- Logs every player disconnect event (timeouts, quits, kicks)
- Customizable log format and Discord embed appearance
- Discord webhook support (optional, easy to set up)
- Configurable leave markers: spawn a marker at the disconnect position for nearby players
- Lightweight and optimized performance
- Easy to configure

## ⚡ **Requirements**

- None

## ⚙️ **Installation**

1. **Download** the latest release from the [releases page](https://github.com/fdokhfijsdh/fdokhfijsdh_LeaveLogger/releases)
2. **Extract** and place the folder in your server's `resources` directory
3. **Add** to your `server.cfg`:
   ```
   ensure fdokhfijsdh_LeaveLogger
   ```
4. **Configure** your Discord webhook (optional):
   ```
   setr leaveLogger_webhook "YOUR_WEBHOOK_URL_HERE"
   ```
5. **Customize** settings in `config.lua` (optional)

## 💡 **Usage**

The script runs automatically after installation. It will:
- Log all disconnect events to your Discord channel (if webhook is configured)
- Create visible markers at disconnect locations (if enabled in config)
- Track and store disconnect data for monitoring purposes

## 🛠️ **Configuration**

Edit `config.lua` to customize:
- Marker creation
- Marker appearance (type, size, color)
- Display duration and range
- Discord embed format and colors
- Logging options and filters

## 📝 **Support & Contributing**

- [Report Issues](https://github.com/fdokhfijsdh/fdokhfijsdh_LeaveLogger/issues)
- [Submit Pull Requests](https://github.com/fdokhfijsdh/fdokhfijsdh_LeaveLogger/pulls)
- Join our [Discord](https://discord.gg/your-invite-here) for support

## License

This project is licensed under the [GNU General Public License v2.0](LICENSE)

## Credits

This script was developed by me but was inspired by [ms_anticombatlog](https://www.youtube.com/watch?v=WyfSbakxf9U). Credit goes to them for the original idea. I created this script because they linked their Discord server in the video, but the script was not available there. I am not sure why they called it "anticombatlog," as it does not prevent anything, but anyways. Enjoy :)