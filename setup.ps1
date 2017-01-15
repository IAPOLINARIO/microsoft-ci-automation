#THIS SCRIPT RUNS SOME OTHER SCRIPTS 
#TO AUTOMATE ALL OF THE NECESSARY TOOLS IN A WINDOWS SERVER ENVIRONMENT
#FROM A FRESH INSTALL TO PRODUCTION ENVIROMENT USING .NET CORE/4.5

#Find path where this script are saved
$basePath = Split-Path $MyInvocation.MyCommand.Path

#Loading Environment Variables
. ($basePath + ".\variables.ps1")

#region Setup Build Environment

#Setup Package Manager for WINDOWS
Invoke-Expression ($buildEnvironmentScriptPath + "setup_chocolatey.ps1")

#Setup Git
Invoke-Expression ($buildEnvironmentScriptPath + "setup_git.ps1")

#Refreshing environment 
Invoke-Expression ($buildEnvironmentScriptPath + "refresh_environment.ps1")

#Setup .NET Core 
Invoke-Expression ($buildEnvironmentScriptPath + "setup_dotnetcore_sdk.ps1")

#Setup .NET 4.6.1-devpack
Invoke-Expression ($buildEnvironmentScriptPath + "setup_dotnet_devpack.ps1")

#Setup the compression tool
Invoke-Expression ($buildEnvironmentScriptPath + "setup_compress_tool.ps1")
#endregion

#region Build
#Cloning project repository
Invoke-Expression ($buildScriptPath + "clone_repo.ps1")

#Restoring project packages
Invoke-Expression ($buildScriptPath + "restore_packages.ps1")

#Building and Publishing projects
Invoke-Expression ($buildScriptPath + "publish.ps1")

#Compress artifacts
Invoke-Expression ($buildScriptPath + "compress_artifacts.ps1")
#endregion

#region Setup Execution Environment
#Setup MSDTC
Invoke-Expression ($executionEnvironmentScriptPath + "setup_msdtc.ps1")

#Setup MSMQ
Invoke-Expression ($executionEnvironmentScriptPath + "setup_msmq.ps1")

#Setup IIS
Invoke-Expression ($executionEnvironmentScriptPath + "setup_iis.ps1")

#Setup ASP.NET MODULE for IIS
Invoke-Expression ($executionEnvironmentScriptPath + "setup_windows_hosting.ps1")

#Setup SQL EXPRESS 2014
Invoke-Expression ($executionEnvironmentScriptPath + "setup_sql_express.ps1")

#Setup SQL PS
Invoke-Expression ($executionEnvironmentScriptPath + "setup_sqlps.ps1")
#endregion

#region Deploy
#Extract Artifacts
Invoke-Expression ($deployScriptPath + "extract_artifacts.ps1")

#Create Database
Invoke-Expression ($deployScriptPath + "create_database.ps1")

#Setup App Pool
Invoke-Expression ($deployScriptPath + "setup_app_pool.ps1")


#endregion
