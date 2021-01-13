# frozen_string_literal: true

# Station
class Station
  attr_reader :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def take_train(train)
    @trains.push(train)
  end

  def send_train(train)
    @trains.delete(train)
  end

  def show_all_trains
    puts "On the #{@name} station:"
    @trains.each { |train| puts "Train number: #{train.number}" }
  end

  def show_all_train_types
    freight_trains = 0
    pass_trains = 0
    @trains.each do |train|
      if train.type == 1
        pass_trains += 1
      else
        freight_trains += 1
      end
    end
    puts "Freight trains: #{freight_trains}\nPassenger trains: #{pass_trains}"
  end
end

# Route
class Route
  attr_reader :stations

  def initialize(start_station, final_station)
    @stations = [start_station, final_station]
  end

  def add_middle_station(station)
    @stations.insert(1, station)
  end

  def delete_middle_station(station)
    if station != @stations[0] && station != @stations[@stations.size - 1]
      @stations.delete(station)
    else
      puts 'You can\'t delete first or last station!'
    end
  end

  def show_all_stations
    @stations.each do |station|
      puts station.name
    end
  end
end

# Train
class Train
  attr_reader :number, :type

  def initialize(number, type, carriages = 2)
    @number = number
    @type = type
    @speed = 0
    @carriages = carriages
    @current_station = -1
  end

  def speed_up(speed)
    @speed += speed
  end

  def current_speed
    @speed
  end

  def slow_down
    @speed = 0
  end

  def amount_of_carriages
    @carriages
  end

  def pin_carriage
    if @speed.zero?
      @carriages += 1
    else
      puts 'You are moving too fast to pin a carriage! Slow down!'
    end
  end

  def unpin_carriage
    @carriages -= 1
  end

  def take_route(route)
    @route = route
  end

  def current_station
    if @current_station >= 0 && @current_station < @route.stations.size - 1
      @route.stations[@current_station].send_train(self)
      puts 'Moving to the next station!'
      @current_station += 1
    elsif @current_station == @route.stations.size - 1
      puts 'It is the last station!'
      @current_station
    else
      @current_station += 1
    end
  end

  def follow_the_route
    @route.stations[current_station].take_train(self)
    puts "It is #{@route.stations[current_station].name}"
  end

  def show_nearby_stations
    puts "Previous station: #{@route.stations[@current_station - 1].name}" if @current_station.positive?
    puts "Next station: #{@route.stations[@current_station + 1].name}" if @current_station < @route.stations.size - 1
  end
end

train1 = Train.new(124_256, 1)
train2 = Train.new(124_273, 2)

station1 = Station.new('Lyubotin')
station2 = Station.new('Kharkov')
station3 = Station.new('Kiev')
station4 = Station.new('Poltava')

route1 = Route.new(station2, station3)
route1.add_middle_station(station4)
route1.add_middle_station(station1)

route2 = Route.new(station3, station4)

train2.take_route(route2)
train1.take_route(route1)

route1.show_all_stations

train1.follow_the_route
train1.show_nearby_stations
train1.follow_the_route
train1.show_nearby_stations
train1.follow_the_route

station4.show_all_trains
train1.show_nearby_stations
train1.follow_the_route
route1.delete_middle_station(station2)
route1.delete_middle_station(station4)
route1.show_all_stations
