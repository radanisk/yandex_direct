# frozen_string_literal: true

require 'yandex_direct/v5/utils'

module YandexDirect
  module V5
    module VCards
      include Utils

      # Creates virtual business cards
      #
      # @see https://tech.yandex.com/direct/doc/ref-v5/vcards/add-docpage/
      def add_v_cards(params, additional_headers = {})
        perform_request(self, @token, 'vcards', 'add', params, additional_headers)
      end

      # Returns the vCards that match the specified criteria
      #
      # @see https://tech.yandex.com/direct/doc/ref-v5/vcards/get-docpage/
      def v_cards(params, additional_headers = {})
        perform_request(self, @token, 'vcards', 'get', params, additional_headers)
      end
    end
  end
end
