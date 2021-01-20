# frozen_string_literal: true

require_relative '../Modules/instance_counter'
require_relative '../Modules/manufacturer'
# Train
class Train
  include Manufacturer
  include InstanceCounter
  attr_reader :number, :type, :carriages
  attr_accessor :company

  TRAIN_NUMBER_FORMAT = /^[a-f0-9]{3}+-*[a-f0-9]{2}$/i.freeze
  def initialize(number)
    @number = number
    @speed = 0
    @carriages = []
    self.class.trains_push(self)
    @current_station = -1
    validate!
    register_instance
  end

  def speed_up(speed)
    @speed += speed
  end

  def self.trains_push(train)
    @trains ||= []
    @trains << train
  end

  def self.total_instances
    @total_instances ||= 0
  end

  class << self
    attr_writer :total_instances
  end

  protected

  def slow_down
    @speed = 0
  end

  def validate!
    raise 'Number can\'t be nil' if number.nil?
    raise 'Number has invalid format' if number !~ TRAIN_NUMBER_FORMAT

    true
  end

  def amount_of_carriages
    @carriages.size
  end

  public

  def valid?
    validate!
  rescue RuntimeError
    false
  end

  def self.find(train_number)
    @trains.each { |train| return train if train.number == train_number }
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
