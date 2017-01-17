<# 
.SYNOPSIS 
    Unzip files and folders
.DESCRIPTION 
    This script unpacks .zip files using 7zip. The files are decompressed in the 
    same structure in which they were compressed.
.NOTES 
    File Name  : extract_artifacts.ps1
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

#Create an alias to make easy to call the 7zip executable
Write-Host "Creating alias..."
set-alias sz "$env:ProgramFiles\7-Zip\7z.exe" 

#Unzip all .zip files
Write-Host "Decompressing files..."
sz -y x ($deploy_path + "*.zip") ("-o" + $deploy_path) 
