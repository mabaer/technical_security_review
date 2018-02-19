# Ignore Errors
$ErrorActionPreference = 'SilentlyContinue'

# Variables 
$name = $env:computername
$date = Get-Date -UFormat "%Y_%m_%d"
$outputDir = "$date-$name"
Write-Host $outputDir

# Check if folder already exist and exit if it does
$CheckDir = Test-Path $PSScriptRoot"\"$outputDir
if ($CheckDir) 
{
Write-Host "An output directory already exist. Remove this directory before running the script again."
exit
}
# Create new folder for output files
Write-Host "Create new directory for output"
new-item -Name $outputDir -ItemType directory

# 00_01 Get all powershell execution policies for the current session 
Get-ExecutionPolicy -List | Export-Csv -Path $PSScriptRoot"\"$outputDir"\00_01-"$outputDir"-Execution_Policy.csv"

# 00_02 Whoami
whoami | Export-Csv -Path $PSScriptRoot"\"$outputDir"\00_02-"$outputDir"-whoami.csv"
