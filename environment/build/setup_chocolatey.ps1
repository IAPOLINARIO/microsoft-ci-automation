<# 
.SYNOPSIS 
   Performs the installation of the Chocolatey
.DESCRIPTION 
    Chocolatey is a single, unified interface designed to easily work with all aspects of managing Windows software 
    using a packaging framework that understands both versioning and dependency requirements. Chocolatey packages 
    encapsulate everything required to manage a particular piece of software into one deployment artifact by wrapping 
    installers, executables, zips, and scripts into a compiled package file. 
.NOTES 
    File Name  : setup_chocolatey.ps1
    Author     : Ismael Apolinário - ismaelapolinario@hotmail.com 
    Requires   : PowerShell V3  
.LINK 
    https://chocolatey.org
#>

Write-Host "Installing chocolatey..."
iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex