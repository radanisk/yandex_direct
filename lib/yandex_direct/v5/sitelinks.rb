# frozen_string_literal: true

module YandexDirect
  module V5
    module Sitelinks
      # Creates sets of sitelinks
      #
      # @see https://tech.yandex.com/direct/doc/ref-v5/sitelinks/add-docpage/
      def add_sitelinks(params)
        response = YandexDirect::V5::Request.new(self, @token, 'sitelinks', 'add', params).perform
        @available_units = response[:available_units]
        response[:result]
      end

      # Returns sets of sitelinks that match the specified criteria
      #
      # @see https://tech.yandex.com/direct/doc/ref-v5/sitelinks/get-docpage/
      def sitelinks(params)
        response = YandexDirect::V5::Request.new(self, @token, 'sitelinks', 'get', params).perform
        @available_units = response[:available_units]
        response[:result]
      end
    end
  end
end
