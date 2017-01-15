Write-Host "Importing Web Administration Module..."
Import-Module WebAdministration

Write-Host "Checking if Pool already exists..."
$api_pool = Get-ChildItem -Path "IIS:\AppPools" | Where {$_.Name -match $api_site_name} | Select Name -First 1

if(-not ($api_pool)){
    Write-Host "Creating new App Pool for API..."
    New-Item –Path $iis_app_pool_path
}

Write-Host "Set the Runtime Version to No Manage Code..."
Set-ItemProperty -Path $iis_app_pool_path -Name managedRuntimeVersion -Value $app_pool_managedRuntimeVersion