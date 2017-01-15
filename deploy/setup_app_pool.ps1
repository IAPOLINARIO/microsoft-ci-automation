Write-Host "Importing Web Administration Module..."
Import-Module WebAdministration

Write-Host "Creating new App Pool for API..."
New-Item –Path IIS:\AppPools\API

Write-Host "Set the Runtime Version to No Manage Code..."
Set-ItemProperty -Path IIS:\AppPools\API -Name managedRuntimeVersion -Value ''

