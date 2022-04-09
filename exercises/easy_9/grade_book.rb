def get_grade(grade1, grade2, grade3)
  average = (grade1 + grade2 + grade3) / 3
  if average >= 90 
    grade = "A"
  elsif average >= 80
    grade = "B"
  elsif average >= 70
    grade = "C"
  elsif average >= 60
    grade = "D"
  else
    grade = "F"
  end 
  grade
end


p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"