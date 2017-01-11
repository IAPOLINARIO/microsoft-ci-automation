if (-not (test-path "$env:ProgramFiles\7-Zip\7z.exe")) {throw "$env:ProgramFiles\7-Zip\7z.exe needed"} 
set-alias sz "$env:ProgramFiles\7-Zip\7z.exe"  

$Source = "c:\BackupFrom\backMeUp.txt" 
$Target = "c:\BackupFolder\backup.zip"

sz a -mx=9 $Target $Source