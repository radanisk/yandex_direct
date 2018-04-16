# frozen_string_literal: true

require 'yandex_direct/v5/utils'

module YandexDirect
  module V5
    module AdGroups
      include Utils

      # Creates an ad group
      #
      # @see https://tech.yandex.com/direct/doc/ref-v5/adgroups/add-docpage/
      def add_ad_groups(params)
        perform_request(self, @token, 'adgroups', 'add', params)
      end

      # Returns parameters of groups that match the specified criteria
      #
      # @see https://tech.yandex.com/direct/doc/ref-v5/adgroups/get-docpage/
      def ad_groups(params)
        perform_request(self, @token, 'adgroups', 'get', params)
      end
    end
  end
end
