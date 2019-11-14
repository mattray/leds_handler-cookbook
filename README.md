# leds_handler

This cookbook installs a [Chef handler](https://docs.chef.io/handlers.html) for blinking the LEDs on Raspberry Pi and other similar systems that expose control of their LEDs in Linux via `/sys/devices/platform/leds/leds/leds0/trigger` (where `leds0` may be any number of LEDs). At the beginning of the Chef client run the LEDs blink a heartbeat pattern, at the end the LEDs are disabled.

It's quite simple, but this is an exercise in writing and installing handlers through a cookbook.



# record the LED status [mmc0]
# restore at end of chef-client run

# flash
# echo timer > trigger
# solid
# root@wernstrom:/sys/class/leds/led0# echo none > trigger

# USR0 is the one that blinks in a heartbeat pattern;
# USR1 lights when accessing the microSD card;
# USR2 lights during CPU activity and
# USR3 lights when the eMMC is accessed.

# root@cubert:/sys/class/leds# echo none > beaglebone\:green\:usr3/trigger
# root@cubert:/sys/class/leds# echo none > beaglebone\:green\:usr2/trigger
# root@cubert:/sys/class/leds# echo none > beaglebone\:green\:usr1/trigger
# root@cubert:/sys/class/leds# echo none > beaglebone\:green\:usr0/trigger

# root@cubert:/sys/class/leds# echo timer > beaglebone\:green\:usr3/trigger
# root@cubert:/sys/class/leds# echo timer > beaglebone\:green\:usr2/trigger
# root@cubert:/sys/class/leds# echo timer > beaglebone\:green\:usr1/trigger
# root@cubert:/sys/class/leds# echo timer > beaglebone\:green\:usr0/trigger

on/off by default

default-on/none

leave first on?

leds = shell_out('ls /sys/devices/platform/leds/leds').stdout
leds.split.each led do

original = `cat /sys/devices/platform/leds/leds/led0/trigger`

echo none > /sys/devices/platform/leds/leds/led0/trigger
echo none > /sys/devices/platform/leds/leds/led1/trigger

echo none > /sys/devices/platform/leds/leds/led0/trigger; echo none > /sys/devices/platform/leds/leds/led1/trigger

sleep = 1/count


echo timer > /sys/devices/platform/leds/leds/led0/trigger
sleep .5
echo timer > /sys/devices/platform/leds/leds/led1/trigger

echo heartbeat > /sys/devices/platform/leds/leds/led0/trigger; sleep .5; echo heartbeat > /sys/devices/platform/leds/leds/led1/trigger


echo none > /sys/devices/platform/leds/leds/beaglebone:green:usr0/trigger; echo none > /sys/devices/platform/leds/leds/beaglebone:green:usr1/trigger; echo none > /sys/devices/platform/leds/leds/beaglebone:green:usr2/trigger; echo none > /sys/devices/platform/leds/leds/beaglebone:green:usr3/trigger

echo timer > /sys/devices/platform/leds/leds/beaglebone:green:usr0/trigger; sleep .25; echo timer > /sys/devices/platform/leds/leds/beaglebone:green:usr1/trigger; sleep .25; echo timer > /sys/devices/platform/leds/leds/beaglebone:green:usr2/trigger; sleep .25; echo timer > /sys/devices/platform/leds/leds/beaglebone:green:usr3/trigger

echo heartbeat > /sys/devices/platform/leds/leds/beaglebone:green:usr0/trigger; sleep .25; echo heartbeat > /sys/devices/platform/leds/leds/beaglebone:green:usr1/trigger; sleep .25; echo heartbeat > /sys/devices/platform/leds/leds/beaglebone:green:usr2/trigger; sleep .25; echo heartbeat > /sys/devices/platform/leds/leds/beaglebone:green:usr3/trigger

echo heartbeat > /sys/devices/platform/leds/leds/beaglebone:green:usr0/trigger; echo heartbeat > /sys/devices/platform/leds/leds/beaglebone:green:usr1/trigger; echo heartbeat > /sys/devices/platform/leds/leds/beaglebone:green:usr2/trigger; echo heartbeat > /sys/devices/platform/leds/leds/beaglebone:green:usr3/trigger



https://docs.chef.io/handlers.html#chef-infra-client
