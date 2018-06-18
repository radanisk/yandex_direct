# frozen_string_literal: true

require 'yandex_direct/v5/response'

module YandexDirect
  module V5
    class Request
      BASE_URL = 'https://api.direct.yandex.com/json/v5/'
      SANDBOX_BASE_URL = 'https://api-sandbox.direct.yandex.com/json/v5/'

      attr_reader :additional_headers

      def initialize(client, token, service_name, method, params, additional_headers = {})
        @payload = { method: method, params: params }
        api_url = client.test ? SANDBOX_BASE_URL : BASE_URL
        @url = "#{api_url}#{service_name}"
        @token = token
        @method = method
        @additional_headers = additional_headers
      end

      def perform
        response = HTTP.auth("Bearer #{@token}").headers({ 'Accept-Language': 'ru' }.merge(additional_headers)).post(@url, json: @payload)
        response_body = response.parse

        raise(YandexDirect::NotEnoughUnitsError) if response_body.key?('error') && response_body['error']['error_code'].to_i == 152
        raise(YandexDirect::ObjectStatusError, error_message(response_body)) if error_key(response_body) == 8300
        raise(YandexDirect::ObjectDeleteError, error_message(response_body)) if error_key(response_body) == 8301
        raise(YandexDirect::StopImpressionsError, error_message(response_body)) if error_key(response_body) == 8302
        raise(YandexDirect::CampaignArchiveError, error_message(response_body)) if error_key(response_body) == 8303
        raise(YandexDirect::CampaignUnarchiveError, error_message(response_body)) if error_key(response_body) == 8304
        raise(YandexDirect::ObjectNotFoundError, error_message(response_body)) if error_key(response_body) == 8800
        raise(YandexDirect::CampaignManagmentError, error_message(response_body)) if response_body.key?('result') && response_body['result'].key?(@method.capitalize + 'Results') && response_body['result'][@method.capitalize + 'Results'][0].key?('Errors')
        raise(YandexDirect::Error, "[#{response_body['error']['error_code']}] #{response_body['error']['error_string']}: #{response_body['error']['error_detail']}") if response_body.key?('error')

        Response.new(response)
      end

      private

      def error_key(response_body)
        return if response_body['result'].nil?
        response_body['result'].key?(@method.capitalize + 'Results') && response_body['result'][@method.capitalize + 'Results'][0].key?('Errors') && response_body['result'][@method.capitalize + 'Results'][0]['Errors'][0]['Code']
      end

      def error_message(response_body)
        return if response_body['result'].nil?
        response_body['result'][@method.capitalize + 'Results'][0]['Errors'][0]['Message']
      end
    end
  end
end
