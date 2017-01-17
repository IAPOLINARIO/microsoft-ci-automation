<# 
.SYNOPSIS 
   Reload environment variables
.DESCRIPTION 
    After installing some tools and services you need to reload env variables. 
    This script performs this reload and ensures that the $PATH variable is updated.
.NOTES 
    File Name  : refresh_environment.ps1
    Author     : Ismael Apolinário - ismaelapolinario@hotmail.com 
    Requires   : PowerShell V3  
.LINK 
    https://github.com/IAPOLINARIO/microsoft-ci-automation
#>
 
Write-Host "Refreshing environment...."
refreshenv
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 