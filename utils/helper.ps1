
##WIN-FK5DPMVMVR2\SQLEXPRESS
##(get-itemproperty 'HKLM:\SOFTWARE\Microsoft\Microsoft SQL Server').InstalledInstances
##$env:computername
#-includeallsubfeature

#Invoke-Sqlcmd -Query "SELECT count(*) FROM WORK" -ServerInstance ".\SQLEXPRESS" -Database "WORKER" 
#-querytimeout 0

#"ConnectionString": "Data Source=.;Initial Catalog=Worker;Integrated Security=False;Pooling=False",


#Get-ChildItem –Path IIS:\AppPools

#Get-ItemProperty IIS:\AppPools\API | select *


#Remove-WebAppPool -Name MyAppPool
