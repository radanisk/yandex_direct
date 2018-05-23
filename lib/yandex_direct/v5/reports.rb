# frozen_string_literal: true

require 'yandex_direct/v5/utils'

module YandexDirect
  module V5
    module Reports
      include Utils

      # Getting CTR statistics
      #
      # @see https://tech.yandex.ru/direct/doc/reports/reports-docpage/
      def report(params)
        perform_request(self, @token, 'reports', '', params)
      end
    end
  end
end
