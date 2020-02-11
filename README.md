# leds_handler

This cookbook installs a [Chef handler](https://docs.chef.io/handlers.html) for blinking the LEDs on Raspberry Pi and other similar systems that expose control of their LEDs in Linux via `/sys/devices/platform/leds/leds/leds0/trigger` (where `leds0` may be any number of LEDs). At the beginning of the Chef client run the LEDs blink a heartbeat pattern, at the end the LEDs are disabled. If the Chef client run fails the lights all stay on.

If you happen to be using a Macbook Air or Pro it will attempt to flash the `/sys/class/leds/smc::kbd_backlight/brightness` keyboard backlight at the beginning of the run and power it off at the end. If the Chef client run fails the keyboard backlight is set to maximum.

It's quite simple, but this is an exercise in writing and installing handlers through a cookbook.

https://mattray.github.io/assets/flashing_leds.gif
