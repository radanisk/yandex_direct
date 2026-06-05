# frozen_string_literal: true

require 'yandex_direct/v5/utils'

module YandexDirect
  module V5
    module BidModifiers
      include Utils

      # Creates bid modifiers
      #
      # @see https://yandex.ru/dev/direct/doc/ref-v5/bidmodifiers/add.html
      def add_bid_modifiers(params, additional_headers = {})
        perform_request(self, @token, 'bidmodifiers', 'add', params, additional_headers)
      end
    end
  end
end
