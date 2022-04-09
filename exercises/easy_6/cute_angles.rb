DEGREE = "\xC2\xB0"

def get_minutes_and_seconds(float)
  minutes = (float * 60).floor
  seconds = (((float * 60) - minutes) * 60).round
  return minutes, seconds
end

def dms(float)
  degrees = float.floor
  minutes, seconds = get_minutes_and_seconds(float - degrees)
  output = "#{degrees}#{DEGREE}#{sprintf("%02d", minutes)}'#{sprintf("%02d", seconds)}\""
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")