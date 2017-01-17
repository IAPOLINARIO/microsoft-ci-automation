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
    Write-Host ("Installing " + $dep + ".This can take a while. Be patient...") -ForegroundColor Green 
    $pinfo.Arguments = "install -y $dep"
    $p = New-Object System.Diagnostics.Process
    $p.StartInfo = $pinfo
    $p.Start() | Out-Null
    #$p.BeginOutputReadLine()
    #$p.BeginErrorReadLine()
    $p.WaitForExit()
    $stdout = $p.StandardOutput.ReadToEnd()
    $stderr = $p.StandardError.ReadToEnd()

    if($stdout) {
        Write-Host "stdout: $stdout"
    }

    if($stderr){
        Write-Host "stderr: $stderr"
    }
    $p.Dispose()
}