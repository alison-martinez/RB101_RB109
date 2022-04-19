def letter_percentages(string)
  hsh_total = {lowercase: 0, uppercase: 0, neither: 0}
  string.each_char do |char|
    if char =~ /[a-z]/
      hsh_total[:lowercase] += 1
    elsif char =~ /[A-Z]/
      hsh_total[:uppercase] += 1
    else
      hsh_total[:neither] += 1
    end
  end
  hsh_total.map {|k, v| [k, (v.to_f / string.length)*100]}.to_h
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }