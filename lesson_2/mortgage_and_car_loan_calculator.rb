def prompt(message)
  puts "==> #{message}"
end

def validate_num?(num)
  num.to_f.to_s == num || num.to_i.to_s == num
end

loan_amount = ''
annual_percentage_rate = ''
loan_duration_in_years = ''

loop do
  prompt("Please enter the loan amount: ")
  loan_amount = gets.chomp.gsub(/[\$\,]/, '')
  break if validate_num?(loan_amount)
  prompt("That doesn't look like a valid loan amount.")
end

loop do
  prompt("Please enter the APR (\%): ")
  annual_percentage_rate = gets.chomp
  break if validate_num?(annual_percentage_rate) && annual_percentage_rate.to_f > 1
  prompt("That doesn't look like a valid APR.")
end

loop do
  prompt("Please enter the loan duration (in years):")
  loan_duration_in_years = gets.chomp
  break if validate_num?(loan_duration_in_years)
  prompt("That doesn't look like a valid loan duration.")
end

loan_duration_in_months = loan_duration_in_years.to_f * 12
monthly_interest_rate = annual_percentage_rate.to_f / 100 / 12
monthly_payment = loan_amount.to_f * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-loan_duration_in_months)))

puts "Your monthly payment is \$#{monthly_payment.round(2)} per month for #{loan_duration_in_months.to_i} months."
