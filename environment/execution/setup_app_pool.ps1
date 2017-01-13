echo "Importing Web Administration Module..."
Import-Module WebAdministration

#Get-ChildItem –Path IIS:\AppPools

echo "Creating new App Pool for API..."
New-Item –Path IIS:\AppPools\API

#Get-ItemProperty IIS:\AppPools\API | select *

echo "Set the Runtime Version to No Manage Code..."
Set-ItemProperty -Path IIS:\AppPools\API -Name managedRuntimeVersion -Value ''

#Remove-WebAppPool -Name MyAppPool

