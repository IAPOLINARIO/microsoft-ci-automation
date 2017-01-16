$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$dependencies = Get-Content  ($scriptPath + "\dependencies.txt")

foreach($dep in $dependencies) {
    choco install -y $dep
}