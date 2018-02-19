
# 02_01 Sysinfo
Get-WmiObject Win32_OperatingSystem | Export-Csv -Path $PSScriptRoot"\"$outputDir"\02_01-"$outputDir"-OS_Info.csv"
Get-WmiObject -Class Win32_ComputerSystem | Export-Csv -Path $PSScriptRoot"\"$outputDir"\02_01-"$outputDir"-System_Info.csv"

# 02_02 Domain Information
$env:UserDomain | Export-Csv -Path $PSScriptRoot"\"$outputDir"\02_02-"$outputDir"-Domain_Name.csv"
$env:userdnsdomain | Export-Csv -Path $PSScriptRoot"\"$outputDir"\02_02-"$outputDir"-Domain_DNS_Name.csv"

# 02_03 Admin Account
Get-LocalGroupMember -Group "Administrators" | Export-Csv -Path $PSScriptRoot"\"$outputDir"\02_01-"$outputDir"-Administrators.csv"

# 02_04 Guest Account
Get-WmiObject -Class Win32_UserAccount -Filter "LocalAccount='$true'" | Select-Object Name,Disabled | FT –AutoSize | Export-Csv -Path $PSScriptRoot"\"$outputDir"\02_04-"$outputDir"-Disabled_Users.csv"