
# 07_01 Antivirus
[system.Version]$OSVersion = (Get-WmiObject win32_operatingsystem).version 
# OS Windows Vista/Server 2008 or newer detected."
IF ($OSVersion -ge [system.version]'6.0.0.0') 
{
    $AntiVirusProduct = Get-WmiObject -Namespace root\SecurityCenter2 -Class AntiVirusProduct -ErrorAction Stop
} 
# Windows 2000, 2003, XP detected
Else 
{
    $AntiVirusProduct = Get-WmiObject -Namespace root\SecurityCenter -Class AntiVirusProduct  -ErrorAction Stop
}
$AntiVirusProduct | Export-Csv -Path $PSScriptRoot"\"$outputDir"\07_01-"$outputDir"-Antivirus.csv" 

# 07_02 Firewall Settings
Get-NetFirewallProfile | Export-Csv -Path $PSScriptRoot"\"$outputDir"\07_02-"$outputDir"-Firewall.csv"
Get-NetFirewallSetting | Export-Csv -Path $PSScriptRoot"\"$outputDir"\07_02-"$outputDir"-Firewall_Settings.csv"
