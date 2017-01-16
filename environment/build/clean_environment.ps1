
$backend_process_name = $backend_service_file.Substring(0, $backend_service_file.LastIndexOf('.'))
$backend_process = Get-Process | Where {$_.ProcessName -match $backend_process_name}


#Stop the processes found, otherwise the directory can not be deleted.
Write-Host "Checking if another process are running with the same name..."
if($backend_process){
    Stop-Process -Name $backend_process_name
}

#Be sure that destination folder doesn't contain anything important!
if(Test-Path $source_code_destination_path){
    Write-Host "Cleaning the destination folder..."
    Remove-Item $source_code_destination_path -Recurse -Force
} 
