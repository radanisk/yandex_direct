# frozen_string_literal: true

class Response
  attr_reader :result, :available_units, :limit_units

  def initialize(response)
    @result = response.parse['result']
    return if response['Units'].nil?

    @available_units = response['Units'].split('/')[1]
    @limit_units = response['Units'].split('/')[2]
  end
end
