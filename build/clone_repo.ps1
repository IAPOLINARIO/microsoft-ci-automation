Write-Host "Navigating to root path..."
cd /

#Be sure that destination folder doesn't contain anything important!
Write-Host "Cleaning the destination folder..."
Remove-Item $source_code_destination_path -Recurse -Force

Write-Host "Creating directory to clone project..."
mkdir $source_code_destination_path

Write-Host "Navigating to destination folder..."
cd $source_code_destination_path

Write-Host "Cloning repo..."
#Using -q to escape from annoying git warnings 
git clone -q $source_code_git_origin $repo_name
