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