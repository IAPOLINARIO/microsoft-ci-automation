Write-Host "Restoring FourC.Worker.Core Packages..."
dotnet restore ($source_code_path_destination + "\src\FourC.Worker.Core\project.json")

Write-Host "Restoring FourC.Worker.Backend Packages..."
dotnet restore ($source_code_path_destination + "\src\FourC.Worker.Backend\project.json")

Write-Host "Restoring FourC.Worker.Api Packages..."
dotnet restore ($source_code_path_destination + "\src\FourC.Worker.Api\project.json")