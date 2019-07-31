# override_ios_simulator_status

This repo contains a bash script with a command that runs `xcrun simctl status_bar <device> override` for each currently open iOS simulator. The arguments are the same as they are for `xcrun simctl status_bar <device> override`; run `xcrun simctl help status_bar` for those arguments.
	

## Installation

```
brew tap colejd/homebrew-tap
brew install override_ios_simulator_status
```

## Usage

```
override_ios_simulator_status --time "9:41" --batteryLevel 100
override_ios_simulator_status --help
```

Basically you can feed it the same args that would go after `override` in `xcrun simctl status_bar <device> override`.