# frozen_string_literal: true

require 'spec_helper'

RSpec.describe YandexDirect::V5::BidModifiers do
  before do
    @client = YandexDirect::Client.new(app_id: 'AI', login: 'L', token: 'T', test: true)
  end

  describe '#add_bid_modifiers' do
    before do
      stub_post('bidmodifiers')
        .with(
          body: {
            method: 'add',
            params: {
              BidModifiers: [{
                CampaignId: 123_456,
                DemographicsAdjustments: [{
                  Age: 'AGE_0_17',
                  BidModifier: 0
                }]
              }]
            }
          }
        )
        .to_return(
          body: fixture('add_results.json'),
          headers: { content_type: 'application/json; charset=utf-8', Units: '1/99/100' }
        )
    end

    it 'requests the correct resource' do
      @client.add_bid_modifiers(
        BidModifiers: [{
          CampaignId: 123_456,
          DemographicsAdjustments: [{
            Age: 'AGE_0_17',
            BidModifier: 0
          }]
        }]
      )

      expect(
        a_post('bidmodifiers').with(
          body: {
            method: 'add',
            params: {
              BidModifiers: [{
                CampaignId: 123_456,
                DemographicsAdjustments: [{
                  Age: 'AGE_0_17',
                  BidModifier: 0
                }]
              }]
            }
          }
        )
      ).to have_been_made
    end

    it 'returns the IDs of added bid modifiers' do
      result = @client.add_bid_modifiers(
        BidModifiers: [{
          CampaignId: 123_456,
          DemographicsAdjustments: [{
            Age: 'AGE_0_17',
            BidModifier: 0
          }]
        }]
      )

      expect(result).to be_a Hash
      expect(result['AddResults']).to be_an Array
      expect(result['AddResults'].first).to be_a Hash
      expect(result['AddResults'].first['Id']).to eq(34_302_671)
    end
  end
end
