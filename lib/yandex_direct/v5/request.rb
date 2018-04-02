# frozen_string_literal: true

require 'yandex_direct/v5/response'

module YandexDirect
  module V5
    class Request
      def initialize(client, token, service_name, method, params)
        @payload = { method: method, params: params }
        api_url = client.test ? 'https://api-sandbox.direct.yandex.com/json/v5/' : 'https://api.direct.yandex.com/json/v5/'
        @url = "#{api_url}#{service_name}"
        @token = token
      end

      def perform
        response = HTTP.auth("Bearer #{@token}").headers('Accept-Language': 'ru').post(@url, json: @payload)
        response_body = response.parse

        raise(YandexDirect::NotEnoughUnitsError) if response_body.key?('error') && response_body['error']['error_code'].to_i == 152
        raise(YandexDirect::Error, "[#{response_body['error']['error_code']}] #{response_body['error']['error_string']}: #{response_body['error']['error_detail']}") if response_body.key?('error')

        Response.new(response_body)
      end
    end
  end
end
