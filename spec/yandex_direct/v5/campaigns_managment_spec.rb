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
        .to_return(body: fixture('archive_results.json'), headers: { content_type: 'application/json; charset=utf-8', Units: '11/119918/120000' })
    end

    it 'requests the correct resource' do
      @client.archive_campaigns(SelectionCriteria: { Ids: [34_216_599] })
      expect(
        a_post('campaigns')
          .with(body: { method: 'archive', params: { SelectionCriteria: { Ids: [34_216_599] } } })
      ).to have_been_made
    end

    it 'returns the specified campaigns' do
      result = @client.archive_campaigns(SelectionCriteria: { Ids: [34_216_599] })
      expect(result).to be_a Hash
      expect(result['ArchiveResults']).to be_an Array
      expect(result['ArchiveResults'].first).to be_a Hash
      expect(result['ArchiveResults'].first['Id']).to eq(34_216_599)
    end
  end

  describe '#delete_campaigns' do
    before do
      stub_post('campaigns')
        .with(body: { method: 'delete', params: { SelectionCriteria: { Ids: [34_216_599] } } })
        .to_return(body: fixture('delete_results.json'), headers: { content_type: 'application/json; charset=utf-8', Units: '11/119918/120000' })
    end

    it 'requests the correct resource' do
      @client.delete_campaigns(SelectionCriteria: { Ids: [34_216_599] })
      expect(
        a_post('campaigns')
          .with(body: { method: 'delete', params: { SelectionCriteria: { Ids: [34_216_599] } } })
      ).to have_been_made
    end

    it 'returns the specified campaigns' do
      result = @client.delete_campaigns(SelectionCriteria: { Ids: [34_216_599] })
      expect(result).to be_a Hash
      expect(result['DeleteResults']).to be_an Array
      expect(result['DeleteResults'].first).to be_a Hash
      expect(result['DeleteResults'].first['Id']).to eq(34_216_599)
    end
  end

  describe '#resume_campaigns' do
    before do
      stub_post('campaigns')
        .with(body: { method: 'resume', params: { SelectionCriteria: { Ids: [34_216_599] } } })
        .to_return(body: fixture('resume_results.json'), headers: { content_type: 'application/json; charset=utf-8', Units: '11/119918/120000' })
    end

    it 'requests the correct resource' do
      @client.resume_campaigns(SelectionCriteria: { Ids: [34_216_599] })
      expect(
        a_post('campaigns')
          .with(body: { method: 'resume', params: { SelectionCriteria: { Ids: [34_216_599] } } })
      ).to have_been_made
    end

    it 'returns the specified campaigns' do
      result = @client.resume_campaigns(SelectionCriteria: { Ids: [34_216_599] })
      expect(result).to be_a Hash
      expect(result['ResumeResults']).to be_an Array
      expect(result['ResumeResults'].first).to be_a Hash
      expect(result['ResumeResults'].first['Id']).to eq(34_216_599)
    end
  end

  describe '#suspend_campaigns' do
    before do
      stub_post('campaigns')
        .with(body: { method: 'suspend', params: { SelectionCriteria: { Ids: [34_216_599] } } })
        .to_return(body: fixture('suspend_results.json'), headers: { content_type: 'application/json; charset=utf-8', Units: '11/119918/120000' })
    end

    it 'requests the correct resource' do
      @client.suspend_campaigns(SelectionCriteria: { Ids: [34_216_599] })
      expect(
        a_post('campaigns')
            .with(body: { method: 'suspend', params: { SelectionCriteria: { Ids: [34_216_599] } } })
      ).to have_been_made
    end

    it 'returns the specified campaigns' do
      result = @client.suspend_campaigns(SelectionCriteria: { Ids: [34_216_599] })
      expect(result).to be_a Hash
      expect(result['SuspendResults']).to be_an Array
      expect(result['SuspendResults'].first).to be_a Hash
      expect(result['SuspendResults'].first['Id']).to eq(34_216_599)
    end
  end

  describe '#unarchive_campaigns' do
    before do
      stub_post('campaigns')
          .with(body: { method: 'unarchive', params: { SelectionCriteria: { Ids: [34_216_599] } } })
          .to_return(body: fixture('unarchive_results.json'), headers: { content_type: 'application/json; charset=utf-8', Units: '11/119918/120000' })
    end

    it 'requests the correct resource' do
      @client.unarchive_campaigns(SelectionCriteria: { Ids: [34_216_599] })
      expect(
        a_post('campaigns')
          .with(body: { method: 'unarchive', params: { SelectionCriteria: { Ids: [34_216_599] } } })
      ).to have_been_made
    end

    it 'returns the specified campaigns' do
      result = @client.unarchive_campaigns(SelectionCriteria: { Ids: [34_216_599] })
      expect(result).to be_a Hash
      expect(result['UnarchiveResults']).to be_an Array
      expect(result['UnarchiveResults'].first).to be_a Hash
      expect(result['UnarchiveResults'].first['Id']).to eq(34_216_599)
    end
  end

  describe '#update_campaigns' do
    before do
      stub_post('campaigns')
        .with(body: { method: 'update', params: { Campaigns: [Id: 34_216_599] } })
        .to_return(body: fixture('update_results.json'), headers: { content_type: 'application/json; charset=utf-8', Units: '11/119918/120000' })
    end

    it 'requests the correct resource' do
      @client.update_campaigns(Campaigns: [Id: 34_216_599])
      expect(
        a_post('campaigns')
            .with(body: { method: 'update', params: { Campaigns: [Id: 34_216_599]}})
      ).to have_been_made
    end

    it 'returns the specified campaigns' do
      result = @client.update_campaigns(Campaigns: [Id: 34_216_599])
      expect(result).to be_a Hash
      expect(result['UpdateResults']).to be_an Array
      expect(result['UpdateResults'].first).to be_a Hash
      expect(result['UpdateResults'].first['Id']).to eq(34_216_599)
    end
  end
end
