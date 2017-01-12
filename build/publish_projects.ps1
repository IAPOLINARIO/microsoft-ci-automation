echo "Building Worker.Core..."
dotnet publish C:\CI\CIAssignment\src\FourC.Worker.Core\ --configuration release

echo "Building Worker.API..."
dotnet publish C:\CI\CIAssignment\src\FourC.Worker.Api\ --configuration release

echo "Building Worker.Backend..."
dotnet publish C:\CI\CIAssignment\src\FourC.Worker.Backend\ --configuration release