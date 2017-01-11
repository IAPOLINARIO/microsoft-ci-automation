echo "Building Worker.Core..."
dotnet publish C:\CI\CIAssignment\src\FourC.Worker.Core\

echo "Building Worker.API..."
dotnet publish C:\CI\CIAssignment\src\FourC.Worker.Api\

echo "Building Worker.Backend..."
dotnet publish C:\CI\CIAssignment\src\FourC.Worker.Backend\