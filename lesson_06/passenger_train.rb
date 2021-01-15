# frozen_string_literal: true

require_relative 'train'
require_relative 'passenger_carriage'
# Passenger Train
class PassengerTrain < Train
  def pin_carriage(carriage_number, places_amount)
    raise 'You are moving too fast to pin a carriage! Slow down!' unless @speed.zero?

    @carriages.push(PassengerCarriage.new(carriage_number, places_amount)) if @speed.zero?
  end

  def unpin_carriage(carriage_id)
    @carriages.delete_at(carriage_id) if @speed.zero?
  end
end
