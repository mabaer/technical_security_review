
# 03_01 Local Users
Get-WmiObject -Class Win32_UserAccount -Filter  "LocalAccount='True'" | Select * | FT –AutoSize | Export-Csv -Path $PSScriptRoot"\"$outputDir"\03_01-"$outputDir"-Local_User.csv"

# 03_02 Local Groups
Get-WMIObject win32_group -filter "LocalAccount='True'" | Select * | Export-Csv -Path $PSScriptRoot"\"$outputDir"\03_02-"$outputDir"-Local_Groups.csv"
$Groups = Get-WMIObject win32_group -filter "LocalAccount='True'" 
$MemberArray = New-Object -typeName System.Collections.Arraylist
Foreach($G In $Groups)
{
    $Members = Get-LocalGroupMember -Group $G.Name
    $SaveString = "$($Members)"
    $MemberArray += New-Object PsObject -property @{
        'Group' = $G.Name
        'Members' = $SaveString
    }
}
$MemberArray | Export-Csv -Path $PSScriptRoot"\"$outputDir"\03_02-"$outputDir"-Local_Groups_Members.csv" -NoTypeInformation

# 03_03 Assigned Administrative Privileges
secedit /export /areas USER_RIGHTS /cfg $PSScriptRoot"\"$outputDir"\03_03-"$outputDir"-Assigned_Privileges.csv"
