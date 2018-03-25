# frozen_string_literal: true

module YandexDirect
  module V5
    module Keywords
      # Creates keywords
      #
      # @see https://tech.yandex.com/direct/doc/ref-v5/keywords/add-docpage/
      def add_keywords(params)
        response = YandexDirect::V5::Request.new(self, @token, 'keywords', 'add', params).perform
        @available_units = response[:available_units]
        response[:result]
      end

      # Returns parameters of keywords that match the set criteria: the values of substitution variables, status and
      # state, productivity, statistics for impressions and clicks, and bids and priorities
      #
      # @see https://tech.yandex.com/direct/doc/ref-v5/keywords/get-docpage/
      def keywords(params)
        response = YandexDirect::V5::Request.new(self, @token, 'keywords', 'get', params).perform
        @available_units = response[:available_units]
        response[:result]
      end
    end
  end
end
