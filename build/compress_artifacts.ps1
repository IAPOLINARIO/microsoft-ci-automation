<# 
.SYNOPSIS 
    Script to compress directories and files
.DESCRIPTION 
    This script uses 7zip to perform compression of files and folders. After compressed the files are 
    made available in the preconfigured deploy path
.NOTES 
    File Name  : compress_artifacts.ps1
    Author     : Ismael Apolinário - ismaelapolinario@hotmail.com 
    Requires   : PowerShell V3  
.LINK 
    https://github.com/IAPOLINARIO/microsoft-ci-automation
#> 

Write-Host "Configuring 7z..."

#Checks if the 7zip executable file exists. If it does not exist, an error is triggered.
if (-not (test-path "$env:ProgramFiles\7-Zip\7z.exe")) {
    throw "$env:ProgramFiles\7-Zip\7z.exe needed"
} 

Write-Host "Creating alias..."

#Create an alias to make easy to call the 7zip executable
set-alias sz "$env:ProgramFiles\7-Zip\7z.exe"  

#Checks whether the deploy path already exists. If exists, clean the path so there are no conflicts
if(Test-Path $deploy_path){
    Write-Host "Cleaning the deploy folder..."
    Remove-Item $deploy_path -Recurse -Force
} 

Write-Host "Compressing api..."
sz a -mx=9 ($deploy_path + "api.zip") ($publish_path + "\api\")

Write-Host "Compressing backend..."
sz a -mx=9 ($deploy_path + "backend.zip") ($publish_path + "\backend\")