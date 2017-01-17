#Searches for installed SQL Server instances.
Write-Host "Search for SQL Instance..."
$sql_instance = (get-itemproperty 'HKLM:\SOFTWARE\Microsoft\Microsoft SQL Server').InstalledInstances | where{$_ -match "SQLEXPRESS"} | Select -First 1

$settingsPath = $backend_source_path + "appsettings.json"
$textReplace = "Data Source=."

if($sql_instance) {
    $newText = "Data Source=.\" + $sql_instance
    (Get-Content  $settingsPath).replace($textReplace, $newText) | Set-Content $settingsPath
}