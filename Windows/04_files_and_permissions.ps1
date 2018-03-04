
# 04_01 File Permissions 
$drive = [system.environment]::getenvironmentvariable("SystemDrive")
$rootDir = -join($drive, "\")
Get-ChildItem $rootDir -recurse | get-acl | select * | FT | Export-Csv -Path $PSScriptRoot"\"$outputDir"\04_01-"$outputDir"-File_Permissions.csv" 

# 04_02 Running Processes
Get-Process | Export-Csv -Path $PSScriptRoot"\"$outputDir"\04_02-"$outputDir"-Running_Processes.csv"
Get-CimInstance win32_process | Select * | Export-Csv -Path $PSScriptRoot"\"$outputDir"\04_02-"$outputDir"-Running_Processes_Detailed.csv" 

# 04_03 Running Services
Get-Service | Export-Csv -Path $PSScriptRoot"\"$outputDir"\04_03-"$outputDir"-Running_Services.csv"
Get-WMIObject Win32_Service | Select * | Export-Csv -Path $PSScriptRoot"\"$outputDir"\04_03-"$outputDir"-Running_Services_Detailed.csv"

# 04_04 Scheduled Tasks
Get-ScheduledTask | Export-Csv -Path $PSScriptRoot"\"$outputDir"\04_04-"$outputDir"-Scheduled_Tasks.csv"
Get-ScheduledTask | Get-ScheduledTaskInfo | Select * | Export-Csv -Path $PSScriptRoot"\"$outputDir"\04_04-"$outputDir"-Scheduled_Tasks_Detailed.csv"

# 04_05 Autostart Services
Get-WmiObject Win32_service -filter "StartMode = 'auto' " | FT | Export-Csv -Path $PSScriptRoot"\"$outputDir"\04_05-"$outputDir"-Autostart.csv"