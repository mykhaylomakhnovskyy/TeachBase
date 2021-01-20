# frozen_string_literal: true

require_relative 'station'
require_relative 'passenger_train'
require_relative 'cargo_train'
stations = []
trains = []
loop do
  puts 'Hi there! Please choose one of these:'
  puts '1. Create a new station(1).'
  puts '2. Create a new train(2).'
  puts '3. Add a carriage to the train(3).'
  puts '4. Delete a carriage from the train(4).'
  puts '5. Put a train on the station(5).'
  puts '6. Display stations and trains on them(6).'

  choice = gets.chomp.to_i

  case choice
  when 1
    puts 'Enter a name of a new station:'
    station_name = gets.chomp
    stations.push(Station.new(station_name))
  when 2
    puts 'Enter a number of a new train:'
    train_number = gets.chomp
    puts 'Enter a type of a new train(cargo/passenger):'
    train_type = gets.chomp
    if train_type == 'cargo'
      trains.push(CargoTrain.new(train_number))
    else
      trains.push(PassengerTrain.new(train_number))
    end
  when 3
    puts 'Enter a number of a train you want to add carriage to:'
    train_number = gets.chomp
    trains.each do |train|
      train.pin_carriage if train.number == train_number
    end
  when 4
    puts 'Enter a number of the train you want to delete carriage from:'
    train_number = gets.chomp
    puts 'Enter a number of the carriage you want to delete:'
    carriage_id = gets.chomp.to_i
    trains.each do |train|
      train.unpin_carriage(carriage_id) if train.number == train_number
    end
  when 5
    puts 'Enter a number of the train:'
    train_number = gets.chomp
    puts 'Enter a name of the station:'
    station_name = gets.chomp
    stations.each do |station|
      trains.each { |train| station.take_train(train) if train.number == train_number && station.name == station_name }
    end
  when 6
    stations.each(&:show_all_trains)
  else
    break
  end
end
