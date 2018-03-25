# frozen_string_literal: true

module YandexDirect
  module V5
    module AdGroups
      # Creates an ad group
      #
      # @see https://tech.yandex.com/direct/doc/ref-v5/adgroups/add-docpage/
      def add_ad_groups(params)
        response = YandexDirect::V5::Request.new(self, @token, 'adgroups', 'add', params).perform
        @available_units = response[:available_units]
        response[:result]['AddResults']
      end

      # Returns parameters of groups that match the specified criteria
      #
      # @see https://tech.yandex.com/direct/doc/ref-v5/adgroups/get-docpage/
      def ad_groups(params)
        response = YandexDirect::V5::Request.new(self, @token, 'adgroups', 'get', params).perform
        @available_units = response[:available_units]
        response[:result]
      end
    end
  end
end
