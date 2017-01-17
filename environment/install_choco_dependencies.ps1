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

Write-Host "Installing Git, 7Zip, .NET Core SDK, .NET 4.1 Dev Pack, SQL Express 2014"
choco install -y git -params '"/GitOnlyOnPath"' 7zip dotnetcore-sdk -version 1.0.3 dotnet4.6.1-devpack mssqlserver2014express