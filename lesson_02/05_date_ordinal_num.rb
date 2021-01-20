# frozen_string_literal: true

# Three numbers are given, which denote the day, month, year (we ask the user).
# Find the ordinal number of the date starting from the beginning of the year.
# Please note that the year can be a leap year.
months = { 1 => 31, 2 => 28, 3 => 31, 4 => 30, 5 => 31, 6 => 30, 7 => 31,
           8 => 31, 9 => 30, 10 => 31, 11 => 30, 12 => 31 }
day = gets.chomp.to_i
month = gets.chomp.to_i
year = gets.chomp.to_i
months[2] = 29 if (year % 4).zero? && (year % 100).nonzero? || (year % 400).zero?
i = 1

ordinal_number = day
(month - 1).times do
  ordinal_number += months[i]
  i += 1
end
puts ordinal_number
