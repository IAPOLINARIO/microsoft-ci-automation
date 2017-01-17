<# 
.SYNOPSIS 
    Make adjustments in the application settings to backend process.
.DESCRIPTION 
    This script sets up a new application pool for .NET Core applications. 
    If the application pool already exists, only its runtime changes.
.NOTES 
    File Name  : setup_iis_pool.ps1
    Author     : Ismael Apolinário - ismaelapolinario@hotmail.com 
    Requires   : PowerShell V3  
.LINK 
    https://github.com/IAPOLINARIO/microsoft-ci-automation
#> 


#Searches for installed SQL Server instances.
Write-Host "Search for SQL Instance..."
$sql_instance = (get-itemproperty 'HKLM:\SOFTWARE\Microsoft\Microsoft SQL Server').InstalledInstances | where{$_ -match "SQLEXPRESS"} | Select -First 1

$settingsPath = $backend_source_path + "appsettings.json"
$textReplace = "Data Source=."

if($sql_instance) {
    $newText = "Data Source=.\" + $sql_instance
    (Get-Content  $settingsPath).replace($textReplace, $newText) | Set-Content $settingsPath
}