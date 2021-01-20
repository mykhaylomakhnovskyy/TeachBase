# frozen_string_literal: true

# Fill the array with Fibonacci numbers up to 100
arr = []
num = 1
i = 0
while num < 100
  arr[i] = num
  num += arr[i - 1] if i.positive?
  i += 1
end
puts arr
