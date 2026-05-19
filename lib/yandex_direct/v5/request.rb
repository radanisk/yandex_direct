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
        api_error = response_body['error']
        operation_errors = yandex_direct_operation_errors(response_body)
        first_operation_error = operation_errors.first
        first_operation_error_code = first_operation_error && first_operation_error['Code'].to_i

        raise(YandexDirect::NotEnoughUnitsError) if api_error && api_error['error_code'].to_i == 152
        raise(YandexDirect::ObjectStatusError, first_operation_error['Message']) if first_operation_error_code == 8300
        raise(YandexDirect::ObjectDeleteError, first_operation_error['Message']) if first_operation_error_code == 8301
        raise(YandexDirect::StopImpressionsError, first_operation_error['Message']) if first_operation_error_code == 8302
        raise(YandexDirect::CampaignArchiveError, first_operation_error['Message']) if first_operation_error_code == 8303
        raise(YandexDirect::CampaignUnarchiveError, first_operation_error['Message']) if first_operation_error_code == 8304
        raise(YandexDirect::ObjectNotFoundError, first_operation_error['Message']) if first_operation_error_code == 8800
        raise(YandexDirect::CampaignManagementError, first_operation_error['Message']) if operation_errors.any?
        raise(YandexDirect::Error, "[#{api_error['error_code']}] #{api_error['error_string']}: #{api_error['error_detail']}") if api_error

        Response.new(response)
      end

      private

      def yandex_direct_operation_errors(response_body)
        result = response_body['result']
        return [] unless result

        operation_results = result[@method.capitalize + 'Results']
        return [] unless operation_results.respond_to?(:[])

        first_operation_result = operation_results[0]
        return [] unless first_operation_result.respond_to?(:[])

        errors = first_operation_result['Errors']
        errors.respond_to?(:any?) ? errors : []
      end
    end
  end
end
