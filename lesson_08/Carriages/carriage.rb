# frozen_string_literal: true

require_relative '../Modules/instance_counter'
# Carriage Class
class Carriage
  include InstanceCounter

  def initialize(_carriage_number, _places_or_capacity)
    register_instance
  end

  def self.total_instances
    @total_instances ||= 0
  end

  class << self
    attr_writer :total_instances
  end
end
