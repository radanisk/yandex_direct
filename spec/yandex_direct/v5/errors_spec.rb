# frozen_string_literal: true

require 'spec_helper'

RSpec.describe YandexDirect::V5::Campaigns do
  before do
    @client = YandexDirect::Client.new(app_id: 'AI', login: 'L', token: 'T', test: true)
  end

  describe '#archive_campaigns' do
    before do
      stub_post('campaigns')
        .with(body: { method: 'archive', params: { SelectionCriteria: { Ids: [34_216_599] } } })
        .to_return(body: fixture('errors/archive_error_results.json'), headers: { content_type: 'application/json; charset=utf-8', Units: '11/119918/120000' })
    end

    it 'generated raise error' do
      expect { @client.archive_campaigns(SelectionCriteria: { Ids: [34_216_599] }) }.to raise_error(YandexDirect::CampaignArchiveError)
    end
  end

  describe '#delete_campaigns' do
    before do
      stub_post('campaigns')
        .with(body: { method: 'delete', params: { SelectionCriteria: { Ids: [34_216_599] } } })
        .to_return(body: fixture('errors/delete_error_results.json'), headers: { content_type: 'application/json; charset=utf-8', Units: '11/119918/120000' })
    end

    it 'generated raise error' do
      expect { @client.delete_campaigns(SelectionCriteria: { Ids: [34_216_599] }) }.to raise_error(YandexDirect::ObjectDeleteError)
    end
  end

  describe '#resume_campaigns' do
    before do
      stub_post('campaigns')
        .with(body: { method: 'resume', params: { SelectionCriteria: { Ids: [34_216_599] } } })
        .to_return(body: fixture('errors/resume_error_results.json'), headers: { content_type: 'application/json; charset=utf-8', Units: '11/119918/120000' })
    end

    it 'generated raise error' do
      expect { @client.resume_campaigns(SelectionCriteria: { Ids: [34_216_599] }) }.to raise_error(YandexDirect::ObjectStatusError)
    end
  end

  describe '#suspend_campaigns' do
    before do
      stub_post('campaigns')
        .with(body: { method: 'suspend', params: { SelectionCriteria: { Ids: [34_216_599] } } })
        .to_return(body: fixture('errors/suspend_error_results.json'), headers: { content_type: 'application/json; charset=utf-8', Units: '11/119918/120000' })
    end

    it 'generated raise error' do
      expect { @client.suspend_campaigns(SelectionCriteria: { Ids: [34_216_599] }) }.to raise_error(YandexDirect::ObjectStatusError)
    end
  end

  describe '#unarchive_campaigns' do
    before do
      stub_post('campaigns')
        .with(body: { method: 'unarchive', params: { SelectionCriteria: { Ids: [34_216_599] } } })
        .to_return(body: fixture('errors/unarchive_error_results.json'), headers: { content_type: 'application/json; charset=utf-8', Units: '11/119918/120000' })
    end

    it 'generated raise error' do
      expect { @client.unarchive_campaigns(SelectionCriteria: { Ids: [34_216_599] }) }.to raise_error(YandexDirect::CampaignUnarchiveError)
    end
  end

  describe '#update_campaigns' do
    before do
      stub_post('campaigns')
        .with(body: { method: 'update', params: { Campaigns: [Id: 34_216_599] } })
        .to_return(body: fixture('errors/update_error_results.json'), headers: { content_type: 'application/json; charset=utf-8', Units: '11/119918/120000' })
    end

    it 'generated raise error' do
      expect { @client.update_campaigns(Campaigns: [Id: 34_216_599]) }.to raise_error(YandexDirect::ObjectNotFoundError)
    end
  end

  describe '#incorrect request' do
    before do
      stub_post('campaigns')
        .with(body: { method: 'archive', params: { SelectionCriteria: { Ids: [34_216_599] } } })
        .to_return(body: fixture('errors/incorrect_request_results.json'), headers: { content_type: 'application/json; charset=utf-8', Units: '11/119918/120000' })
    end

    it 'generated raise error' do
      expect { @client.archive_campaigns(SelectionCriteria: { Ids: [34_216_599] }) }.to raise_error(YandexDirect::Error)
    end
  end

  describe '#unknown error result' do
    before do
      stub_post('campaigns')
          .with(body: { method: 'archive', params: { SelectionCriteria: { Ids: [34_216_599] } } })
          .to_return(body: fixture('errors/unknown_campaign_error_results.json'), headers: { content_type: 'application/json; charset=utf-8', Units: '11/119918/120000' })
    end

    it 'generated raise error' do
      expect { @client.archive_campaigns(SelectionCriteria: { Ids: [34_216_599] }) }.to raise_error(YandexDirect::CampaignManagmentError)
    end
  end
end
