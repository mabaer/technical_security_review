
# 05_01 OS Patches
Get-WmiObject -Class "win32_quickfixengineering" | Select-Object -Property "Description", "HotfixID", @{Name="InstalledOn"; Expression={([DateTime]($_.InstalledOn)).ToLocalTime()}} | Export-Csv -Path $PSScriptRoot"\"$outputDir"\05_01-"$outputDir"-OS_Updates.csv"

# 05_02 Installed Applications
Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |  Select-Object DisplayName, DisplayVersion, Publisher, InstallDate |  FT –AutoSize | Export-Csv -Path $PSScriptRoot"\"$outputDir"\05_02-"$outputDir"-Installed_Applications.csv"