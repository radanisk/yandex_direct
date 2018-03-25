# frozen_string_literal: true

module YandexDirect
  module V5
    module VCards
      # Creates virtual business cards
      #
      # @see https://tech.yandex.com/direct/doc/ref-v5/vcards/add-docpage/
      def add_v_cards(params)
        response = YandexDirect::V5::Request.new(self, @token, 'vcards', 'add', params).perform
        @available_units = response[:available_units]
        response[:result]
      end

      # Returns the vCards that match the specified criteria
      #
      # @see https://tech.yandex.com/direct/doc/ref-v5/vcards/get-docpage/
      def v_cards(params)
        response = YandexDirect::V5::Request.new(self, @token, 'vcards', 'get', params).perform
        @available_units = response[:available_units]
        response[:result]
      end
    end
  end
end
