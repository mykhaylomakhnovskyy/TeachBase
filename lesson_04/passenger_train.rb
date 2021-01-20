# frozen_string_literal: true

require_relative 'train'
require_relative 'passenger_carriage'
# Passenger Train
class PassengerTrain < Train
  def pin_carriage
    if @speed.zero?
      @carriages.push(PassengerCarriage.new)
    else
      puts 'You are moving too fast to pin a carriage! Slow down!'
    end
  end

  def unpin_carriage(carriage_id)
    @carriages.delete_at(carriage_id) if @speed.zero?
  end
end
