echo "Building Worker.Core..."
#dotnet build C:\CI\CIAssignment\src\FourC.Worker.Core\
dotnet publish C:\CI\CIAssignment\src\FourC.Worker.Core\ --configuration release

echo "Building Worker.API..."
#dotnet build C:\CI\CIAssignment\src\FourC.Worker.Api\
dotnet publish C:\CI\CIAssignment\src\FourC.Worker.Api\ --configuration release

echo "Building Worker.Backend..."
#dotnet build C:\CI\CIAssignment\src\FourC.Worker.Backend\
dotnet publish C:\CI\CIAssignment\src\FourC.Worker.Backend\ --configuration release

