# frozen_string_literal: true

# Station
class Station
  attr_reader :name

  STATION_NAME_FORMAT = /^\D{3,9}$/i.freeze
  @@stations = []
  def initialize(name)
    @name = name
    @trains = []
    validate!
    @@stations.push(self)
  end

  def take_train(train)
    @trains.push(train)
  end

  def send_train(train)
    @trains.delete(train)
  end

  def show_all_trains
    puts "On the #{@name} station:"
    @trains.each { |train| puts "  Train number: #{train.number}" }
  end

  def self.find(station_name)
    @@stations.each { |station| return station if station.name == station_name }
  end

  def self.all
    @@stations
  end

  def validate!
    raise 'The name of station is too short!' if @name.length < 3
    raise 'The name of station is too long' if @name.length > 9
    raise 'The name of station can\'t be nil!' if @name.nil?
    raise 'You can use only English characters! Digits are not allowed!' if @name !~ STATION_NAME_FORMAT
  end
end
