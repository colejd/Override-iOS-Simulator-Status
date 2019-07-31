
version="1.0.0"
dest="bin/override_ios_simulator_status-$version.tar.gz"
tar -cvzf $dest override_ios_simulator_status
shasum -a 256 $dest