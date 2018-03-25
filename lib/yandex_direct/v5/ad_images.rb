# frozen_string_literal: true

module YandexDirect
  module V5
    module AdImages
      # Synchronously uploads images as binary data
      #
      # @see https://tech.yandex.ru/direct/doc/ref-v5/adimages/add-docpage/
      def add_ad_images(params)
        response = YandexDirect::V5::Request.new(self, @token, 'adimages', 'add', params).perform
        @available_units = response[:available_units]
        response[:result]
      end

      # Returns images that meet the specified criteria
      #
      # https://tech.yandex.ru/direct/doc/ref-v5/adimages/get-docpage/
      def ad_images(params)
        response = YandexDirect::V5::Request.new(self, @token, 'adimages', 'get', params).perform
        @available_units = response[:available_units]
        response[:result]
      end
    end
  end
end
