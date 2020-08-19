local filesystem = require('gears.filesystem')

-- Thanks to jo148 on github for making rofi dpi aware!
local with_dpi = require('beautiful').xresources.apply_dpi
local get_dpi = require('beautiful').xresources.get_dpi
local rofi_command = 'env /usr/bin/rofi -dpi ' .. get_dpi() .. ' -width ' .. with_dpi(400) .. ' -show drun -theme ' .. filesystem.get_configuration_dir() .. '/configuration/rofi.rasi -run-command "/bin/bash -c -i \'shopt -s expand_aliases; {cmd}\'"'

return {
  -- List of apps to start by default on some actions
  default = {
    terminal = 'konsole',
    rofi = rofi_command,
    lock = 'i3lock-fancy',
    quake = 'terminator',
    -- screenshot = '~/.config/awesome/configuration/utils/screenshot -m',
    -- region_screenshot = '~/.config/awesome/configuration/utils/screenshot -r',
    delayed_screenshot = 'sleep 10 ; ~/.config/awesome/configuration/utils/screenshot -r',
    region_screenshot = 'sharenix-section',
    screenshot = 'sharenix-window',
    browser = 'brave',
    editor = 'code', -- gui text editor, but can use xed
    social = 'flatpak run com.discordapp.Discord',
    game = rofi_command,
    files = 'dolphin',
    music = 'flatpak run com.spotify.Client' 
  },
  -- List of apps to start once on start-up
  run_on_start_up = {
    'compton --config ' .. filesystem.get_configuration_dir() .. '/configuration/compton.conf',
    'nm-applet --indicator', -- wifi
    'pa-applet', -- shows an audiocontrol applet in systray when installed.
    --'blueberry-tray', -- Bluetooth tray icon
    'ibus-daemon --xim', -- Ibus daemon for keyboard
    -- 'numlockx on', -- enable numlock
    'flatpak run com.discordapp.Discord',
    'flatpak run com.spotify.Client',
    'flameshot',                 
    'redshift',
    '/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager
    '/usr/lib/polkit-kde-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)',
    'xscreensaver -nosplash', -- Power manager
    '~/.local/bin/wallpaper', -- wallpaper-reddit script
    -- Add applications that need to be killed between reloads
    -- to avoid multipled instances, inside the awspawn script
    '~/.config/awesome/configuration/awspawn' -- Spawn "dirty" apps that can linger between sessions
  }
}
