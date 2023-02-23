# PluralKit-Windows-Switcher
### A set of scripts that allow your windows system to start up differently depending on who's fronting in pluralkit

This includes:
 - Setting a custom wallpaper for each fronter
 - Changing your PowerShell profile dynamically to use one for each alter
 - Setting a Registry key on startup of who is fronting to access system-wide 
 
   ( this can be accessed by using `$front = (Get-ItemProperty -Path "HKCU:\Software\fronter").'(default)'` )
 - Firing off a specific unique startup script for each alter

This pipeline uses a few parts (lol):

## 1. The flask server
This will hit the pluralkit API for you to grab your current fronter - I set it up this way so that I wouldn't have to set up auth and dig through the response every time
I decided to script some random thing to work differently based on who's fronting. Simply set up the flask server with your API auth info and set it running on a server

I am currently using a cheapo $5/m nanode that I use for several other things, though if this is inconvenient, some homework would be to make the API call from your own
machine

## 2. The local filesystem setup
You're going to want to set your files in some specific places (or else change the hardcoding, whatever)
the locations are as follows:

Place the Scenes folder in C:\ ( this contains per user startup scripts, profiles, and anything else front specific, i.e. powerline themes )

Place the Wallpapers folder in C:\ ( this contains all your wallpapers, designated with [altername].jpg )

Place the Microsoft.PowerShell_profile.ps1 file in wherever your $PROFILE variable points to

Place startup.cmd in %appdata%\Microsoft\Windows\Start Menu\Programs\Startup\

## 3. The Scripting Setup
After everything is in place it should all be good to go, but you're going to want to do a few things to the scripts:

 1. Set the $FrontEndpoint variable in /Scenes/startup.ps1 to whatever your flask server is
 2. Set the default name to whatever your most common fronter is, ( Line 17 in startup.ps1 )
 
 (this also involves copying Default.ps1, Default_profile.ps1, Default.jpg and renaming them to match your name, and if you're using powerline, changing Default.json to match your desired name (Line 42 and filename))
 
 Repeat this step for each alter you want to be able to use, and then customize them to however you each see fit


