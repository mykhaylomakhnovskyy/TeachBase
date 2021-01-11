# frozen_string_literal: true

# Квадратное уравнение. Пользователь вводит 3 коэффициента a, b и с.
# Программа вычисляет дискриминант (D) и корни уравнения (x1 и x2, если они есть) и
# выводит значения дискриминанта и корней на экран. При этом возможны следующие варианты:
# Если D > 0, то выводим дискриминант и 2 корня
# Если D = 0, то выводим дискриминант и 1 корень (т.к. они в этом случае равны)
# Если D < 0, то выводим дискриминант и сообщение "Корней нет"
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
