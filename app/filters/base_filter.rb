# frozen_string_literal: true

class BaseFilter
  class InvalidInput < StandardError; end

  attr_accessor :input

  def initialize(input)
    @input = input
  end

  protected

  def validate!
    raise InvalidInput, input.errors.full_messages.join('. ') unless input.valid?
  end
end
