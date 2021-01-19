# frozen_string_literal: true

require_relative 'station'
require_relative 'Trains/passenger_train'
require_relative 'Trains/cargo_train'
require_relative 'Carriages/carriage'

menu = proc do
  puts 'Hi there! Please choose one of these:'
  puts '1. Create a new station(1).'
  puts '2. Create a new train(2).'
  puts '3. Add a carriage to the train(3).'
  puts '4. Delete a carriage from the train(4).'
  puts '5. Put a train on the station(5).'
  puts '6. Display stations and trains on them(6).'
  puts 'Press any other key to EXIT menu.'
end
case1 = proc do
  begin
    puts 'Enter a name of a new station:'
    station_name = gets.chomp
    Station.new(station_name)
  rescue RuntimeError => e
    puts "Try again.\n#{e.message}"
  end
end
case2 = proc do
  begin
    puts 'Enter a number of a new train(###-##):'
    train_number = gets.chomp
    puts 'Enter a type of a new train(cargo/passenger):'
    train_type = gets.chomp
    if train_type == 'cargo'
      CargoTrain.new(train_number)
    else
      PassengerTrain.new(train_number)
    end
  rescue RuntimeError => e
    puts "Again, please!\n#{e.message}"
  end
end
case3 = proc do
  puts 'Enter a number of a train you want to add carriage to:'
  train_number = gets.chomp
  puts 'Enter a number of a carriage you want to add, a type of the carriage and amount of seats/volume:'
  carriage_number = gets.chomp
  train_type = gets.chomp
  size = gets.chomp.to_i
  begin
    train = train_type == 'passenger' ? PassengerTrain.find(train_number) : CargoTrain.find(train_number)
    train.pin_carriage(carriage_number, size)
  rescue RuntimeError => e
    puts "Fix and try again!\n#{e.message}"
  end
end
case4 = proc do
  puts 'Enter a number of the train you want to delete carriage from:'
  train_number = gets.chomp
  puts 'Enter a number of the carriage you want to delete:'
  carriage_id = gets.chomp.to_i
  puts 'Enter a type of the carriage'
  train_type = gets.chomp
  begin
    train = train_type == 'passenger' ? PassengerTrain.find(train_number) : CargoTrain.find(train_number)
    train.unpin_carriage(carriage_id)
  rescue RuntimeError => e
    puts "Fix and try again!\n#{e.message}"
  end
end
case5 = proc do
  puts 'Enter a number of the train, type of train and a name of the station, separating with ENTER:'
  train_number = gets.chomp
  train_type = gets.chomp
  station_name = gets.chomp
  begin
    train = train_type == 'passenger' ? PassengerTrain.find(train_number) : CargoTrain.find(train_number)
    station = Station.find(station_name)
    station.take_train(train) unless train.nil? || station.nil?
  rescue RuntimeError => e
    puts "Fix and try again!\n#{e.message}"
  end
end
case6 = proc { Station.all.each(&:show_all_trains) }

loop do
  menu.call
  choice = gets.chomp.to_i
  case choice
  when 1
    case1.call
  when 2
    case2.call
  when 3
    case3.call
  when 4
    case4.call
  when 5
    case5.call
  when 6
    case6.call
  else
    break
  end
end

CargoTrain.instances
Carriage.instances
