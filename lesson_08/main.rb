# frozen_string_literal: true

require_relative 'station'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'carriage'
require_relative 'cargo_carriage'
require_relative 'passenger_carriage'

menu = proc do
  puts '+--------Please choose one of these:--------+'
  puts '| 1. Create a new station(1).               |'
  puts '| 2. Create a new train(2).                 |'
  puts '| 3. Add a carriage to the train(3).        |'
  puts '| 4. Delete a carriage from the train(4).   |'
  puts '| 5. Put a train on the station(5).         |'
  puts '| 6. Display stations and trains on them(6).|'
  puts '| 7. Display stations, trains and carriages |'
  puts '+-----Press any other key to EXIT menu.-----+'
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
  puts 'Enter a number of a carriage you want to add:'
  carriage_number = gets.chomp
  begin
    Train.find(train_number).pin_carriage(carriage_number, 30)
  rescue RuntimeError => e
    puts "Fix and try again!\n#{e.message}"
  end
end
case4 = proc do
  puts 'Enter a number of the train you want to delete carriage from:'
  train_number = gets.chomp
  puts 'Enter a number of the carriage you want to delete:'
  carriage_id = gets.chomp.to_i
  train = Train.find(train_number)
  train.unpin_carriage(carriage_id)
end
case5 = proc do
  puts 'Enter a number of the train:'
  train_number = gets.chomp
  puts 'Enter a name of the station:'
  station_name = gets.chomp
  train = Train.find(train_number)
  station = Station.find(station_name)
  station.take_train(train) unless train.nil? || station.nil?
end
case6 = proc { Station.all.each(&:show_all_trains) }
case7 = proc do
  Station.all.each do |station|
    puts "On the #{station.name} station:"
    station.each_train do |train|
      puts "  Train number: #{train.number}. Type: #{train.class}. Amount of carriages: #{train.amount_of_carriages}"
      train.each_carriage do |carriage|
        print "    Carriage number: #{carriage.carriage_number}. Type: #{carriage.class}. "
        if carriage.instance_of?(CargoCarriage)
          puts "Empty volume: #{carriage.empty_volume}. Occupied volume: #{carriage.occupied_volume}"
        else
          puts "Empty places: #{carriage.empty_places_amount}. Occupied places: #{carriage.occupied_places_amount}"
        end
      end
    end
  end
end

CHOICES = { 1 => case1, 2 => case2, 3 => case3, 4 => case4, 5 => case5,
            6 => case6, 7 => case7 }.freeze

loop do
  menu.call
  choice = gets.chomp.to_i
  begin
    CHOICES[choice].call
  rescue NoMethodError
    puts 'Bye-bye!'
    break
  end
end

train1 = CargoTrain.new('123-11')
train2 = CargoTrain.new('123-22')
train3 = CargoTrain.new('123-33')
train4 = PassengerTrain.new('123-44')
station1 = Station.new('Kharkiv')
station2 = Station.new('Kiev')
station1.take_train(train1)
station1.take_train(train2)
station1.take_train(train3)
station2.take_train(train4)
train1.pin_carriage('1', 50)
train1.pin_carriage('2', 50)
train2.pin_carriage('3', 50)
train4.pin_carriage('1', 45)
case7.call
Train.instances
Carriage.instances
