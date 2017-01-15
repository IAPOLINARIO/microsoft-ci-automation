Write-Host "Search for SQL Instance..."
$sql_instance = (get-itemproperty 'HKLM:\SOFTWARE\Microsoft\Microsoft SQL Server').InstalledInstances | where{$_ -match "SQLEXPRESS"} | Select -First 1

if(-not($sql_instance)) {
    throw "SQLEXPRESS not found"
}


Write-Host "Set Database to Single User Mode"
Invoke-Sqlcmd -Query "IF EXISTS(select * from sys.databases where name='Worker') ALTER DATABASE Worker SET SINGLE_USER WITH ROLLBACK IMMEDIATE" -ServerInstance (".\SQLEXPRESS") -Database "Master"

Write-Host "Drop database if already exists..."
Invoke-Sqlcmd -Query "IF EXISTS(select * from sys.databases where name='Worker') DROP DATABASE Worker" -ServerInstance (".\" + $sql_instance) -Database "Master" 

Write-Host "Recreating Database..."
Invoke-Sqlcmd -InputFile ($database_script_path + "dbo.Work.sql") -ServerInstance (".\" + $sql_instance)
