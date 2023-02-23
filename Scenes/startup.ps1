# Startup Script for G218RU
# Robin Universe [T]
# 02 . 17 . 23

# This script will dynamically change startup behavior depending on who's fronting.

$FrontEndpoint = "http://whateveryourfrontserveris/front"

function pretty{param($msg,$col)$i=0;foreach($pt in $msg){Write-Host "$pt" -NoNewline -ForegroundColor $col[$i]; $i++}Write-Host}

# Hit my front server to check who's fronting in PluralKit, if it doesn't work, default to Robin
pretty " >>> ", "Making API Call to ", $FrontEndpoint, " to find out who is currently fronting" "Magenta", "Green", "White", "Green"
try {
    $front = (curl $FrontEndpoint).Content
    pretty " >>> ", "Current fronter is: ", $front "Magenta", "Green", "White"
} catch {
    $front = "Default"
    Write-Host "API Call failed - Assuming Default is fronting." -ForegroundColor Red
}

# Create a registry item that can be quickly referenced across the system
pretty " >>> ", "Creating registry entry signifying ", $front, " as current fronter"  "Magenta", "Green", "White", "Green"
$x = New-Item -Path HKCU:\Software\fronter -Value $front -Force

# Create a function capable of changing the wallpaper
Function Set-Wallpaper {
    param($path = "C:/Wallpapers/$front.jpg")

    $setwallpapersrc = @"
using System.Runtime.InteropServices;

public class Wallpaper
{
  public const int SetDesktopWallpaper = 20;
  public const int UpdateIniFile = 0x01;
  public const int SendWinIniChange = 0x02;
  [DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)]
  private static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
  public static void SetWallpaper(string path)
  {
    SystemParametersInfo(SetDesktopWallpaper, 0, path, UpdateIniFile | SendWinIniChange);
  }
}
"@
    Add-Type -TypeDefinition $setwallpapersrc

    [Wallpaper]::SetWallpaper($path)
}

# Set the users saved Wallpaper ( C:\Wallpapers\FRONTERS-NAME.jpg )
pretty " >>> ", "Setting wallpaper to ","C:\Wallpapers\$front.jpg" "Magenta", "Green", "White" 
Set-Wallpaper

# Go ahead and start the browser since we'll all be needing that no matter what
# pretty " >>> ", "Starting Chrome" "Magenta", "Green"
# Start-Process chrome "https://blog.hirob.in/"

# Initiate the user's specific startup script
pretty " >>> ", "Invoking ", $front, "'s startup script" "Magenta", "Green", "White", "Green"
& "C:/Scenes/$front.ps1"

