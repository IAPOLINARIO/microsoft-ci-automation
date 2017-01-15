Write-Host "Starting the Worker Process in Background..."
Start-Process -WorkingDirectory ($deploy_path + "background") -FilePath "FourC.Worker.Backend.exe" -NoNewWindow 