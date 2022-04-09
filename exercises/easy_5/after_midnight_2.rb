MINS_PER_HOUR = 60
HOURS_PER_DAY = 24
MINS_PER_DAY = MINS_PER_HOUR * HOURS_PER_DAY

def after_midnight(time)
  time_array = time.split(":")
  hour = time_array[0].to_i
  minute = time_array[1].to_i
  time_after_midnight = (hour * MINS_PER_HOUR) + minute
  if time_after_midnight >= MINS_PER_DAY
    time_after_midnight -= MINS_PER_DAY
  end
  time_after_midnight
end

def before_midnight(time)
  time_array = time.split(":")
  hour = time_array[0].to_i
  minute = time_array[1].to_i
  time_before_midnight = MINS_PER_DAY - ((hour * MINS_PER_HOUR) + minute)
  if time_before_midnight >= MINS_PER_DAY
    time_before_midnight -= MINS_PER_DAY
  end
  time_before_midnight
end


p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0

