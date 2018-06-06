# frozen_string_literal: true

module YandexDirect
  module V5
    class ReportRequest
      BASE_URL = 'https://api.direct.yandex.com/json/v5/reports'
      SANDBOX_BASE_URL = 'https://api-sandbox.direct.yandex.com/json/v5/reports'

      def initialize(client, token, params)
        @payload = { params: params }
        @url = client.test ? SANDBOX_BASE_URL : BASE_URL
        @token = token
      end

      def perform
        response = HTTP.auth("Bearer #{@token}")
                       .headers('Accept-Language': 'ru',
                                skipColumnHeader: true,
                                skipReportSummary: true,
                                skipReportHeader: true)
                       .post(@url, json: @payload)
        return to_array(response) if response.status == 200

        raise(YandexDirect::OfflineReportError, 'Отчет формируется в режиме офлайн') if response.status == 201
        response_body = JSON.parse(response.flush)
        raise(YandexDirect::Error, "[#{response_body['error']['error_code']}] #{response_body['error']['error_string']}: #{response_body['error']['error_detail']}") if response_body.key?('error')
      end

      private

      def to_array(response)
        response.body.to_s.strip.split("\n").map do |row|
          { 'AdId' => row.split("\t")[0].to_i, 'Ctr' => row.split("\t")[1].to_f }
        end
      end
    end
  end
end
