<# 
.SYNOPSIS 
    Main script to setup the Windows Server 2016 environment
.DESCRIPTION 
    This script calls various other scripts that will install and configure tools and frameworks 
    to provide a Dev/QA/Production environment without the need to perform any manual processes
.NOTES 
    Author     : Ismael Apolinário - ismaelapolinario@hotmail.com 
.LINK 
    https://github.com/IAPOLINARIO/microsoft-ci-automation
#> 

#Find path where this script are saved
$basePath = Split-Path $MyInvocation.MyCommand.Path

#Loading Environment Variables
. ($basePath + ".\variables.ps1")

#region Setup Build Environment

#Setup Package Manager for WINDOWS
Invoke-Expression ($buildEnvironmentScriptPath + "setup_chocolatey.ps1")

#Install all the Chocolatey Dependencies
Invoke-Expression ($environmentScriptPath + "install_choco_dependencies.ps1")

#Refreshing environment 
Invoke-Expression ($buildEnvironmentScriptPath + "refresh_environment.ps1")

#Stop old process
Invoke-Expression ($buildEnvironmentScriptPath + "clean_environment.ps1")
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

#Setup SQL PS
Invoke-Expression ($executionEnvironmentScriptPath + "setup_sqlps.ps1")

#Refreshing environment 
Invoke-Expression ($buildEnvironmentScriptPath + "refresh_environment.ps1")
#endregion

#region Deploy
#Extract Artifacts
Invoke-Expression ($deployScriptPath + "extract_artifacts.ps1")

#Create Database
Invoke-Expression ($deployScriptPath + "create_database.ps1")

#Setup App Pool
Invoke-Expression ($deployScriptPath + "setup_iis_pool.ps1")

#Deploy Api
Invoke-Expression ($deployScriptPath + "deploy_api.ps1")

#Deploy Background Service
Invoke-Expression ($deployScriptPath + "deploy_background_service.ps1")

#endregion

#Test

#endregion
