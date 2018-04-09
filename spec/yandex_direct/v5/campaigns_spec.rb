# frozen_string_literal: true

require 'spec_helper'

RSpec.describe YandexDirect::V5::Campaigns do
  before do
    @client = YandexDirect::Client.new(app_id: 'AI', login: 'L', token: 'T', test: true)
  end

  describe '#add_campaigns' do
    before do
      stub_post('campaigns')
        .with(
          body: {
            method: 'add',
            params: {
              Campaigns: [{
                Name: 'Test',
                StartDate: '2100-01-01',
                TextCampaign: {
                  BiddingStrategy: {
                    Search: { BiddingStrategyType: 'HIGHEST_POSITION' },
                    Network: { BiddingStrategyType: 'MAXIMUM_COVERAGE' }
                  }
                }
              }]
            }
          }
        )
        .to_return(
          body: fixture('add_results.json'),
          headers: { content_type: 'application/json; charset=utf-8', Units: '11/119918/120000' }
        )
    end
    it 'requests the correct resource' do
      @client.add_campaigns(
        Campaigns: [{
          Name: 'Test',
          StartDate: '2100-01-01',
          TextCampaign: {
            BiddingStrategy: {
              Search: { BiddingStrategyType: 'HIGHEST_POSITION' },
              Network: { BiddingStrategyType: 'MAXIMUM_COVERAGE' }
            }
          }
        }]
      )
      expect(
        a_post('campaigns').with(
          body: {
            method: 'add',
            params: {
              Campaigns: [{
                Name: 'Test',
                StartDate: '2100-01-01',
                TextCampaign: {
                  BiddingStrategy: {
                    Search: { BiddingStrategyType: 'HIGHEST_POSITION' },
                    Network: { BiddingStrategyType: 'MAXIMUM_COVERAGE' }
                  }
                }
              }]
            }
          }
        )
      ).to have_been_made
    end
    it 'returns the IDs of added campaigns' do
      result = @client.add_campaigns(
        Campaigns: [{
          Name: 'Test',
          StartDate: '2100-01-01',
          TextCampaign: {
            BiddingStrategy: {
              Search: { BiddingStrategyType: 'HIGHEST_POSITION' },
              Network: { BiddingStrategyType: 'MAXIMUM_COVERAGE' }
            }
          }
        }]
      )
      expect(result).to be_a Hash
      expect(result['AddResults']).to be_an Array
      expect(result['AddResults'].first).to be_a Hash
      expect(result['AddResults'].first['Id']).to eq(34_302_671)
    end
  end

  describe '#campaigns' do
    before do
      stub_post('campaigns')
        .with(body: { method: 'get', params: { SelectionCriteria: { Ids: [34_216_599] }, FieldNames: %w[Id Name State Status] } })
        .to_return(body: fixture('campaigns.json'), headers: { content_type: 'application/json; charset=utf-8', Units: '11/119918/120000' })
    end
    it 'requests the correct resource' do
      @client.campaigns(SelectionCriteria: { Ids: [34_216_599] }, FieldNames: %w[Id Name State Status])
      expect(
        a_post('campaigns')
        .with(body: { method: 'get', params: { SelectionCriteria: { Ids: [34_216_599] }, FieldNames: %w[Id Name State Status] } })
      ).to have_been_made
    end
    it 'returns the specified campaigns' do
      result = @client.campaigns(SelectionCriteria: { Ids: [34_216_599] }, FieldNames: %w[Id Name State Status])
      expect(result).to be_a Hash
      expect(result['Campaigns']).to be_an Array
      expect(result['Campaigns'].first).to be_a Hash
      expect(result['Campaigns'].first['Id']).to eq(34_216_599)
    end
  end
end
