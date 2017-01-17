<# 
.SYNOPSIS 
    Deploy a .NET Web Application to IIS
.DESCRIPTION 
    This script checks if a site already exists on the same port where the web application is being deployed. 
    If it exists, the site is removed and the new web application is made available.
.NOTES 
    File Name  : deploy_api.ps1
    Author     : Ismael Apolinário - ismaelapolinario@hotmail.com 
    Requires   : PowerShell V3  
.LINK 
    https://github.com/IAPOLINARIO/microsoft-ci-automation
#> 

#Check if there is already a site with binding to the port where the api will be deployed
$siteBindedOnApiPort = Get-Website | Where { ($_.bindings.Collection.bindingInformation -eq '*:' + $api_port + ':') -and ($_.State -eq "Started") } | Select -First 1
$ApiSiteAlreadyExists =  Get-Website -Name $api_site_name

Write-Host "Checking if there's any site binded on same port of API..."
if($siteBindedOnApiPort){
    Write-Host "Stopping site on API Port..."
    Stop-Website -Name $siteBindedOnApiPort.name
}

Write-Host "Checking if there's any site with same name of API Site..."
if($ApiSiteAlreadyExists){
    Write-Host "Removing Site with same name..."
    Remove-Website -Name $ApiSiteAlreadyExists.name -Confirm:$false
}

Write-Host "Creating new site..."
New-Website -Name $api_site_name -PhysicalPath ($deploy_path + "api") -Port $api_port -ApplicationPool $api_site_name