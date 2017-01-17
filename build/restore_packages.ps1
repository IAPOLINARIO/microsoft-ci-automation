<# 
.SYNOPSIS 
    Script that builds and publishes cloned .NET projects.
.DESCRIPTION 
    This script builds and publishes the cloned projects in the initial steps. 
    The publication is done in the output directory configured in the variable file.
.NOTES 
    File Name  : restore_packages.ps1
    Author     : Ismael Apolinário - ismaelapolinario@hotmail.com 
    Requires   : PowerShell V3  
.LINK 
    https://github.com/IAPOLINARIO/microsoft-ci-automation
#> 

Write-Host "Restoring FourC.Worker.Core Packages..."
dotnet restore ($core_source_path + "project.json")

Write-Host "Restoring FourC.Worker.Backend Packages..."
dotnet restore ($backend_source_path + "project.json")

Write-Host "Restoring FourC.Worker.Api Packages..."
dotnet restore ($api_source_path + "project.json")