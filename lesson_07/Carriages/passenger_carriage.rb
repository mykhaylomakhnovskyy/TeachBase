# frozen_string_literal: true

require_relative 'carriage'
# Passenger Carriage Class
class PassengerCarriage < Carriage
  attr_accessor :carriage_number, :places_amount
  attr_reader :occupied_places_amount

  def initialize(carriage_number, places_amount)
    super
    @carriage_number = carriage_number
    @places_amount = places_amount
    @occupied_places_amount = 0
  end

  def take_place
    @places_amount -= 1
    @occupied_places_amount += 1
    raise 'There is no free places left' if @places_amount.negative?
  end

  def empty_places_amount
    @places_amount - @occupied_places_amount
  end
end
