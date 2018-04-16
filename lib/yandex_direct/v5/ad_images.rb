# frozen_string_literal: true

require 'yandex_direct/v5/utils'

module YandexDirect
  module V5
    module AdImages
      include Utils

      # Synchronously uploads images as binary data
      #
      # @see https://tech.yandex.ru/direct/doc/ref-v5/adimages/add-docpage/
      def add_ad_images(params)
        perform_request(self, @token, 'adimages', 'add', params)
      end

      # Returns images that meet the specified criteria
      #
      # https://tech.yandex.ru/direct/doc/ref-v5/adimages/get-docpage/
      def ad_images(params)
        perform_request(self, @token, 'adimages', 'get', params)
      end
    end
  end
end
