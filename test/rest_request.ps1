<# 
.SYNOPSIS 
    Performs the API test
.DESCRIPTION 
    Performs a REST request to API deployed on local IIS.
.NOTES 
    File Name  : rest_request.ps1
    Author     : Ismael Apolinário - ismaelapolinario@hotmail.com 
    Requires   : PowerShell V3  
.LINK 
    https://github.com/IAPOLINARIO/microsoft-ci-automation
#> 

$JSON = @'
{
    "user":"iapolinario",
    "content":"iapolinario",
    "timestamp":"2017-01-16T02:00:00Z"
}
'@

$response = Invoke-RestMethod -Uri $api_endpoint -Method Post -Body $JSON -ContentType "application/json"
Write-Host $response