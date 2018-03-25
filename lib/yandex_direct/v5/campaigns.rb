# frozen_string_literal: true

module YandexDirect
  module V5
    module Campaigns
      # Creates campaigns
      #
      # @see https://tech.yandex.com/direct/doc/ref-v5/campaigns/add-docpage/
      def add_campaigns(params)
        response = YandexDirect::V5::Request.new(self, @token, 'campaigns', 'add', params).perform
        @available_units = response[:available_units]
        response[:result]
      end

      # Returns the parameters of campaigns that match the specified criteria
      #
      # @see https://tech.yandex.com/direct/doc/ref-v5/campaigns/get-docpage/
      def campaigns(params)
        response = YandexDirect::V5::Request.new(self, @token, 'campaigns', 'get', params).perform
        @available_units = response[:available_units]
        response[:result]
      end
    end
  end
end
