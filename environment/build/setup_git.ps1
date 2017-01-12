echo "Installing GIT..."
choco install -y git -params '"/GitOnlyOnPath"'
echo "Refreshing environment...."
refreshenv