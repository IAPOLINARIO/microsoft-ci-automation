<# 
.SYNOPSIS 
   Performs the installation of MSDTC
.DESCRIPTION 
    You can use the Services snap-in to start or stop the Distributed Transaction Coordinator service (MSDTC). 
    To commit any configuration changes, the Component Services administrative tool requires Microsoft Distributed 
    Transaction Coordinator (MS DTC) to be running.
.NOTES 
    File Name  : setup_msdtc.ps1
    Author     : Ismael Apolinário - ismaelapolinario@hotmail.com 
    Requires   : PowerShell V3  
.LINK 
   https://technet.microsoft.com/pt-br/library/cc770732(v=ws.10).aspx
#>

Write-Host "Installing and configuring MSDTC..."
msdtc -install
