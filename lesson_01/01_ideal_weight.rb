# frozen_string_literal: true

# Ideal weight. Program asks user's name and height - outputs ideal weight according to
# the formula <height> - 110, and finally displays the result with a call by name.
# If the result is negative, the output should be: "Your weight is already ideal!"

puts 'Enter your name:'
name = gets.chomp
puts 'Enter your height:'
height = gets.chomp
weight = height.to_i - 110
if weight.positive?
  puts "#{name}, your ideal weight is #{height.to_i - 110}"
else
  puts "#{name}, your  weight is ideal already!"
end
