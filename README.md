# WakeWatcher

Waits for system to wake from sleep and executes ~/.onwake
Only works on OS X.


# Building

Build in Xcode or run `xcodebuild`. There are no dependencies.


# Using WakeWatcher

Launch WakeWatcher.app. Until WakeWatcher supports launchd, consider
making WakeWatcher.app a login item.

On wake from sleep, if `~/.onwake` exists and is executable,
WakeWatcher will `chdir` to the current user's home directory and
execute `.onwake`


# Bugs

WakeWatcher is not configurable.

WakeWatcher calls NSLog a lot.

WakeWatcher does not check to see if `~/.onwake` is already executing
before attempting to launch it.

WakeWatcher does not support launchd. Patches welcome.


# Authorship/Licence

Created by Eric Kobrin.
Released under CC0 1.0 (Public Domain)
  https://creativecommons.org/publicdomain/zero/1.0/
