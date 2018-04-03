# frozen_string_literal: true

module YandexDirect
  module V5
    class Request
      BASE_URL = 'https://api.direct.yandex.com/json/v5/'
      SANDBOX_BASE_URL = 'https://api-sandbox.direct.yandex.com/json/v5/'

      def initialize(client, token, service_name, method, params)
        @payload = { method: method, params: params }
        api_url = client.test ? SANDBOX_BASE_URL : BASE_URL
        @url = "#{api_url}#{service_name}"
        @token = token
      end

      def perform
        response = HTTP.auth("Bearer #{@token}").headers('Accept-Language': 'ru').post(@url, json: @payload)
        response_body = response.parse

        raise(YandexDirect::NotEnoughUnitsError) if response_body.key?('error') && response_body['error']['error_code'].to_i == 152
        raise(YandexDirect::Error, "[#{response_body['error']['error_code']}] #{response_body['error']['error_string']}: #{response_body['error']['error_detail']}") if response_body.key?('error')

        { result: response_body['result'], available_units: response['Units'].split('/')[1] }
      end
    end
  end
end
