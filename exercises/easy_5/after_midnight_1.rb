MINS_PER_HOUR = 60
HOURS_PER_DAY = 24

def time_of_day(min)
  neg_flag = min <=> 0

  if min.abs > MINS_PER_HOUR * HOURS_PER_DAY
    min = (min % (MINS_PER_HOUR * HOURS_PER_DAY)) 
  end
 
  min = HOURS_PER_DAY * MINS_PER_HOUR + min if min < 0
  hour, minute = min.divmod(MINS_PER_HOUR)
  time = hour.to_s.rjust(2, "0") + ":" + minute.to_s.rjust(2,"0")


end


p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

