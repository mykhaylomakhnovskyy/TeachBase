# Идеальный вес. Программа запрашивает у пользователя имя и рост и выводит идеальный вес по формуле
# <рост> - 110, после чего выводит результат пользователю на экран с обращением по имени.
# Если идеальный вес получается отрицательным, то выводится строка "Ваш вес уже оптимальный"

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
