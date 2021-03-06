<# 
.SYNOPSIS 
   Performs the installation of MSMQ
.DESCRIPTION 
    Message Queuing (MSMQ) technology enables applications running at different times to communicate across 
    heterogeneous networks and systems that may be temporarily offline. Applications send messages to queues and 
    read messages from queues. The following illustration shows how a queue can hold messages that are generated by 
    multiple sending applications and read by multiple receiving applications.
.NOTES 
    File Name  : setup_msmq.ps1
    Author     : Ismael Apolinário - ismaelapolinario@hotmail.com 
    Requires   : PowerShell V3  
.LINK 
   https://msdn.microsoft.com/en-us/library/ms711472(v=vs.85).aspx
#>

Write-Host "Configuring MSMQ..."
Add-WindowsFeature MSMQ