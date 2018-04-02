# frozen_string_literal: true

require 'yandex_direct/v5/utils'

module YandexDirect
  module V5
    module Campaigns
      # Creates campaigns
      #
      # @see https://tech.yandex.com/direct/doc/ref-v5/campaigns/add-docpage/
      def add_campaigns(params)
        Utils.new.perform_request(self, @token, 'campaigns', 'add', params)
      end

      # Returns the parameters of campaigns that match the specified criteria
      #
      # @see https://tech.yandex.com/direct/doc/ref-v5/campaigns/get-docpage/
      def campaigns(params)
        Utils.new.perform_request(self, @token, 'campaigns', 'get', params)
      end
    end
  end
end
