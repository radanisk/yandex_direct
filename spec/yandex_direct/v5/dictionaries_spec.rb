# frozen_string_literal: true

require 'spec_helper'

RSpec.describe YandexDirect::V5::Dictionaries do
  before do
    @client = YandexDirect::Client.new(app_id: 'AI', login: 'L', token: 'T', test: true)
  end

  describe '#dictionaries' do
    context 'for GeoRegions' do
      before do
        stub_post('dictionaries')
          .with(body: { method: 'get', params: { DictionaryNames: ['GeoRegions'] } })
          .to_return(
            body: fixture('geo_regions.json'),
            headers: { content_type: 'application/json; charset=utf-8', Units: '11/119918/120000' }
          )
      end
      it 'requests the correct resource' do
        @client.dictionaries(DictionaryNames: ['GeoRegions'])
        expect(a_post('dictionaries').with(body: { method: 'get', params: { DictionaryNames: ['GeoRegions'] } }))
          .to have_been_made
      end
      it 'returns the regions list' do
        result = @client.dictionaries(DictionaryNames: ['GeoRegions'])
        expect(result).to be_a Hash
        expect(result['GeoRegions']).to be_an Array
        expect(result['GeoRegions'].first).to be_a YandexDirect::GeoRegionsItem
        expect(result['GeoRegions'].first.geo_region_id).to eq(0)
      end
    end
  end
end
