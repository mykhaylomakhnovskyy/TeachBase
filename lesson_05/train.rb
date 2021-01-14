# frozen_string_literal: true

require_relative 'instance_counter'
require_relative 'manufacturer'
# Train
class Train
  include Manufacturer
  include InstanceCounter
  attr_reader :number, :type, :carriages
  attr_accessor :company

  @@trains = []
  @@total_instances = 0
  def initialize(number)
    @number = number
    @speed = 0
    @carriages = []
    @@trains.push(self)
    @current_station = -1
    register_instance
  end

  protected

  def speed_up(speed)
    @speed += speed
  end

  def self.total_instances
    @@total_instances
  end

  def self.total_instances=(total_instances)
    @@total_instances = total_instances
  end

  def slow_down
    @speed = 0
  end

  def amount_of_carriages
    @carriages.size
  end

  public

  def self.find(train_number)
    @@trains.each { |train| return train if train.number == train_number }
  end

  def current_speed
    @speed
  end

  def take_route(route)
    @route = route
  end

  def follow_the_route
    if @current_station >= 0 && @current_station < @route.stations.size - 1
      @route.stations[@current_station].send_train(self)
      @current_station += 1
      puts 'Moving to the next station!'
    else
      @current_station += 1
      puts 'Starting our route!'
    end
    @route.stations[@current_station].take_train(self)
    puts "It is #{@route.stations[@current_station].name}"
  end

  def show_nearby_stations
    puts "Previous station: #{@route.stations[@current_station - 1].name}" if @current_station.positive?
    puts "Next station: #{@route.stations[@current_station + 1].name}" if @current_station < @route.stations.size - 1
  end
end
