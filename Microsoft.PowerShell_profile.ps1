# Dynamic Profile Switching System
# Reads current fronter from registry entry created at boot by C:/Scenes/startup.ps1
# Place this file wherever your $PROFILE environment variable points to
# Robin Universe [R]
# 02 . 22 . 23

$front = (Get-ItemProperty -Path "HKCU:\Software\fronter").'(default)'
$profile = ( "C:\Scenes\" + $front + "_profile.ps1" )
. $profile
