# frozen_string_literal: true

# Площадь треугольника. Площадь треугольника можно вычилсить,
# зная его основание (a) и высоту (h) по формуле: 1/2*a*h.
# Программа должна запрашивать основание и высоту треуголиника
# и возвращать его площадь.
puts 'Enter a:'
a = gets.chomp.to_i
puts 'Enter h'
h = gets.chomp.to_i
area = 0.5 * a * h
puts area
