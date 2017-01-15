Write-Host "Setup SQLPS to query on SQL Server from Powershell..."

#Set Environment Variable for SQLPS Module
$env:PSModulePath = $env:PSModulePath + ";C:\Program Files (x86)\Microsoft SQL Server\120\Tools\PowerShell\Modules"

# Import the SQL Server Module.    
Import-Module Sqlps -DisableNameChecking;

# To check whether the module is installed.
Get-Module -ListAvailable -Name Sqlps;
