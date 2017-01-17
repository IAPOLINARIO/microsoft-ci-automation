# Create more robust Process as compared to Start-Process -Wait (which doesn't
# wait for the process to finish in PowerShell v3)

$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$dependencies = Get-Content  ($scriptPath + "\choco_dependencies.txt")
$chocoPath = Join-Path $env:ChocolateyInstall "choco.exe"

foreach($dep in $dependencies) {
    Write-Host ("Installing " + $dep + ".This can take a while. Be patient...") -ForegroundColor Green 
    #$pinfo = New-Object System.Diagnostics.ProcessStartInfo
    #$pinfo.FileName = "choco"
    #$pinfo.RedirectStandardError = $true
    #$pinfo.RedirectStandardOutput = $true
    #$pinfo.UseShellExecute = $false
    #$pinfo.Arguments = "install -y $dep"
    $params = ("install -y " + $dep)
    $process = New-Object System.Diagnostics.Process
    $process.StartInfo = New-Object System.Diagnostics.ProcessStartInfo($chocoPath, $params)
    $process.StartInfo.RedirectStandardOutput = $true
    $process.StartInfo.RedirectStandardError = $true
    $process.StartInfo.UseShellExecute = $false
    $process.StartInfo.WindowStyle = [System.Diagnostics.ProcessWindowStyle]::Hidden
    #$process.StartInfo = $pinfo
    $process.Start() | Out-Null
    $process.BeginOutputReadLine()
    $process.BeginErrorReadLine()
    $process.WaitForExit()
    #$stdout = $process.StandardOutput.ReadToEnd()
    #$stderr = $process.StandardError.ReadToEnd()

    #if($stdout) {
    #    Write-Host "stdout: $stdout"
    #}

    #if($stderr){
    #    Write-Host "stderr: $stderr"
    #}
    $process.Dispose()
}