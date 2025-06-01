--[[ FX Information ]]--
fx_version 'cerulean'
games { 'gta5' }

--[[ Resource Information ]]--
name "fdokhfijsdh_LeaveLogger"
author "fdokhfijsdh"
description "enjoy logging the leave of your players :)"
version '1.0'

shared_scripts {
    -- '@es_extended/imports.lua', -- Uncomment if using ESX
    'config.lua',
}
client_script 'client.lua'
server_script 'server.lua'