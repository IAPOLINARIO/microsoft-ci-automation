<# 
.SYNOPSIS 
    Script to create a SQL database
.DESCRIPTION 
    This script performs checking for the existence of a SQL Server database. 
    If the database already exists, all users are disconnected and the database dropped. 
    In the final step, the database is re-created based on a .sql script
.NOTES 
    File Name  : create_database.ps1
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

#If the database already exists, all connections to it are closed and the database dropped.
Write-Host "Set Database to Single User Mode"
Invoke-Sqlcmd -Query "IF EXISTS(select * from sys.databases where name='Worker') ALTER DATABASE Worker SET SINGLE_USER WITH ROLLBACK IMMEDIATE" -ServerInstance (".\SQLEXPRESS") -Database "Master"

Write-Host "Drop database if already exists..."
Invoke-Sqlcmd -Query "IF EXISTS(select * from sys.databases where name='Worker') DROP DATABASE Worker" -ServerInstance (".\" + $sql_instance) -Database "Master" 

#The database is re-created, based on a file.
Write-Host "Recreating Database..."
Invoke-Sqlcmd -InputFile ($database_script_path + "dbo.Work.sql") -ServerInstance (".\" + $sql_instance)
