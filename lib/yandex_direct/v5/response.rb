# frozen_string_literal: true

class Response
  attr_reader :result, :available_units, :limit_units

  def initialize(attrs)
    @result = attrs['result']
    return if attrs['Units'].nil?

    @available_units = attrs['Units'].split('/')[1]
    @limit_units = attrs['Units'].split('/')[0]
  end
end
