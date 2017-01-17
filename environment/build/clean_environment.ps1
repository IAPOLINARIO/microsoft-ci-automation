<# 
.SYNOPSIS 
   Cleans directories, stop processes and services.
.DESCRIPTION 
    Performs the process of cleaning files, processes, and services that may prevent the 
    execution of one of the project scripts.
.NOTES 
    File Name  : clean_environment.ps1
    Author     : Ismael Apolinário - ismaelapolinario@hotmail.com 
    Requires   : PowerShell V3  
.LINK 
    https://github.com/IAPOLINARIO/microsoft-ci-automation
#> 

$backend_process_name = $backend_service_file.Substring(0, $backend_service_file.LastIndexOf('.'))
$backend_process = Get-Process | Where {$_.ProcessName -match $backend_process_name}

#Stop the processes found, otherwise the directory can not be deleted.
Write-Host "Checking if another process are running with the same name..."
if($backend_process){
    Stop-Process -Name $backend_process_name
}
