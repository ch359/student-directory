def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  cohorts = ["january", "february", "march", "april", "june", "july", "august", "september",
            "october", "november", "december"]
  # get the first name
  name = gets.chomp

  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    puts "Please enter a hobby:"
    hobby = gets.chomp
    puts "Please enter a cohort"
    cohort = gets.chomp

    if !cohorts.include?(cohort.downcase)
      cohort = "november"
    end

    students << {name: name, cohort: cohort.to_sym, hobby: hobby}
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Please enter a name:"
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_by_cohort(students)
  student_cohorts = get_cohorts(students)
  student_cohorts.each do
    
  end

def print(students)


  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort). Hobby: #{student[:hobby]}".center(80)
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def get_cohorts(student_array)
  student_cohorts = []
  student_array.each do |student|
    if !student_cohorts.include?(student[:cohort])
      student_cohorts.push()
    end

end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)
