<# 
.SYNOPSIS 
    Configures IIS application pool
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

Write-Host "Importing Web Administration Module..."
Import-Module WebAdministration

Write-Host "Checking if Pool already exists..."
$api_pool = Get-ChildItem -Path $base_iis_app_pool_path | Where { $_.Name -match $api_site_name } | Select Name -First 1

if(!($api_pool)){
    New-Item -Path $iis_api_pool_path
}

#Change the runtime version
Set-ItemProperty -Path $iis_api_pool_path -Name managedRuntimeVersion -Value ''