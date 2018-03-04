
# 05_01 OS Patches
Get-WmiObject -Class "win32_quickfixengineering" | Select-Object -Property "Description", "HotfixID", @{Name="InstalledOn"; Expression={([DateTime]($_.InstalledOn)).ToLocalTime()}} | Export-Csv -Path $PSScriptRoot"\"$outputDir"\05_01-"$outputDir"-OS_Updates.csv"

# 05_02 Installed Applications
Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | Export-Csv -Path $PSScriptRoot"\"$outputDir"\05_02-"$outputDir"-Installed_Applications.csv"

# 05_03 Security Patches within last 90 Days
Get-CimInstance -Class win32_quickfixengineering | Where-Object { $_.InstalledOn -gt (Get-Date).AddMonths(-3) } | Export-Csv -Path $PSScriptRoot"\"$outputDir"\05_03-"$outputDir"-Patches_Last_90d.csv"