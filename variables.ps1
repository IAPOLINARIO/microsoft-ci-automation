#Environment Variables

$scriptBasePath = Split-Path $MyInvocation.MyCommand.Path

$environmentScriptPath = $scriptBasePath + "\environment\"
$buildEnvironmentScriptPath = $scriptBasePath + $environmentScriptPath +"build\"
$executionEnvironmentScriptPath = $scriptBasePath + $environmentScriptPath + "execution\"
$buildScriptPath = $scriptBasePath + "\build\"
$deployScriptPath = $scriptBasePath + "\deploy\"

$build_configuration_mode = "Release"
$repo_name = "CIAssignment"
$source_code_git_origin = "https://github.com/Teletrax/CIAssignment.git"
$source_code_destination_path = "C:\4C\"
$publish_path = $source_code_destination_path + $repo_name + "\" + $build_configuration_mode
$deploy_path = $source_code_destination_path + $repo_name + "\Deploy\"

$api_source_path = $source_code_destination_path + $repo_name + "\src\FourC.Worker.Api\"
$core_source_path = $source_code_destination_path + $repo_name + "\src\FourC.Worker.Core\"
$backend_source_path = $source_code_destination_path + $repo_name + "\src\FourC.Worker.Backend\"
$backend_service_file = "FourC.Worker.Backend.exe"
$backend_service_path =  $deploy_path + "backend\" + $backend_service_file

$database_script_path = $source_code_destination_path + $repo_name + "\scripts\"

$api_site_name = "API"
$api_port = 80
$api_endpoint = "http://localhost:" + $api_port + "/v1/worker/"

$base_iis_app_pool_path = "IIS:\AppPools\"
$iis_api_pool_path = $base_iis_app_pool_path + $api_site_name
