
version="1.0.0"
dest="override_ios_simulator_status-$version.tar.gz"
tar --exclude='./gitignore' --exclude='./DS_Store' --exclude='./.git' --exclude='./readme.md' --exclude='./LICENSE.md' --exclude='./update.sh' --exclude='./*.tar.gz' -zcvf "$dest" .
shasum -a 256 $dest