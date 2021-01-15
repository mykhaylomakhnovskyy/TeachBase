# frozen_string_literal: true

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
    @stations.delete(station)
  end

  def show_all_stations
    @stations.each do |station|
      puts station.name
    end
  end
end
