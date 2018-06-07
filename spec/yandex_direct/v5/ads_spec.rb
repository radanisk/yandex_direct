# frozen_string_literal: true

require 'spec_helper'

RSpec.describe YandexDirect::V5::Ads do
  before do
    @client = YandexDirect::Client.new(app_id: 'AI', login: 'L', token: 'T', test: true)
  end

  describe '#add_ads' do
    before do
      stub_post('ads')
        .with(
          body: {
            method: 'add',
            params: {
              Ads: {
                AdGroupId: 34_216_599,
                TextAd: {
                  Title: 'title',
                  Text: 'text',
                  Mobile: 'NO',
                  Href: 'test.ru'
                }
              }
            }
          }
        ).to_return(body: fixture('add_results.json'), headers: { content_type: 'application/json; charset=utf-8', Units: '11/119918/120000' })
    end

    it 'requests the correct resource' do
      @client.add_ads(
        Ads: {
          AdGroupId: 34_216_599,
          TextAd: {
            Title: 'title',
            Text: 'text',
            Mobile: 'NO',
            Href: 'test.ru'
          }
        }
      )
      expect(
        a_post('ads').with(
          body: {
            method: 'add',
            params: {
              Ads: {
                AdGroupId: 34_216_599,
                TextAd: {
                  Title: 'title',
                  Text: 'text',
                  Mobile: 'NO',
                  Href: 'test.ru'
                }
              }
            }
          }
        )
      ).to have_been_made
    end

    it 'returns the IDs of added ads' do
      result = @client.add_ads(
        Ads: {
          AdGroupId: 34_216_599,
          TextAd: {
            Title: 'title',
            Text: 'text',
            Mobile: 'NO',
            Href: 'test.ru'
          }
        }
      )
      expect(result).to be_a Hash
      expect(result['AddResults']).to be_an Array
      expect(result['AddResults'].first).to be_a Hash
      expect(result['AddResults'].first['Id']).to eq(34_302_671)
    end
  end
  describe '#ads' do
    before do
      stub_post('ads')
        .with(
          body: {
            method: 'get',
            params: {
              SelectionCriteria: { Ids: [34_216_599] },
              FieldNames: %w[AdCategories AgeLabel AdGroupId CampaignId Id State Status StatusClarification Type],
              TextAdFieldNames: %w[Text]
            }
          }
        )
        .to_return(body: fixture('ads.json'), headers: { content_type: 'application/json; charset=utf-8', Units: '11/119918/120000' })
    end
    it 'requests the correct resource' do
      @client.ads(
        SelectionCriteria: { Ids: [34_216_599] },
        FieldNames: %w[AdCategories AgeLabel AdGroupId CampaignId Id State Status StatusClarification Type],
        TextAdFieldNames: %w[Text]
      )
      expect(
        a_post('ads')
          .with(
            body: {
              method: 'get',
              params: {
                SelectionCriteria: { Ids: [34_216_599] },
                FieldNames: %w[AdCategories AgeLabel AdGroupId CampaignId Id State Status StatusClarification Type],
                TextAdFieldNames: %w[Text]
              }
            }
          )
      ).to have_been_made
    end
    it 'returns the specified ads' do
      result = @client.ads(
        SelectionCriteria: { Ids: [34_216_599] },
        FieldNames: %w[AdCategories AgeLabel AdGroupId CampaignId Id State Status StatusClarification Type],
        TextAdFieldNames: %w[Text]
      )
      expect(result).to be_a Hash
      expect(result['Ads']).to be_an Array
      expect(result['Ads'].first).to be_a Hash
      expect(result['Ads'].first['Id']).to eq(34_216_599)
    end
  end

  describe '#archive_ads' do
    before do
      stub_post('ads')
        .with(body: { method: 'archive', params: { SelectionCriteria: { Ids: [34_216_599] } } })
        .to_return(body: fixture('archive_results.json'), headers: { content_type: 'application/json; charset=utf-8', Units: '11/119918/120000' })
    end

    it 'requests the correct resource' do
      @client.archive_ads(SelectionCriteria: { Ids: [34_216_599] })
      expect(
        a_post('ads')
          .with(body: { method: 'archive', params: { SelectionCriteria: { Ids: [34_216_599] } } })
      ).to have_been_made
    end

    it 'returns the IDs of archived ads' do
      result = @client.archive_ads(SelectionCriteria: { Ids: [34_216_599] })
      expect(result).to be_a Hash
      expect(result['ArchiveResults']).to be_an Array
      expect(result['ArchiveResults'].first).to be_a Hash
      expect(result['ArchiveResults'].first['Id']).to eq(34_216_599)
    end
  end

  describe '#delete_ads' do
    before do
      stub_post('ads')
        .with(body: { method: 'delete', params: { SelectionCriteria: { Ids: [34_216_599] } } })
        .to_return(body: fixture('delete_results.json'), headers: { content_type: 'application/json; charset=utf-8', Units: '11/119918/120000' })
    end

    it 'requests the correct resource' do
      @client.delete_ads(SelectionCriteria: { Ids: [34_216_599] })
      expect(
        a_post('ads')
          .with(body: { method: 'delete', params: { SelectionCriteria: { Ids: [34_216_599] } } })
      ).to have_been_made
    end

    it 'returns the IDs of deleted ads' do
      result = @client.delete_ads(SelectionCriteria: { Ids: [34_216_599] })
      expect(result).to be_a Hash
      expect(result['DeleteResults']).to be_an Array
      expect(result['DeleteResults'].first).to be_a Hash
      expect(result['DeleteResults'].first['Id']).to eq(34_216_599)
    end
  end

  describe '#moderate_ads' do
    before do
      stub_post('ads')
        .with(body: { method: 'moderate', params: { SelectionCriteria: { Ids: [34_216_599] } } })
        .to_return(body: fixture('moderate_results.json'), headers: { content_type: 'application/json; charset=utf-8', Units: '11/119918/120000' })
    end

    it 'requests the correct resource' do
      @client.moderate_ads(SelectionCriteria: { Ids: [34_216_599] })
      expect(
        a_post('ads')
          .with(body: { method: 'moderate', params: { SelectionCriteria: { Ids: [34_216_599] } } })
      ).to have_been_made
    end

    it 'returns the IDs of moderated ads' do
      result = @client.moderate_ads(SelectionCriteria: { Ids: [34_216_599] })
      expect(result).to be_a Hash
      expect(result['ModerateResults']).to be_an Array
      expect(result['ModerateResults'].first).to be_a Hash
      expect(result['ModerateResults'].first['Id']).to eq(34_216_599)
    end
  end

  describe '#suspend_ads' do
    before do
      stub_post('ads')
        .with(body: { method: 'suspend', params: { SelectionCriteria: { Ids: [34_216_599] } } })
        .to_return(body: fixture('suspend_results.json'), headers: { content_type: 'application/json; charset=utf-8', Units: '11/119918/120000' })
    end

    it 'requests the correct resource' do
      @client.suspend_ads(SelectionCriteria: { Ids: [34_216_599] })
      expect(
        a_post('ads')
            .with(body: { method: 'suspend', params: { SelectionCriteria: { Ids: [34_216_599] } } })
      ).to have_been_made
    end

    it 'returns the IDs of suspended ads' do
      result = @client.suspend_ads(SelectionCriteria: { Ids: [34_216_599] })
      expect(result).to be_a Hash
      expect(result['SuspendResults']).to be_an Array
      expect(result['SuspendResults'].first).to be_a Hash
      expect(result['SuspendResults'].first['Id']).to eq(34_216_599)
    end
  end
end
