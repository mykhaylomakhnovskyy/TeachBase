# frozen_string_literal: true

# Quadratic equation. The user enters 3 coefficients a, b and c. The program calculates
# the discriminant (D) and roots of the equation (x1 and x2, if any) and displays the
# values of the discriminant and roots on the screen. In this case, the following options
# are possible: If D> 0, then print the discriminant and 2 roots If D = 0, then print the
# discriminant and 1 root (since they are equal in this case) If D <0, then print the
# discriminant and the message " No roots "
puts 'Enter first coefficient:'
a = gets.chomp.to_i
puts 'Enter second coefficient:'
b = gets.chomp.to_i
puts 'Enter third coefficient:'
c = gets.chomp.to_i

disc = (b**2) - (4 * a * c)
sqr_disc = Math.sqrt(disc)
if disc.negative?
  puts "Discriminant: #{disc}, No roots"
elsif disc.zero?
  root = -1 * b / 2 * a
  puts "Discriminant: #{disc}, Root: #{root}"
else
  root1 = (-1 * b + sqr_disc) / (2 * a)
  root2 = (-1 * b - sqr_disc) / (2 * a)
  puts "Discriminant: #{disc}, Roots: #{root1}, #{root2}"
end
