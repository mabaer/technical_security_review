
# 03_01 Local Users
Get-WmiObject -Class Win32_UserAccount -Filter  "LocalAccount='True'" | Select PSComputername, Name, Domain, Caption, Status, Disabled, AccountType, Lockout, PasswordRequired, PasswordChangeable, SID | FT –AutoSize | Export-Csv -Path $PSScriptRoot"\"$outputDir"\03_01-"$outputDir"-Local_User.csv"

# 03_02 Local Groups

# 03_03 Assigned Administrative Privileges
