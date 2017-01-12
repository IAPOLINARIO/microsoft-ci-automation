#Invoke-Sqlcmd -Query "SELECT GETDATE() AS TimeOfQuery;" -ServerInstance ".\SQLEXPRESS"  
#Invoke-Sqlcmd -InputFile "C:\CI\CIAssignment\scripts\dbo.Work.sql" -ServerInstance ".\SQLEXPRESS"
Invoke-Sqlcmd -Query "SELECT count(*) FROM WORK" -ServerInstance ".\SQLEXPRESS" -Database "WORKER" 
#-querytimeout 0

#"ConnectionString": "Data Source=.;Initial Catalog=Worker;Integrated Security=False;Pooling=False",