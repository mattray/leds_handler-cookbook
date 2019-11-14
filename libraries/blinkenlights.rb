require 'mixlib/shellout'

module HandlerLED
  class Blinkenlights

    def lights_flashing()
      Mixlib::ShellOut.new("echo FLASHING > /tmp/lights_flashing_start").run_command
    end

    def lights_on()
      Mixlib::ShellOut.new("echo ON > /tmp/lights_on_failed").run_command
    end

    def lights_off()
      Mixlib::ShellOut.new("echo OFF > /tmp/lights_off_succeeded").run_command
    end

  end
end
