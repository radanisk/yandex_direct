# frozen_string_literal: true

module YandexDirect
  module V5
    module Utils
      def initialize; end

      def perform_request(client, token, service_name, method, params)
        response = YandexDirect::V5::Request.new(client, token, service_name, method, params).perform
        @available_units = response.available_units
        @limit_units = response.limit_units
        response.result
      end
    end
  end
end
