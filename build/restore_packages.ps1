Write-Host "Restoring FourC.Worker.Core Packages..."
dotnet restore ($core_source_path + "project.json")

Write-Host "Restoring FourC.Worker.Backend Packages..."
dotnet restore ($backend_source_path + "project.json")

Write-Host "Restoring FourC.Worker.Api Packages..."
dotnet restore ($api_source_path + "project.json")