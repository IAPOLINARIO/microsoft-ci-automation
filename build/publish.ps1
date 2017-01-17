<# 
.SYNOPSIS 
    Script that builds and publishes cloned .NET projects.
.DESCRIPTION 
    This script builds and publishes the cloned projects in the initial steps. 
    The publication is done in the output directory configured in the variable file.
.NOTES 
    File Name  : publish.ps1
    Author     : Ismael Apolinário - ismaelapolinario@hotmail.com 
    Requires   : PowerShell V3  
.LINK 
    https://github.com/IAPOLINARIO/microsoft-ci-automation
#> 

#If the publishing path already exists, it is cleaned to avoid conflicts.
if(Test-Path $publish_path){
    Write-Host "Cleaning the publish path..."
    Remove-Item $publish_path -Recurse -Force
}

Write-Host "Creating publishing path..."
mkdir $publish_path

Write-Host "Building and Publishing Worker.Core..."
dotnet publish $core_source_path --configuration Release --output ($publish_path + "\core\")

Write-Host "Building and Publishing Worker.API..."
dotnet publish $api_source_path --configuration Release --output ($publish_path + "\api\")

Write-Host "Building and Publishing Worker.Backend..."
dotnet publish $backend_source_path --configuration Release --output ($publish_path + "\backend\")

