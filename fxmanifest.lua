fx_version 'cerulean'
game 'gta5'

description 'Collectables Script'
version '1.0.0'
author 'RijayJH'

lua54 'yes'

ui_page 'web/dist/index.html'

shared_scripts { 
	'config.lua',
    '@ox_lib/init.lua'
}

client_scripts{
    'client/**/*'
} 

files {
	'web/dist/index.html',
	'web/dist/**/*',
}

server_scripts{
    '@oxmysql/lib/MySQL.lua',
    'server/**/*'
} 