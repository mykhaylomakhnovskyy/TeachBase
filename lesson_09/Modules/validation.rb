# frozen_string_literal: true

# Validation
module Validation
  def self.included(base)
    base.extend ClassMethods
  end

  # Class Methods
  module ClassMethods
    def validate(value, validation_type, extra_param = 0)
      case validation_type
      when :presence
        raise 'It can\'t be nil or empty' if value.nil? || value == ''
      when :format
        raise 'Wrong format! Regular expression error' if value !~ extra_param
      else
        raise 'Wrong type!' if value.class != extra_param
      end
    end
  end

  def validate!(name, regexp, type)
    # self.class.class_variable_set :@@buf_for_instance_var, instance_variable_get(name)
    value = instance_variable_get :"#{name}"
    self.class.validate(value, :presence)
    self.class.validate(value, :format, regexp)
    self.class.validate(value, :type, type)
  end

  def valid?(name, regexp, type)
    validate!(name, regexp, type)
  end
end
