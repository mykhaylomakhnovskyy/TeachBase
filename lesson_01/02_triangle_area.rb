# frozen_string_literal: true

# Area of a triangle. The area of a triangle can be calculated by knowing its base (a) and
# height (h) by the formula: 1/2 * a * h. The program should query the base and height of
# the triangle and return its area.
puts 'Enter a:'
a = gets.chomp.to_i
puts 'Enter h'
h = gets.chomp.to_i
area = 0.5 * a * h
puts area
