# frozen_string_literal: true

require 'yandex_direct/v5/utils'

module YandexDirect
  module V5
    module Campaigns
      include Utils

      # Creates campaigns
      #
      # @see https://tech.yandex.com/direct/doc/ref-v5/campaigns/add-docpage/
      def add_campaigns(params, additional_headers = {})
        perform_request(self, @token, 'campaigns', 'add', params, additional_headers)
      end

      # Archives campaigns
      #
      # @see https://tech.yandex.ru/direct/doc/ref-v5/campaigns/archive-docpage/
      def archive_campaigns(params)
        perform_request(self, @token, 'campaigns', 'archive', params)
      end

      # Returns the parameters of campaigns that match the specified criteria
      #
      # @see https://tech.yandex.com/direct/doc/ref-v5/campaigns/get-docpage/
      def campaigns(params, additional_headers = {})
        perform_request(self, @token, 'campaigns', 'get', params, additional_headers)
      end

      # Deletes campaigns
      #
      # @see https://tech.yandex.ru/direct/doc/ref-v5/campaigns/delete-docpage/
      def delete_campaigns(params)
        perform_request(self, @token, 'campaigns', 'delete', params)
      end

      # Resumes displays on the campaign level
      #
      # @see https://tech.yandex.ru/direct/doc/ref-v5/campaigns/resume-docpage/
      def resume_campaigns(params)
        perform_request(self, @token, 'campaigns', 'resume', params)
      end

      # Stops displays on the campaign level
      #
      # @see https://tech.yandex.ru/direct/doc/ref-v5/campaigns/suspend-docpage/
      def suspend_campaigns(params)
        perform_request(self, @token, 'campaigns', 'suspend', params)
      end

      # Unarchives campaigns
      #
      # @see https://tech.yandex.ru/direct/doc/ref-v5/campaigns/unarchive-docpage/
      def unarchive_campaigns(params)
        perform_request(self, @token, 'campaigns', 'unarchive', params)
      end

      # Changes campaign parameters
      #
      # @see https://tech.yandex.ru/direct/doc/ref-v5/campaigns/update-docpage
      def update_campaigns(params)
        perform_request(self, @token, 'campaigns', 'update', params)
      end
    end
  end
end
