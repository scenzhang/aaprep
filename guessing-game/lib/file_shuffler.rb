def file_shuffler
  puts 'file name?'
  filename = gets.chomp
  f_contents = File.readlines(filename)
  f_contents.map!(&:chomp)
  f_contents.shuffle!
  new_f = File.open("#{filename}-shuffled.txt", "w")
  f_contents.each { |line| new_f.puts line }
end 

if $PROGRAM_NAME == __FILE__
  file_shuffler
end