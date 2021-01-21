# frozen_string_literal: true

# Accessors Module
module Accessors
  def attr_accessor_with_history(*names)
    names.each do |name|
      history = []
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}=".to_sym) do |value|
        self.class.class_exec { history << value }
        instance_variable_set(var_name, value)
      end
      define_method("#{name}_history".to_sym) { history }
    end
  end

  def strong_attr_accessor(name, name_class)
    var_name = "@#{name}".to_sym
    define_method(name) { instance_variable_get(var_name) }
    define_method("#{name}=".to_sym) do |value|
      raise 'Wrong type!' if name.class != name_class

      instance_variable_set(name, value)
    end
  end
end
