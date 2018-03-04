
# 01_01 RDP Configuration
Get-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Control\Terminal*Server\WinStations\RDP-TCP\ | Export-Csv -Path $PSScriptRoot"\"$outputDir"\01_01-"$outputDir"-RDP_Config.csv"

# 01_02 Network Shares
Get-SmbShare | Get-SmbShareAccess | Export-Csv -Path $PSScriptRoot"\"$outputDir"\01_02-"$outputDir"-Shares.csv"

# 01_03 Established Network Connections
Get-NetTCPConnection -State established | Export-Csv -Path $PSScriptRoot"\"$outputDir"\01_03-"$outputDir"-Established_Connections.csv"

# 01_04 Network Services (inspired by Shay Levy http://blogs.microsoft.co.il/scriptfanatic/2011/02/10/how-to-find-running-processes-and-their-port-number/)
$properties = 'Protocol', 'LocalAddress', 'LocalPort', 'RemoteAddress', 'RemotePort', 'State', 'ProcessName', 'PID'
$outputList =  @() 
netstat -ano | Select-String -Pattern '\s+(TCP|UDP)' | ForEach-Object {
    $item = $_.line.split(" ",[System.StringSplitOptions]::RemoveEmptyEntries)
    if($item[1] -notmatch '^\[::')
    {           
        if (($la = $item[1] -as [ipaddress]).AddressFamily -eq 'InterNetworkV6')
        {
            $localAddress = $la.IPAddressToString
            $localPort = $item[1].split('\]:')[-1]
        }
        else
        {
            $localAddress = $item[1].split(':')[0]
            $localPort = $item[1].split(':')[-1]
        } 
        if (($ra = $item[2] -as [ipaddress]).AddressFamily -eq 'InterNetworkV6')
        {
            $remoteAddress = $ra.IPAddressToString
            $remotePort = $item[2].split('\]:')[-1]
        }
        else
        {
            $remoteAddress = $item[2].split(':')[0]
            $remotePort = $item[2].split(':')[-1]
        } 
        $newEntry = New-Object PSObject -Property @{
                PID = $item[-1]
                ProcessName = (Get-Process -Id $item[-1] -ErrorAction SilentlyContinue).Name
                Protocol = $item[0]
                LocalAddress = $localAddress
                LocalPort = $localPort
                RemoteAddress =$remoteAddress
                RemotePort = $remotePort
                State = if($item[0] -eq 'tcp') {$item[3]} else {$null}
            } | Select-Object -Property $properties
        $outputList += $newEntry
        }
    }
$outputList | Export-Csv -Path $PSScriptRoot"\"$outputDir"\01_04-"$outputDir"-Network_Services.csv"

# 01_05 TCP and UDP Settings
Get-NetTCPSetting | Export-Csv -Path $PSScriptRoot"\"$outputDir"\01_05-"$outputDir"-TCP_Settings.csv"
Get-NetUDPSetting | Export-Csv -Path $PSScriptRoot"\"$outputDir"\01_05-"$outputDir"-UDP_Settings.csv"