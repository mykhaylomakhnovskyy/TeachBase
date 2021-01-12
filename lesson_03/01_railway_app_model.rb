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
    @trains.each { |train| puts train.number }
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
  def initialize(start_station, final_station)
    @stations = [start_station, final_station]
  end

  def add_middle_station(station)
    @stations.insert(1, station)
  end

  def delete_middle_station(station)
    @stations.delete(station)
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
      puts 'You are moving too fast! Slow down!'
    end
  end

  def unpin_carriage
    @carriages -= 1
  end

  def take_route(route)
    @route = route
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
station2.take_train(train1)
station2.send_train(train1)
station1.take_train(train1)
station1.send_train(train1)
station4.take_train(train1)
station3.take_train(train2)
station3.send_train(train1)
station4.take_train(train2)
station4.show_all_trains
