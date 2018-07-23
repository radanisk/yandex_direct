# frozen_string_literal: true

require 'yandex_direct/v5/utils'

module YandexDirect
  module V5
    module Keywords
      include Utils

      # Creates keywords
      #
      # @see https://tech.yandex.com/direct/doc/ref-v5/keywords/add-docpage/
      def add_keywords(params, additional_headers = {})
        perform_request(self, @token, 'keywords', 'add', params, additional_headers)
      end

      # Returns parameters of keywords that match the set criteria: the values of substitution variables, status and
      # state, productivity, statistics for impressions and clicks, and bids and priorities
      #
      # @see https://tech.yandex.com/direct/doc/ref-v5/keywords/get-docpage/
      def keywords(params, additional_headers = {})
        perform_request(self, @token, 'keywords', 'get', params, additional_headers)
      end

      # Deletes keywords and autotargetings
      #
      # @see https://tech.yandex.com/direct/doc/ref-v5/keywords/delete-docpage/
      def delete_keywords(params, additional_headers = {})
        perform_request(self, @token, 'keywords', 'delete', params, additional_headers)
      end
    end
  end
end
