# frozen_string_literal: true

# The amount of purchases. The user alternately enters the name of the
# product, the unit price and the quantity of the purchased product (can
# be a non-integer number). The user can enter an arbitrary number of
# products until he enters "stop" as the name of the product. Based on the
# entered data, the following is required:
# 1) Fill in and display a hash, the keys of which are the names of the goods, and
# the value is a nested hash containing the price per unit of the goods and the
# quantity of the purchased goods. Also display the total amount for each item.
# 2) Calculate and display the total of all purchases in the "shopping cart" .se
products = {}

loop do
  puts 'Please, enter a name of the product:'
  product_name = gets.chomp.downcase.capitalize
  break if product_name == 'Stop'

  puts "Please, enter a prize of 1 #{product_name}:"
  product_price = gets.chomp.to_f
  puts "Please, enter an amount of #{product_name}s:"
  product_amount = gets.chomp.to_f
  products[product_name] = { product_price => product_amount }
end
total_all = 0
products.each do |name, prices|
  prices.each do |price, amount|
    total_this = price * amount
    total_all += total_this
    puts "#{name}: #{price} dollars, #{amount} kilos. Total amount: #{total_this} dollars"
  end
end
puts "TOTAL AMOUNT: #{total_all} dollars"
