# Create more robust Process as compared to Start-Process -Wait (which doesn't
# wait for the process to finish in PowerShell v3)

$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$dependencies = Get-Content  ($scriptPath + "\choco_dependencies.txt")
$pinfo = New-Object System.Diagnostics.ProcessStartInfo
$pinfo.FileName = "choco"
$pinfo.RedirectStandardError = $true
$pinfo.RedirectStandardOutput = $true
$pinfo.UseShellExecute = $false

foreach($dep in $dependencies) {
    $pinfo.Arguments = "install -y $dep"
    $p = New-Object System.Diagnostics.Process
    $p.StartInfo = $pinfo
    $p.Start() | Out-Null
    $p.WaitForExit()
    $stdout = $p.StandardOutput.ReadToEnd()
    $stderr = $p.StandardError.ReadToEnd()

    if($stdout) {
        Write-Host "stdout: $stdout"
    }

    if($stderr){
        Write-Host "stderr: $stderr"
    }
    
    Write-Host ("exit code: " + $p.ExitCode)
}