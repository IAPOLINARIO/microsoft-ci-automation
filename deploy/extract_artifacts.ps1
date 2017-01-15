Write-Host "Configuring 7z..."

if (-not (test-path "$env:ProgramFiles\7-Zip\7z.exe")) {
    throw "$env:ProgramFiles\7-Zip\7z.exe needed"
} 

Write-Host "Creating alias..."
set-alias sz "$env:ProgramFiles\7-Zip\7z.exe" 

Write-Host "Decompressing files..."
sz -y x ($deploy_path + "*.zip") ("-o" + $deploy_path) 
