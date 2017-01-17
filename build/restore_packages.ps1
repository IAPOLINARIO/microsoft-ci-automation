<# 
.SYNOPSIS 
    Restores dependencies of a .NET project
.DESCRIPTION 
    This script restores the dependencies contained in the cloned projects in the initial steps. 
    Through the project.json file and the dotnet restore command, the .NET Framework is responsible for downloading 
    all the packages needed for the project to be build.
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