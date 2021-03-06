# frozen_string_literal: true

require 'yandex_direct/v5/utils'

module YandexDirect
  module V5
    module Sitelinks
      include Utils

      # Creates sets of sitelinks
      #
      # @see https://tech.yandex.com/direct/doc/ref-v5/sitelinks/add-docpage/
      def add_sitelinks(params, additional_headers = {})
        perform_request(self, @token, 'sitelinks', 'add', params, additional_headers)
      end

      # Returns sets of sitelinks that match the specified criteria
      #
      # @see https://tech.yandex.com/direct/doc/ref-v5/sitelinks/get-docpage/
      def sitelinks(params, additional_headers = {})
        perform_request(self, @token, 'sitelinks', 'get', params, additional_headers)
      end
    end
  end
end
