# frozen_string_literal: true

require_relative 'carriage'
# Cargo Carriage Class
class CargoCarriage < Carriage
  attr_accessor :carriage_number, :capacity
  attr_reader :occupied_volume

  def initialize(carriage_number, capacity)
    super
    @carriage_number = carriage_number
    @capacity = capacity
    @occupied_volume = 0
  end

  def occupy_volume(volume)
    @capacity -= volume
    @occupied_volume += volume
    raise 'There is no free space left' if @capacity.negative?
  end

  def empty_volume
    @capacity - @occupied_volume
  end
end
