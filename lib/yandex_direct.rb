# frozen_string_literal: true

require 'http'
require 'yandex_direct/authorization_error'
require 'yandex_direct/error'
require 'yandex_direct/not_enough_units_error'
require 'yandex_direct/blank_data_error'
require 'yandex_direct/v5/api'
require 'yandex_direct/v5/request'
require 'yandex_direct/version'

module YandexDirect
  class Client
    include YandexDirect::V5::API

    attr_accessor :token, :login, :test, :app_id
    attr_reader :available_units, :limit_units

    def initialize(options = {})
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
      end

      @url = 'https://api.direct.yandex.ru/json-api/v4/'
      @url_live = 'https://api.direct.yandex.ru/live/v4/json/'

      yield(self) if block_given?
    end

    def create_new_wordstat_report(param = nil)
      param ||= { Phrases: ['синтепон'], GeoID: [213] }
      request('CreateNewWordstatReport', param)['data']
    end

    def delete_wordstat_report(param)
      request('DeleteWordstatReport', param)
    end

    def wordstat_report(param)
      result = request('GetWordstatReport', param)

      result
    end

    def wordstat_report_list
      request('GetWordstatReportList')
    end

    def update_campaigns_tags(param)
      request_live('UpdateCampaignsTags', param)
    end

    def campaigns_tags(param)
      request_live('GetCampaignsTags', param)
    end

    def update_banners_tags(param)
      request_live('UpdateBannersTags', param)
    end

    def banners_tags(param)
      request_live('GetBannersTags', param)
    end

    def ping_api
      request('PingAPI')
    end

    private

    def request_v4(url, method, param)
      result = HTTP.post(url, json: {
                           method: method,
                           token: @token,
                           locale: 'ru',
                           param: param
                         }).parse

      raise(YandexDirect::AuthorizationError, "#{result['error_str']}: #{result['error_detail']}") if result['error_code'] == 53
      raise(YandexDirect::Error, "[#{result['error_code']}] #{result['error_str']}: #{result['error_detail']}") if result.key?('error_code')

      result
    end

    def request(method, param = nil)
      request_v4(@url, method, param)
    end

    def request_live(method, param = nil)
      request_v4(@url_live, method, param)
    end
  end
end
