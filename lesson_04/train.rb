# frozen_string_literal: true

# Train
class Train
  attr_reader :number, :type, :carriages

  def initialize(number)
    @number = number
    @speed = 0
    @carriages = []
    @current_station = -1
  end

  protected

  def speed_up(speed)
    @speed += speed
  end

  def slow_down
    @speed = 0
  end

  def amount_of_carriages
    @carriages.size
  end

  public

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
