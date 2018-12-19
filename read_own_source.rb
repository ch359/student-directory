print "Aide-memoire:\n\n"
puts "__FILE__ is the magic variable that contains the name of the current file."
puts "$0 is the name of the file used to start the program."
puts "Checking whether they are equal allows us to determine if the file is being run direcly, or as part of a larger program."
print "\n\n"
puts "The contents of the file #{__FILE__} are shown below:"
print "\n\n"
puts "----------"
print "\n"
File.open(__FILE__, "r") do |file|
  file.readlines.each { |line| puts line}
end
print "\n"
puts "----------"
