# frozen_string_literal: true

require_relative 'Modules/validation'
# Station
class Station
  include Validation
  attr_reader :name

  STATION_NAME_FORMAT = /^\D{3,9}$/i.freeze
  def initialize(name)
    @name = name
    @trains = []
    validate!(:@name, /^\D{3,9}$/i.freeze, name.class)
    self.class.stations_push(self)
  end

  def take_train(train)
    @trains.push(train)
  end

  def send_train(train)
    @trains.delete(train)
  end

  def each_train(&block)
    @trains.each(&block)
  end

  def show_all_trains
    puts "On the #{@name} station:"
    @trains.each { |train| puts "  Train number: #{train.number}" }
  end

  def self.find(station_name)
    @stations.each { |station| return station if station.name == station_name }
  end

  def self.all
    @stations
  end

  def self.stations_push(station)
    @stations ||= []
    @stations << station
  end
end
