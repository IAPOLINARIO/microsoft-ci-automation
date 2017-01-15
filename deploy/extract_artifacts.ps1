Write-Host "Configuring 7z..."

if (-not (test-path "$env:ProgramFiles\7-Zip\7z.exe")) {
    throw "$env:ProgramFiles\7-Zip\7z.exe needed"
} 

Write-Host "Creating alias..."
set-alias sz "$env:ProgramFiles\7-Zip\7z.exe" 

Write-Host "Decompressing api..."
sz e ($deploy_path + "api.zip") -o ($deploy_path + "api") 

Write-Host "Decompressing backend..."
sz e($deploy_path + "backend.zip") -o ($deploy_path + "backend") 