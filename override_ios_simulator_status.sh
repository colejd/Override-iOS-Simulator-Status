#!/bin/bash

function override_ios_simulator_status
{
	usage="\
This command runs \`xcrun simctl status_bar <device> override\` 
for each currently open simulator. The arguments are the same
as they are for \`xcrun simctl status_bar <device> override\`; 
run \`xcrun simctl help status_bar\` for those arguments.

If you use no arguments, a time of 9:41 AM and a
battery level of 100% will be applied.

Usage:
override_ios_simulator_status <args>
"

	# Parse arguments
	for i in "$@"; do
	case $i in
	    -h|--help)
	    local HELP=1
	    ;;
	    -d|--default)
	    local DEFAULT=1
	    ;;
	esac
	done

	# Display help option
	if [[ $HELP -eq 1 ]]; then
		echo "$usage"
		return 0
	fi

	# Raise DEFAULT flag if no arguments were supplied
	if [[ $# -eq 0 ]]; then
		local DEFAULT=1
	fi

	uuidPattern="([0-9a-f]{8}-([0-9a-f]{4}-){3}[0-9a-f]{12})"

	devices=`xcrun simctl list devices | grep "(Booted)"`

	if test -z $devices; then
		echo "No simulators are open."
		return 0
	fi

	echo $devices |
	while IFS= read -r line; do
		trimmedLine=`echo $line | xargs`
		# Extract the UUID of the device from the line
		uuid=`echo $trimmedLine | grep -o -E -i "$uuidPattern"`

		# Apply only if a UUID was found
		if test -n $uuid; then
			if [[ $DEFAULT -eq 1 ]]; then
				echo "Applying default args to $trimmedLine"
				echo "--time \"9:41\" --batteryLevel 100"
				xcrun simctl status_bar $uuid override --time "9:41" --batteryLevel 100
			else
				echo "Applying args to $trimmedLine"
				xcrun simctl status_bar $uuid override $@
			fi
		fi
	done
}
