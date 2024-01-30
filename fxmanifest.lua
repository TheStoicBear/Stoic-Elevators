fx_version "adamant"
games { "gta5" }
dependency "chat"
lua54 "yes"
version "1.0.0"
author "TheStoicBear"
description "Stoic-Elevators"

client_script "source/client.lua"

shared_scripts {
    "@ox_lib/init.lua",
    "config.lua"
}
