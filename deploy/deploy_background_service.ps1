$backend_process = Get-Process -Name $backend_sercice_file

Write-Host "Checking if another process are running with the same name..."
if($backend_process){
    Stop-Process -Name $backend_sercice_file
}

Write-Host "Starting the Worker Process in Background..."
Start-Process $backend_service_path -NoNewWindow