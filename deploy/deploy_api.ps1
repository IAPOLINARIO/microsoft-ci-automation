echo "Creating Application Pool..."


echo "Creating Website..."
New-Website -Name API -PhysicalPath C:\CI\CIAssignment\src\FourC.Worker.Api\bin\Release\net461\win7-x64\publish\ 
            -Port 80 