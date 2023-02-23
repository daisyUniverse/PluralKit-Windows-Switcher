# Default PowerShell Profile
# Please note that this is an example profile pulled from my system
# It will likely not work for you unless you have set up oh-my-posh and chocolatey
# The point of this file is to show that you can have different PowerShell profiles for each alter
# You can then branch all PS behavior to change from here
# Robin Universe [X]
# 02 . 23 . 23

Import-Module "$env:SystemRoot\System32\WindowsPowerShell\v1.0\Modules\Microsoft.PowerShell.Management\Microsoft.PowerShell.Management.psd1"

Clear-Host
oh-my-posh init pwsh --config "C:\Scenes\Default.json" | Invoke-Expression

$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
