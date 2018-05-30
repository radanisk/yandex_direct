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
        to_json response.body
      end

      private

      def to_json(response_body)
        response_body.to_s.strip.split("\n").map do |row|
          { 'AdId' => row.split("\t")[0].to_i, 'Ctr' => row.split("\t")[1].to_f }
        end
      end
    end
  end
end
