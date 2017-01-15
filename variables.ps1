#Environment Variables

$scriptBasePath = Split-Path $MyInvocation.MyCommand.Path

$buildEnvironmentScriptPath = $scriptBasePath + "\environment\build\"
$executionEnvironmentScriptPath = $scriptBasePath + "\environment\execution\"
$buildScriptPath = $scriptBasePath + "\build\"

$build_configuration_mode = "release"
$repo_name = "CIAssignment"
$source_code_git_origin = "https://github.com/Teletrax/CIAssignment.git"
$source_code_destination_path = "C:\4C\"
$publish_path = $source_code_destination_path + $build_configuration_mode

$api_source_path = $source_code_destination_path + $repo_name + "\src\FourC.Worker.Api\"
$core_source_path = $source_code_destination_path + $repo_name + "\src\FourC.Worker.Core\"
$backend_source_path = $source_code_destination_path + $repo_name + "\src\FourC.Worker.Backend\"

$api_port = 80
$api_endpoint = "http://localhost/"

$app_pool_managedRuntimeVersion = ""

