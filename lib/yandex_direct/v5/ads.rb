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

      # Archives ads
      #
      # @see https://tech.yandex.ru/direct/doc/ref-v5/ads/archive-docpage/
      def archive_ads(params)
        perform_request(self, @token, 'ads', 'archive', params)
      end

      # Deletes ads
      #
      # @see https://tech.yandex.ru/direct/doc/ref-v5/ads/delete-docpage/
      def delete_ads(params)
        perform_request(self, @token, 'ads', 'delete', params)
      end

      # Submits ads for review
      #
      # @see https://tech.yandex.com/direct/doc/ref-v5/ads/moderate-docpage/
      def moderate_ads(params, additional_headers = {})
        perform_request(self, @token, 'ads', 'moderate', params, additional_headers)
      end

      # Stops ad displays
      #
      # @see https://tech.yandex.ru/direct/doc/ref-v5/ads/suspend-docpage/
      def suspend_ads(params)
        perform_request(self, @token, 'ads', 'suspend', params)
      end
    end
  end
end
