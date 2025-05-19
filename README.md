# FiveM Leave Logger (IMPORTANT: THE SCRIPT IS MINE, BUT IT IS NOT MY IDEA)

This lightweight script helps server owners track when players leave their FiveM server, making it easier to monitor unwanted disconnects, spot combat logging, and keep accurate moderation records.

---

### 📦 **What is LeaveLogger?**

LeaveLogger is a standalone logging utility for FiveM servers. When a player disconnects, the script logs:

- Player Name
- Steam/License Identifier
- Reason for leaving (if available)
- Timestamp

Logs are sent directly to your Discord via a configurable webhook using a server Convar.

---

### 🌟 **Features**

- Logs every player disconnect event (timeouts, quits, kicks)
- Customizable log format and Discord embed appearance
- Discord webhook support (optional, easy to set up)
- Configurable leave markers: spawn a marker at the disconnect position for nearby players (fully customizable via config)
- Lightweight and easy to install
- ESX Framework integration
- Easy to configure

---

### ⚡ **Requirements**

- ESX Legacy (es_extended)

### ⚙️ **Installation**

1. **Ensure** you have ESX Framework installed and running
2. **Download** the latest release [here](https://github.com/fdokhfijsdh/fdokhfijsdh_LeaveLogger/releases).
3. **Place** the folder in your server's `resources` directory.
4. **Add** to your `server.cfg` (make sure it starts after es_extended):
   ```
   ensure fdokhfijsdh_LeaveLogger
   ```
5. **Configure** your Discord webhook by adding this to your `server.cfg` (replace the URL):
   ```
   setr leaveLogger_webhook "YOUR_WEBHOOK_URL_HERE"
   ```
6. **Customize** further in `config.lua` (marker settings, colors, log format, etc.).

---

### 💡 **Usage**

Once started, LeaveLogger will automatically log all disconnect events to your specified Discord channel. If enabled, when a player leaves, a marker will appear at their last known position—visible to any player who enters the configured range.

All features can be tweaked in the config file.

---

### 🛠️ **Configuration**

- **Discord Logging:** Set your webhook URL with the `leaveLogger_webhook` Convar in `server.cfg`.
- **Marker & Appearance:** Adjust marker color, type, size, and display range in `config.lua`.
- **Log Format:** Customize the information sent to Discord.

---

### 📝 **Contributions & Support**

- Feedback and suggestions are welcome!  
- Please read the [License](https://github.com/fdokhfijsdh/fdokhfijsdh_LeaveLogger/blob/main/LICENSE) before contributing.
- Report bugs or request features via [GitHub Issues](https://github.com/fdokhfijsdh/fdokhfijsdh_LeaveLogger/issues).


## Credits
This script was developed by me but inspired by [ms_anticombatlog](https://www.youtube.com/watch?v=WyfSbakxf9U). Credit goes to them for the original idea. I made this script because they link der discord server in the video, but you can not get it there. I don't really get why they called it anticombatlog because it is not proventing anything, but anyways. Enjoy :)

## License
This project is licensed under the GNU General Public License v2.0 License - see the LICENSE file for details