Write-Host "Creating directory to clone project..."
mkdir $source_code_destination_path

Write-Host "Navigating to destionation folder..."
cd $source_code_destination_path

Write-Host "Cloning repo..."
#Using -q to escape from annoying git warnings 
git clone -q $source_code_git_origin $repo_name

cd $repo_name