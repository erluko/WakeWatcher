# WakeWatcher
Waits for system to wake from sleep and executes any executables in /opt/wake
Only works on macOS.


# Building
Build in Xcode or run `xcodebuild`. There are no dependencies.


# Using WakeWatcher
Create a LaunchDaemon to run the items you need.

On wake from sleep, WakeWatcher will attempt to run anything under
/opt/wake (*.sh, *.py, *.rb, etc). An example LD is included.


# Bugs

WakeWatcher is not configurable.

WakeWatcher calls NSLog a lot.

WakeWatcher does not check to see if processes under `/opt/wake` are already executing
before attempting to launch them.

# Authorship/Licence
Created by Eric Kobrin.
Released under CC0 1.0 (Public Domain)
  https://creativecommons.org/publicdomain/zero/1.0/
