# create an empty array
@students = []

COHORTS =  ["january", "february", "march", "april", "june", "july", "august", "september",
            "october", "november", "december"]

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  # get the first name
  name = gets.chomp

  # while the name is not empty, repeat this code
  until name.empty? do
    # add the student hash to the array
    puts "Please enter a hobby:"
    hobby = gets.chomp
    puts "Please enter a cohort"
    cohort = gets.chomp

    if !COHORTS.include?(cohort.downcase)
      cohort = "november"
    end

    @students << {name: name, cohort: cohort.to_sym, hobby: hobby}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    puts "Please enter a name:"
    name = gets.chomp
  end
end

def print_students_by_cohort
  get_cohorts(@students).each do |cohort, names|
    print "\n#{cohort} cohort students: "
    names.each { |name| print "#{name}, "}
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students
  @students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort). Hobby: #{student[:hobby]}".center(80)
  end
end

def print_footer
  student_count = @students.count
  if student_count == 1
    puts "Overall, we have #{student_count} great student."
  else
   puts "Overall, we have #{student_count} great students"
  end
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

def interactive_menu

  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # 9 because we'll be adding more items
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when "1"
      input_students
    when "2"
      print_header
      print_students
      print_footer
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
  end
end

interactive_menu
#nothing happens until we call the methods
