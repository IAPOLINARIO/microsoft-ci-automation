Write-Host "Importing Web Administration Module..."
Import-Module WebAdministration

#Get-ChildItem –Path IIS:\AppPools

Write-Host "Creating new App Pool for API..."
New-Item –Path IIS:\AppPools\API

#Get-ItemProperty IIS:\AppPools\API | select *

Write-Host "Set the Runtime Version to No Manage Code..."
Set-ItemProperty -Path IIS:\AppPools\API -Name managedRuntimeVersion -Value $app_pool_managedRuntimeVersion

#Remove-WebAppPool -Name MyAppPool

