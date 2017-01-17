<# 
.SYNOPSIS 
   Install dependencies using Chocolatey
.DESCRIPTION 
    Chocolatey is a package manager for Windows (like apt-get or yum but for Windows). It was designed to be a 
    decentralized framework for quickly installing applications and tools. It is built on the NuGet 
    infrastructure currently using PowerShell as its focus for delivering packages.
.NOTES 
    File Name  : install_choco_dependencies.ps1
    Author     : Ismael Apolinário - ismaelapolinario@hotmail.com 
    Requires   : PowerShell V3  
.LINK 
   https://chocolatey.org/packages/
#>

Write-Host "Installing Git..."
choco install git -params '"/GitOnlyOnPath"'

Write-Host "Installing 7Zip..."
choco install 7zip

Write-Host "Installing .NET Core SDK..."
choco install dotnetcore-sdk -version 1.0.3

Write-Host "Installing .NET 4.1 Dev Pack..."
choco install dotnet4.6.1-devpack

Write-Host "Installing SQL Express 2014..."
choco install mssqlserver2014express