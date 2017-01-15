Write-Host "Building and Publishing Worker.Core..."
dotnet publish $core_source_path--configuration $build_configuration_mode --output ($publish_path + "\core\")

Write-Host "Building and Publishing Worker.API..."
dotnet publish $api_source_path --configuration $build_configuration_mode --output ($publish_path + "\api\")

Write-Host "Building and Publishing Worker.Backend..."
dotnet publish $backend_source_path --configuration $build_configuration_mode --output ($publish_path + "\backend\")

