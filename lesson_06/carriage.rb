# frozen_string_literal: true

require_relative 'instance_counter'
# Carriage Class
class Carriage
  include InstanceCounter

  def initialize
    register_instance
  end

  @@total_instances = 0
  def self.total_instances
    @@total_instances
  end

  def self.total_instances=(total_instances)
    @@total_instances = total_instances
  end
end
