echo "Restoring .NET Core Packages..."
echo "Restoring FourC.Worker.Core Packages..."
dotnet restore C:\CI\CIAssignment\src\FourC.Worker.Core\project.json

echo "Restoring FourC.Worker.Backend Packages..."
dotnet restore C:\CI\CIAssignment\src\FourC.Worker.Backend\project.json

echo "Restoring FourC.Worker.Api Packages..."
dotnet restore C:\CI\CIAssignment\src\FourC.Worker.Api\project.json