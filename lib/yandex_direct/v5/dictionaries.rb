# frozen_string_literal: true

require 'yandex_direct/geo_regions_item'
require 'yandex_direct/v5/utils'

module YandexDirect
  module V5
    module Dictionaries
      include Utils

      # Returns reference data: regions, time zones, currency exchange rates, metro stations, restrictions on parameter
      # values, ad exchanges (SSPs), and other information
      #
      # @see https://tech.yandex.com/direct/doc/ref-v5/dictionaries/get-docpage/
      def dictionaries(params)
        response = perform_request(self, @token, 'dictionaries', 'get', params)
        if response['GeoRegions'].any?
          response['GeoRegions'].map! do |region_data|
            YandexDirect::GeoRegionsItem.new(region_data)
          end
        end
        response
      end
    end
  end
end
