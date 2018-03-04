
# 08_01 Screensaver Settings
Get-Wmiobject win32_desktop | Export-Csv -Path $PSScriptRoot"\"$outputDir"\08_01-"$outputDir"-ScreenSaver.csv"

# 08_02 System Resume
Get-ADDefaultDomainPasswordPolicy | Format-List lockout* | Export-Csv -Path $PSScriptRoot"\"$outputDir"\08_02-"$outputDir"-System_Lockout.csv"

# 08_03 PATH Elements
$Env:Path > $PSScriptRoot"\"$outputDir"\08_03-"$outputDir"-PATH.csv"

# 08_04 Secure Boot
Get-SecureBootPolicy | Export-Csv -Path $PSScriptRoot"\"$outputDir"\08_04-"$outputDir"-Secure_Boot_Policy.csv"

# 08_05 Connected Devices
Get-PnpDevice -PresentOnly | Export-Csv -Path $PSScriptRoot"\"$outputDir"\08_05-"$outputDir"-Connected_Devices.csv"

# 08_06 Expiring Certificates
Get-ChildItem Cert:\LocalMachine\My\ -ExpiringInDays 60 | Select-Object Thumbprint, Subject, NotAfter | Export-Csv -Path $PSScriptRoot"\"$outputDir"\08_06-"$outputDir"-Expiring_Certificates.csv"

# Wait for user input and close the script>
Read-Host -Prompt "Execution completed succesfully. Press Enter to exit"
