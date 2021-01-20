# frozen_string_literal: true

# Fill the array with numbers from 10 to 100 with step of 5

arr = []
num = 10
i = 0
while num < 100
  arr[i] = num
  num += 5
  i += 1
end
puts arr
