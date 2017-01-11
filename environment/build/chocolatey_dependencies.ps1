$packagelist = 
"iis",
"dotnetcore"


foreach ($package in $packagelist)
{
    choco install -y $package
}