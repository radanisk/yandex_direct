# frozen_string_literal: true

require 'yandex_direct/v5/utils'

module YandexDirect
  module V5
    module Keywords
      # Creates keywords
      #
      # @see https://tech.yandex.com/direct/doc/ref-v5/keywords/add-docpage/
      def add_keywords(params)
        Utils.new.perform_request(self, @token, 'keywords', 'add', params)
      end

      # Returns parameters of keywords that match the set criteria: the values of substitution variables, status and
      # state, productivity, statistics for impressions and clicks, and bids and priorities
      #
      # @see https://tech.yandex.com/direct/doc/ref-v5/keywords/get-docpage/
      def keywords(params)
        Utils.new.perform_request(self, @token, 'keywords', 'get', params)
      end
    end
  end
end
