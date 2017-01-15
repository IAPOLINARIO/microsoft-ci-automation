Write-Host "Importing Web Administration Module..."
Import-Module WebAdministration

Write-Host "Checking if Pool already exists..."
$api_pool = Get-ChildItem -Path $base_iis_app_pool_path | Where { $_.Name -match $api_site_name } | Select Name -First 1

if(-not($api_pool)){
    New-Item –Path $iis_api_pool_path
}

Set-ItemProperty -Path $iis_api_pool_path -Name managedRuntimeVersion -Value ''