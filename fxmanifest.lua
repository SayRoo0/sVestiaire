


shared_scripts {
    "shared/*.lua",
}

fx_version 'adamant'
games { 'gta5' };
client_scripts {
    "src/client/RMenu.lua",
    "src/client/menu/RageUI.lua",
    "src/client/menu/Menu.lua",
    "src/client/menu/MenuController.lua",
    "src/client/components/*.lua",
    "src/client/menu/elements/*.lua",
    "src/client/menu/items/*.lua",
    "src/client/menu/panels/*.lua",
    "src/client/menu/windows/*.lua",

    "client/**/*lua",
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    "server/**/*lua",
}

