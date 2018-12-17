# create an empty array
@students = []

COHORTS =  ["january", "february", "march", "april", "may", "june", "july", "august", "september",
            "october", "november", "december"]

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  loop do
    name = get_name
    break if name.empty?
    cohort = get_cohort
    add_name_and_cohort(name, cohort)
    puts "Now we have #{@students.count} students"
  end
end

def get_name
  puts "Please enter name:"
  STDIN.gets.chomp
end

def get_cohort
  puts "Please enter a cohort:"
  validate_cohort(STDIN.gets.chomp)
end

def validate_cohort(cohort)
  if !COHORTS.include?(cohort.downcase)
    return "november"
  end
  cohort
end

def print_header
  puts "The students of Villains' Academy"
  puts "-------------"
end

def print_students
  @students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort).".center(80)
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

def interactive_menu
  loop do
    print_menu
    menu_choices(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list (default: students.csv)"
  puts "4. Load the list (default: students.csv)"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_students
  print_footer
end

def save_students(filename = "students.csv")
  File.open(filename, "w") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
end

def load_students(filename = "students.csv")
  File.open(filename, "r") do |file|
    file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_name_and_cohort(name, cohort)
    end
  end
end

def add_name_and_cohort(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def try_load_students(filename = ARGV.first)
  return if filename.nil?
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def ask_filename
  puts "Please enter the (relative) filename you wish to use, followed by enter"
  file = STDIN.gets.chomp
  return "students.csv" if file == ""
  file
end

def menu_choices(selection)
  case selection
  when "1"
      puts "Selected Option 1"
      input_students
  when "2"
      puts "Selected Option 2"
      show_students
  when "3"
      puts "Selected Option 3"
      save_students(ask_filename)
  when "4"
      puts "Selected Option 4"
      try_load_students(ask_filename)
  when "9"
      puts "Quitting the program"
      exit
    else
    puts "I don't know what you meant, try again"
  end
end

interactive_menu
