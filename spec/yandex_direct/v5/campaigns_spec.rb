# frozen_string_literal: true

require 'spec_helper'

RSpec.describe YandexDirect::V5::Campaigns do
  before do
    @client = YandexDirect::Client.new(app_id: 'AI', login: 'L', token: 'T', test: true)
  end

  describe '#campaigns' do
    before do
      stub_request(:post, YandexDirect::V5::Request::SANDBOX_BASE_URL + 'campaigns')
        .with(body: { method: 'get', params: { SelectionCriteria: { Ids: [34_216_599] }, FieldNames: %w[Id Name State Status] } })
        .to_return(body: fixture('campaigns.json'), headers: { content_type: 'application/json; charset=utf-8', Units: '11/119918/120000' })
    end
    it 'requests the correct resource' do
      @client.campaigns(SelectionCriteria: { Ids: [34_216_599] }, FieldNames: %w[Id Name State Status])
      expect(
        a_request(:post, YandexDirect::V5::Request::SANDBOX_BASE_URL + 'campaigns')
          .with(body: { method: 'get', params: { SelectionCriteria: { Ids: [34_216_599] }, FieldNames: %w[Id Name State Status] } })
      ).to have_been_made
    end
  end
end
