
# 08_01 Screensaver Settings
Get-Wmiobject win32_desktop | Export-Csv -Path $PSScriptRoot"\"$outputDir"\08_01-"$outputDir"-ScreenSaver.csv"

# 08_02 System Resume
Get-ADDefaultDomainPasswordPolicy | Format-List lockout* | Export-Csv -Path $PSScriptRoot"\"$outputDir"\08_02-"$outputDir"-System_Lockout.csv"

# 08_03 PATH Elements
$Env:Path | Export-Csv -Path $PSScriptRoot"\"$outputDir"\08_03-"$outputDir"-PATH.csv"

# Wait for user input and close the script>
Read-Host -Prompt "Execution completed succesfully. Press Enter to exit"