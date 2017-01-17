<# 
.SYNOPSIS 
    Performs SQL Query in Local Database
.DESCRIPTION 
    Performs query in the SQL database to verify that the request data made for the API has been 
    consumed by the backend service
.NOTES 
    File Name  : sql_test.ps1
    Author     : Ismael Apolinário - ismaelapolinario@hotmail.com 
    Requires   : PowerShell V3  
.LINK 
    https://github.com/IAPOLINARIO/microsoft-ci-automation
#> 

#Searches for installed SQL Server instances.
Write-Host "Search for SQL Instance..."
$sql_instance = (get-itemproperty 'HKLM:\SOFTWARE\Microsoft\Microsoft SQL Server').InstalledInstances | where{$_ -match "SQLEXPRESS"} | Select -First 1

#If no instance is found, an error is thrown.
if(-not($sql_instance)) {
    throw "SQLEXPRESS not found"
}

$query = Invoke-Sqlcmd -Query "SELECT * FROM Work" -ServerInstance (".\" + $sql_instance) -Database "Worker" 

if($query.Count -gt 0) {
    Write-Host ("Your environment it's fully up & running. Congratulations !!!") -ForegroundColor Green
}
else {
    Write-Host ("No data found. Check the connection and try again.") -ForegroundColor Red
}