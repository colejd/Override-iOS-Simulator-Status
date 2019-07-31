
version="1.0.1"
dest="override_ios_simulator_status-$version.tar.gz"
tar --exclude='./.gitignore' --exclude='./.DS_Store' --exclude='./.git' --exclude='./update.sh' --exclude='./*.tar.gz' -zcvf "$dest" .
shasum -a 256 $dest