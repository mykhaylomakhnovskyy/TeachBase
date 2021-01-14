# frozen_string_literal: true

# Instance Counter Module
module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
  end

  def register_instance
    # This method should increase amount of instances from ctor
    @instance_iterator = self.class.total_instances + 1
    self.class.total_instances = @instance_iterator
  end

  # Class Methods
  module ClassMethods
    # This method should display how many instances have been created already
    def instances
      puts total_instances
    end
  end
end
