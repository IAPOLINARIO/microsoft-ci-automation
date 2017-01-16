$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$dependencies = Get-Content  ($scriptPath + "\choco_dependencies.txt")

foreach($dep in $dependencies) {
    choco install -y $dep
}