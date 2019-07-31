# override_ios_simulator_status

Xcode 11 beta 4 introduces a command line utility for modifying the status bar of an open iOS simulator. Here's an example:

```
xcrun simctl status_bar <device> override --time "9:41" --batteryLevel 100
```

The problem with this command is that you must supply \<device\>, which is the UUID of the simulator you have open.

This repo contains a bash script that applies the args after `override` in the above command to all simulators that are currently open.

## Installation

```
brew tap colejd/homebrew-tap
brew install override_ios_simulator_status
```

## Usage

```
override_ios_simulator_status --time "9:41" --batteryLevel 100
override_ios_simulator_status --default # Applies a time of 9:41 and battery 100%
override_ios_simulator_status --help
```

Basically, you can feed it the same args that would go after `override` in `xcrun simctl status_bar <device> override`. The `--default` argument is specific to this script, and applies the Apple standard of 9:41 AM and 100% battery life for screenshots.