<# 
.SYNOPSIS 
   Performs the installation of ASP.NET Core Module for IIS
.DESCRIPTION 
    This package installs the ASP.NET Core Module for IIS and/or IIS Express, enabling running of 
    ASP.NET Core applications. IIS must be enabled and/or IIS Express must be installed prior to installing this 
    package. ASP.NET Core does not use any managed IIS modules, so no ASP.NET IIS features need to be enabled.
.NOTES 
    File Name  : setup_windows_hosting.ps1
    Author     : Ismael Apolinário - ismaelapolinario@hotmail.com 
    Requires   : PowerShell V3  
.LINK 
   https://chocolatey.org/packages/dotnetcore-windowshosting
#>

Write-Host "Setup .NET Core Module for IIS..."
choco install -y dotnetcore-windowshosting