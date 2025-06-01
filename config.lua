Config = {
    Webhook = GetConvar("leaveLogger_webhook", "FAILED TO LOAD"),
    WebhookColor = 16776960, -- https://spycolor.com/ - choose a color and get the decimal value

    ShowMarker = true, -- Show the marker

    -- milliseconds * seconds * minutes
    DisplayTime = 1000 * 60 * 3, -- Time in milliseconds to display the marker
    Distance = 25.0, -- Distance to display the marker

    Marker = {
        Type = 32, -- https://docs.fivem.net/docs/game-references/markers/
        Scale = { x = 1.5, y = 1.5, z = 1.5 },
        Color = { r = 255, g = 255, b = 0, a = 100 }, -- https://spycolor.com/ - choose a color and get the RGB values
    },

    Text = {
        Text = "[%s] The Player %s has left the server.\n~w~Reason: %s",
        Color = { r = 255, g = 255, b = 255, a = 255 }, -- https://spycolor.com/ - choose a color and get the RGB values
    }
}