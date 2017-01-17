<# 
.SYNOPSIS 
   Performs the installation of IIS 8.5
.DESCRIPTION 
    Internet Information Services (IIS) for Windows Server is a flexible, secure and manageable Web server 
    for hosting anything on the Web. From media streaming to web applications, IIS's scalable and open architecture 
    is ready to handle the most demanding tasks.
.NOTES 
    File Name  : setup_iis.ps1
    Author     : Ismael Apolinário - ismaelapolinario@hotmail.com 
    Requires   : PowerShell V3  
.LINK 
   https://www.iis.net/
#>

Write-Host "Installing and configuring MSDTC..."
msdtc -install
