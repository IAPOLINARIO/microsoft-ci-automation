echo "Installing and configuring IIS 8.5..."
import-module servermanager
add-windowsfeature web-server -name Web-Server -IncludeAllSubFeature -IncludeManagementTools 

