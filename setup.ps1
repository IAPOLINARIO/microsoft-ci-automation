#THIS SCRIPT RUNS SOME OTHER SCRIPTS 
#TO AUTOMATE ALL OF THE NECESSARY TOOLS IN A WINDOWS SERVER ENVIRONMENT
#FROM A FRESH INSTALL TO PRODUCTION ENVIROMENT USING .NET CORE/4.5

#Find path where this script are saved
$basePath = Split-Path $MyInvocation.MyCommand.Path

#Loading Environment Variables
. ($basePath + ".\variables.ps1")

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

#Cloning project repository
Invoke-Expression ($buildScriptPath + "clone_repo.ps1")

#Restoring project packages
Invoke-Expression ($buildScriptPath + "restore_packages.ps1")

#Building and Publishing projects
Invoke-Expression ($buildScriptPath + "restore_packages.ps1")
