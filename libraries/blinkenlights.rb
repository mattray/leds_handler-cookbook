require 'mixlib/shellout'

module HandlerLED
  class Blinkenlights
    def lights_flashing
      stdout = Mixlib::ShellOut.new('ls /sys/devices/platform/leds/leds').run_command.stdout
      unless stdout.nil?
        leds = stdout.split
        sleep = 1.0 / leds.length
        leds.each do |led|
          Mixlib::ShellOut.new("echo heartbeat > /sys/devices/platform/leds/leds/#{led}/trigger").run_command
          Mixlib::ShellOut.new("sleep #{sleep}").run_command
        end
      end
    end

    def lights_on
      stdout = Mixlib::ShellOut.new('ls /sys/devices/platform/leds/leds').run_command.stdout
      unless stdout.nil?
        leds = stdout.split
        leds.each do |led|
          Mixlib::ShellOut.new("echo default-on > /sys/devices/platform/leds/leds/#{led}/trigger").run_command
        end
      end
    end

    def lights_off
      stdout = Mixlib::ShellOut.new('ls /sys/devices/platform/leds/leds').run_command.stdout
      unless stdout.nil?
        leds = stdout.split
        leds.each do |led|
          Mixlib::ShellOut.new("echo none > /sys/devices/platform/leds/leds/#{led}/trigger").run_command
        end
      end
    end
  end
end
