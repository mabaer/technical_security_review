
# 06_01 Account Policies
Import-Module ActiveDirectory
Get-ADDefaultDomainPasswordPolicy | Export-Csv -Path $PSScriptRoot"\"$outputDir"\06_01-"$outputDir"-AD_Default_Password_Policy.csv" 

# 06_02 Audit Policies
auditpol.exe /get /category:* > $PSScriptRoot"\"$outputDir"\06_02-"$outputDir"-Audit_Policies.csv"