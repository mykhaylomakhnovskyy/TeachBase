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
    @trains.each { |train| puts "  Train number: #{train.number}" }
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
