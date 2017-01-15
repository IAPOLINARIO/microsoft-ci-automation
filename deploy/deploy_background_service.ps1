$backend_process_name = $backend_service_file.Substring(0, $backend_service_file.LastIndexOf('.'))
$backend_process = Get-Process | Where {$_.ProcessName -match $backend_process_name}


Write-Host "Checking if another process are running with the same name..."
if($backend_process){
    Stop-Process -Name $backend_process_name
}

Write-Host "Starting the Worker Process in Background..."
Start-Process $backend_service_path -NoNewWindow