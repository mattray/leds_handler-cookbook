require 'mixlib/shellout'

module HandlerLED
  class Blinkenlights
    def lights_flashing
      # raspberry pi and similar devices
      stdout = Mixlib::ShellOut.new('ls /sys/devices/platform/leds/leds').run_command.stdout
      unless stdout.empty?
        leds = stdout.split
        sleep = 1.0 / leds.length
        leds.each do |led|
          Mixlib::ShellOut.new("echo heartbeat > /sys/devices/platform/leds/leds/#{led}/trigger").run_command
          Mixlib::ShellOut.new("sleep #{sleep}").run_command
        end
      else # Mac laptops running Linux?
        max = Mixlib::ShellOut.new('cat /sys/class/leds/smc::kbd_backlight/max_brightness').run_command.stdout
        unless max.empty?
          Mixlib::ShellOut.new("echo #{max} > /sys/class/leds/smc::kbd_backlight/brightness").run_command
          Mixlib::ShellOut.new("sleep 1").run_command
          Mixlib::ShellOut.new("echo #{max.to_i/2} > /sys/class/leds/smc::kbd_backlight/brightness").run_command
          Mixlib::ShellOut.new("sleep 1").run_command
          Mixlib::ShellOut.new("echo #{max.to_i/3} > /sys/class/leds/smc::kbd_backlight/brightness").run_command
        end
      end
    end

    def lights_on
      stdout = Mixlib::ShellOut.new('ls /sys/devices/platform/leds/leds').run_command.stdout
      unless stdout.empty?
        leds = stdout.split
        leds.each do |led|
          Mixlib::ShellOut.new("echo default-on > /sys/devices/platform/leds/leds/#{led}/trigger").run_command
        end
      else
        max = Mixlib::ShellOut.new('cat /sys/class/leds/smc::kbd_backlight/max_brightness').run_command.stdout
        unless max.empty?
          Mixlib::ShellOut.new("echo #{max} > /sys/class/leds/smc::kbd_backlight/brightness").run_command
        end
      end
    end

    def lights_off
      stdout = Mixlib::ShellOut.new('ls /sys/devices/platform/leds/leds').run_command.stdout
      unless stdout.empty?
        leds = stdout.split
        leds.each do |led|
          Mixlib::ShellOut.new("echo none > /sys/devices/platform/leds/leds/#{led}/trigger").run_command
        end
      else
        max = Mixlib::ShellOut.new('cat /sys/class/leds/smc::kbd_backlight/max_brightness').run_command.stdout
        unless max.empty?
          Mixlib::ShellOut.new("echo #{max} > /sys/class/leds/smc::kbd_backlight/brightness").run_command
          Mixlib::ShellOut.new("sleep 1").run_command
          Mixlib::ShellOut.new("echo 0 > /sys/class/leds/smc::kbd_backlight/brightness").run_command
        end
      end
    end
  end
end
