# frozen_string_literal: true

# Right triangle. The program asks the user for 3 sides of the triangle and determines
# whether the triangle is rectangular using the Pythagorean theorem (www-formula.ru) and
# displays the result on the screen. Also, if the triangle is at the same time isosceles
# (that is, it has any 2 sides equal), then additional information is displayed that the
# triangle is also isosceles. Hint: to use the Pythagorean theorem, you must first find
# the longest side (hypotenuse) and compare its value squared with the sum of the squares
# of the other two sides. If all 3 sides are equal, then the triangle is isosceles and
# equilateral, but not right-angled.

puts 'Enter 1 side:'
a = gets.chomp.to_i
puts 'Enter 2 side'
b = gets.chomp.to_i
puts 'Enter 3 side'
c = gets.chomp.to_i

if a**2 == b**2 + c**2 || b**2 == a**2 + c**2 || c**2 == b**2 + a**2
  puts 'It is right triangle'
else
  puts 'It is not right triangle'
end
if a == b || a == c || b == c
  puts 'It is isosceles triangle'
elsif a == b && a == c
  puts 'It is equilateral triangle'
end
