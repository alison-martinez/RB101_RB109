require 'date'

MONTHS = (1..12).to_a

def friday_13th(year)
  fridays = 0
  MONTHS.each { |month| fridays += 1 if Date.new(year,month,13).friday? }
  return fridays
end


p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2