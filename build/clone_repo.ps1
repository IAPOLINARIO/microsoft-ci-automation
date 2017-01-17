<# 
.SYNOPSIS 
    Main script to setup the Windows Server 2016 environment
.DESCRIPTION 
    This script calls various other scripts that will install and configure tools and frameworks 
    to provide a Dev/QA/Production environment without the need to perform any manual processes
.NOTES 
    File Name  : clone_repo.ps1
    Author     : Ismael Apolinário - ismaelapolinario@hotmail.com 
    Requires   : PowerShell V3  
.LINK 
    https://github.com/IAPOLINARIO/microsoft-ci-automation
#> 


Write-Host "Navigating to root path..."
cd /

#Checks whether the destination path already exists. If it exists, it deletes so that the project can 
#be cloned without problems.
if(Test-Path $source_code_destination_path){
    Write-Host "Cleaning the destination folder..."
    Remove-Item $source_code_destination_path -Recurse -Force
} 

Write-Host "Creating directory to clone project..."
mkdir $source_code_destination_path

Write-Host "Navigating to destination folder..."
cd $source_code_destination_path

Write-Host "Cloning repo..."

#Using -q to escape from annoying git warnings 
git clone -q $source_code_git_origin $repo_name
