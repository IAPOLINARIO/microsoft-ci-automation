Write-Host "Installing and configuring IIS 8.5..."
import-module servermanager
Add-WindowsFeature Web-Asp-Net, Web-Mgmt-Service, Web-Mgmt-Tools, Web-Server, Web-WebServer, Web-Common-Http, Web-Default-Doc, Web-Dir-Browsing, Web-Http-Errors, Web-Static-Content, Web-Health, Web-Http-Logging, Web-Performance, Web-Stat-Compression, Web-Security, Web-Filtering -IncludeManagementTools

