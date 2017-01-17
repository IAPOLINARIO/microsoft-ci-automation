<# 
.SYNOPSIS 
   Performs the installation of SQLPS
.DESCRIPTION 
    The sqlps utility starts a Windows PowerShell session with the SQL Server PowerShell provider and cmdlets 
    loaded and registered. You can enter PowerShell commands or scripts that use the SQL Server PowerShell 
    components to work with instances of SQL Server and their objects.
.NOTES 
    File Name  : setup_sqlps.ps1
    Author     : Ismael Apolinário - ismaelapolinario@hotmail.com 
    Requires   : PowerShell V3  
.LINK 
   https://msdn.microsoft.com/en-us/library/ms711472(v=vs.85).aspx
#>

Write-Host "Setup SQLPS to query on SQL Server from Powershell..."

#Set Environment Variable for SQLPS Module
$env:PSModulePath = $env:PSModulePath + ";C:\Program Files (x86)\Microsoft SQL Server\120\Tools\PowerShell\Modules"

# Import the SQL Server Module.    
Import-Module Sqlps -DisableNameChecking;

# To check whether the module is installed.
Get-Module -ListAvailable -Name Sqlps;
