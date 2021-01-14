# frozen_string_literal: true

# Module for Manufacturer
module Manufacturer
  def add_manufacturer(name)
    self.company = name
  end

  def manufacturer
    company
  end
end
