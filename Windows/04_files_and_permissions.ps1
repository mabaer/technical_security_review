
# 04_01 File Permissions 

# 04_02 Running Processes 

# 04_03 Running Services 

# 04_04 Scheduled Tasks 

# 04_05 Autostart Services
Get-WmiObject Win32_service -filter "StartMode = 'auto' " | FT | Export-Csv -Path $PSScriptRoot"\"$outputDir"\04_05-"$outputDir"-Autostart.csv"