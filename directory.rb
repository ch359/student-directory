COHORTS =  ["january", "february", "march", "april", "june", "july", "august", "september",
            "october", "november", "december"]

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []

  # get the first name
  name = gets.chomp

  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    puts "Please enter a hobby:"
    hobby = gets.chomp
    puts "Please enter a cohort"
    cohort = gets.chomp

    if !COHORTS.include?(cohort.downcase)
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

def print_students_by_cohort(students)
  get_cohorts(students).each do |cohort, names|
    print "\n#{cohort} cohort students: "
    names.each { |name| print "#{name}, "}
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort). Hobby: #{student[:hobby]}".center(80)
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def get_cohorts(student_array)
  student_cohorts = {}
  student_array.each do |student|
    if student_cohorts.has_key?(student[:cohort])
      student_cohorts[student[:cohort]].push(student[:name])
    else
      student_cohorts[student[:cohort]] = [student[:name]]
    end
  end
  student_cohorts
end

students = input_students
#nothing happens until we call the methods
print_header
print_students(students)
print_footer(students)
print_students_by_cohort(students)
