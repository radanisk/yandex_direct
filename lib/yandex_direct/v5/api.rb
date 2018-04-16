# frozen_string_literal: true

require 'yandex_direct/v5/ads'
require 'yandex_direct/v5/ad_groups'
require 'yandex_direct/v5/ad_images'
require 'yandex_direct/v5/campaigns'
require 'yandex_direct/v5/dictionaries'
require 'yandex_direct/v5/keywords'
require 'yandex_direct/v5/sitelinks'
require 'yandex_direct/v5/v_cards'
require 'yandex_direct/v5/utils'

module YandexDirect
  module V5
    module API
      include YandexDirect::V5::Ads
      include YandexDirect::V5::AdGroups
      include YandexDirect::V5::AdImages
      include YandexDirect::V5::Campaigns
      include YandexDirect::V5::Dictionaries
      include YandexDirect::V5::Keywords
      include YandexDirect::V5::Sitelinks
      include YandexDirect::V5::VCards
      include YandexDirect::V5::Utils
    end
  end
end
