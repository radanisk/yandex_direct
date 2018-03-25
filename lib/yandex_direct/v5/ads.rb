# frozen_string_literal: true

module YandexDirect
  module V5
    module Ads
      # Creates an ad
      #
      # @see https://tech.yandex.com/direct/doc/ref-v5/ads/add-docpage/
      def add_ads(params)
        response = YandexDirect::V5::Request.new(self, @token, 'ads', 'add', params).perform
        @available_units = response[:available_units]
        response[:result]
      end

      # Returns parameters of ads that match the specified criteria
      #
      # @see https://tech.yandex.com/direct/doc/ref-v5/ads/get-docpage/
      def ads(params)
        response = YandexDirect::V5::Request.new(self, @token, 'ads', 'get', params).perform
        @available_units = response[:available_units]
        response[:result]
      end

      # Submits ads for review
      #
      # @see https://tech.yandex.com/direct/doc/ref-v5/ads/moderate-docpage/
      def moderate_ads(params)
        response = YandexDirect::V5::Request.new(self, @token, 'ads', 'moderate', params).perform
        @available_units = response[:available_units]
        response[:result]
      end
    end
  end
end
