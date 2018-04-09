# frozen_string_literal: true

require 'yandex_direct/geo_regions_item'

module YandexDirect
  module V5
    module Dictionaries
      # Returns reference data: regions, time zones, currency exchange rates, metro stations, restrictions on parameter
      # values, ad exchanges (SSPs), and other information
      #
      # @see https://tech.yandex.com/direct/doc/ref-v5/dictionaries/get-docpage/
      def dictionaries(params)
        response = YandexDirect::V5::Request.new(self, @token, 'dictionaries', 'get', params).perform
        if response[:result]['GeoRegions'].any?
          response[:result]['GeoRegions'].map! do |region_data|
            YandexDirect::GeoRegionsItem.new(region_data)
          end
        end
        response[:result]
      end
    end
  end
end
