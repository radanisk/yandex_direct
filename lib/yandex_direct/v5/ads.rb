# frozen_string_literal: true

require 'yandex_direct/v5/utils'

module YandexDirect
  module V5
    module Ads
      include Utils

      # Creates an ad
      #
      # @see https://tech.yandex.com/direct/doc/ref-v5/ads/add-docpage/
      def add_ads(params, additional_headers = {})
        perform_request(self, @token, 'ads', 'add', params, additional_headers)
      end

      # Returns parameters of ads that match the specified criteria
      #
      # @see https://tech.yandex.com/direct/doc/ref-v5/ads/get-docpage/
      def ads(params, additional_headers = {})
        perform_request(self, @token, 'ads', 'get', params, additional_headers)
      end

      # Submits ads for review
      #
      # @see https://tech.yandex.com/direct/doc/ref-v5/ads/moderate-docpage/
      def moderate_ads(params, additional_headers = {})
        perform_request(self, @token, 'ads', 'moderate', params, additional_headers)
      end
    end
  end
end
