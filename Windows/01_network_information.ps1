
# 01_01 RDP Configuration
Get-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Control\Terminal*Server\WinStations\RDP-TCP\ | Export-Csv -Path $PSScriptRoot"\"$outputDir"\01_01-"$outputDir"-RDP_Config.csv"

# 01_02 Network Shares
Get-SmbShare | Get-SmbShareAccess | Export-Csv -Path $PSScriptRoot"\"$outputDir"\01_02-"$outputDir"-Shares.csv"

# 01_03 Established Network Connections
Get-NetTCPConnection -State established | Export-Csv -Path $PSScriptRoot"\"$outputDir"\01_03-"$outputDir"-Established_Connections.csv"

# 01_04 Network Services

# 01_05 TCP and UDP Settings
Get-NetTCPSetting | Export-Csv -Path $PSScriptRoot"\"$outputDir"\01_05-"$outputDir"-TCP_Settings.csv"
Get-NetUDPSetting | Export-Csv -Path $PSScriptRoot"\"$outputDir"\01_05-"$outputDir"-UDP_Settings.csv"