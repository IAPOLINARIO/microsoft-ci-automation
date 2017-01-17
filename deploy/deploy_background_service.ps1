<# 
.SYNOPSIS 
    Deploy a .NET application as a background service
.DESCRIPTION 
    This script checks to see if a process with the same name already exists. If it exists, 
    the process is stopped and the new process is put in its place.
.NOTES 
    File Name  : deploy_background_service.ps1
    Author     : Ismael Apolinário - ismaelapolinario@hotmail.com 
    Requires   : PowerShell V3  
.LINK 
    https://github.com/IAPOLINARIO/microsoft-ci-automation
#> 

#Removes the file name extension to verify that the process is already running.
$backend_process_name = $backend_service_file.Substring(0, $backend_service_file.LastIndexOf('.'))
$backend_process = Get-Process | Where {$_.ProcessName -match $backend_process_name}

#Stop the processes found
Write-Host "Checking if another process are running with the same name..."
if($backend_process){
    Stop-Process -Name $backend_process_name
}

Write-Host "Starting the Worker Process in Background..."
Start-Process $backend_service_path -NoNewWindow