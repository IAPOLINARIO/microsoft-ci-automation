Write-Host "Creating Database"

Write-Host "Search for SQL Instance..."
$sql_instance = (get-itemproperty 'HKLM:\SOFTWARE\Microsoft\Microsoft SQL Server').InstalledInstances | where{$_ -match "SQLEXPRESS"} | Select -First 1

if(-not($sql_instance)) {
    throw "SQLEXPRESS not found"
}

Invoke-Sqlcmd -InputFile ($database_script_path + "dbo.Work.sql") -ServerInstance ".\" + $sql_instance
