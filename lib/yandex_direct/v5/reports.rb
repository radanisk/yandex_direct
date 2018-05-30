# frozen_string_literal: true

module YandexDirect
  module V5
    module Reports
      # Getting CTR statistics
      #
      # @see https://tech.yandex.ru/direct/doc/reports/reports-docpage/
      def report(params)
        YandexDirect::V5::ReportRequest.new(self, @token, params).perform
      end
    end
  end
end
