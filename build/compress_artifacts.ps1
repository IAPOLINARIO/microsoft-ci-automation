Write-Host "Configuring 7z..."

if (-not (test-path "$env:ProgramFiles\7-Zip\7z.exe")) {
    throw "$env:ProgramFiles\7-Zip\7z.exe needed"
} 

Write-Host "Creating alias..."
set-alias sz "$env:ProgramFiles\7-Zip\7z.exe"  

if(Test-Path $deploy_path){
    Write-Host "Cleaning the deploy folder..."
    Remove-Item $deploy_path -Recurse -Force
} 

Write-Host "Compressing api..."
sz a -mx=9 ($deploy_path + "api.zip") ($publish_path + "\api\")

Write-Host "Compressing backend..."
sz a -mx=9 ($deploy_path + "backend.zip") ($publish_path + "\backend\")