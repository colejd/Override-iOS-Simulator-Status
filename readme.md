# override_ios_simulator_status

Xcode 11 beta 4 introduces a command line utility for modifying the status bar of an open iOS simulator. Here's an example:

```bash
xcrun simctl status_bar <device> override --time 9:41 --batteryLevel 100 --cellularBars 4 --wifiBars 3
```

The problem with this command is that you must supply `\<device\>` (no longer true, see note below), which is the UUID of the simulator you have open. Finding that UUID involves running `xcrun simctl list` and poring through the output for the simulator(s) you have open.

This repo contains a bash script that applies the args after `override` in the above command to all simulators that are currently open. The equivalent to the above would be:

```bash
override_ios_simulator_status --time "9:41" --batteryLevel 100 --cellularBars 4 --wifiBars 3
```

or just this:

```bash
override_ios_simulator_status --default
```

## Note from the future

It's [current year] and now `xcrun simctl status_bar` accepts `booted` as a parameter for the device, meaning you can now run the same command on all open simulators as this utility does. You may not need this, but it at least provides the App Store-ready `--default` argument, which Apple's utility lacks.


## Installation

```bash
brew tap colejd/homebrew-tap
brew install override_ios_simulator_status
```

## Usage

```bash
override_ios_simulator_status <args>
override_ios_simulator_status --default # Applies a time of 9:41, battery level of 100%, and a 
override_ios_simulator_status --help
```

Basically, you can feed it the same args that would go after `override` in `xcrun simctl status_bar <device> override`. The `--default` argument is specific to this script, and applies the Apple standard of 9:41 AM, 100% battery, and full signal strength.