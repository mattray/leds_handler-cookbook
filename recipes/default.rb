#
# Cookbook:: leds_handler
# Recipe:: default
#

# because we're loading this from a cookbook, it's available after compilation
Chef.event_handler do
  on :converge_start do
    HandlerLED::Blinkenlights.new.lights_flashing()
  end
end

Chef.event_handler do
  on :run_completed do
    HandlerLED::Blinkenlights.new.lights_off()
  end
end

Chef.event_handler do
  on :run_failed do
    HandlerLED::Blinkenlights.new.lights_on()
  end
end

# ruby_block 'fail the run' do
#   block do
#     fail 'deliberately fail the run'
#   end
# end
