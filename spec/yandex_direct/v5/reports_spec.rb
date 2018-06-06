# frozen_string_literal: true

require 'spec_helper'

RSpec.describe YandexDirect::V5::Campaigns do
  before do
    @client = YandexDirect::Client.new(app_id: 'AI', login: 'L', token: 'T', test: true)
  end

  describe '#ctr_report' do
    context 'when resource is found' do
      before do
        report_stub_post
          .with(body: { params:
              {
                SelectionCriteria: {
                  Filter: [{
                    Field: 'CampaignId',
                    Operator: 'IN',
                    Values: [34_216_599]
                  }]
                },
                FieldNames: %w[AdId Ctr],
                ReportName: 'test report',
                ReportType: 'AD_PERFORMANCE_REPORT',
                DateRangeType: 'AUTO',
                Format: 'TSV',
                IncludeVAT: 'YES',
                IncludeDiscount: 'YES'
              } })
          .to_return(body: fixture('report_result.tsv'), headers: { content_type: 'text/tab-separated-values; charset=utf-8' }, status: 200)
      end
      it 'requests the correct resource' do
        @client.report(
          SelectionCriteria: {
            Filter: [{
              Field: 'CampaignId',
              Operator: 'IN',
              Values: [34_216_599]
            }]
          },
          FieldNames: %w[AdId Ctr],
          ReportName: 'test report',
          ReportType: 'AD_PERFORMANCE_REPORT',
          DateRangeType: 'AUTO',
          Format: 'TSV',
          IncludeVAT: 'YES',
          IncludeDiscount: 'YES'
        )
        expect(
          report_post
            .with(body: { params:
              {
                SelectionCriteria: {
                  Filter: [{
                    Field: 'CampaignId',
                    Operator: 'IN',
                    Values: [34_216_599]
                  }]
                },
                FieldNames: %w[AdId Ctr],
                ReportName: 'test report',
                ReportType: 'AD_PERFORMANCE_REPORT',
                DateRangeType: 'AUTO',
                Format: 'TSV',
                IncludeVAT: 'YES',
                IncludeDiscount: 'YES'
              } })
        ).to have_been_made
      end
    end
  end

  context 'when report is formed offline' do
    before do
      report_stub_post
        .with(body: { params:
          {
            SelectionCriteria: {
              Filter: [{
                Field: 'CampaignId',
                Operator: 'IN',
                Values: [34_216_599]
              }]
            },
            FieldNames: %w[AdId Ctr],
            ReportName: 'test report',
            ReportType: 'AD_PERFORMANCE_REPORT',
            DateRangeType: 'AUTO',
            Format: 'TSV',
            IncludeVAT: 'YES',
            IncludeDiscount: 'YES'
          } })
        .to_return(headers: { content_type: 'text/tab-separated-values; charset=utf-8' }, status: 201)
    end

    it 'generated raise error' do
      expect do
        @client.report(
          SelectionCriteria: {
            Filter: [{
              Field: 'CampaignId',
              Operator: 'IN',
              Values: [34_216_599]
            }]
          },
          FieldNames: %w[AdId Ctr],
          ReportName: 'test report',
          ReportType: 'AD_PERFORMANCE_REPORT',
          DateRangeType: 'AUTO',
          Format: 'TSV',
          IncludeVAT: 'YES',
          IncludeDiscount: 'YES'
        )
      end.to raise_error(YandexDirect::OfflineReportError)
    end
  end

  context  'when return error result' do
    before do
      report_stub_post
        .with(body: { params:
          {
            SelectionCriteria: {
              Filter: [{
                Field: 'CampaignId',
                Operator: 'IN',
                Values: [34_216_599]
              }]
            },
            FieldNames: %w[AdId Ctr],
            ReportName: 'test report',
            ReportType: 'AD_PERFORMANCE_REPORT',
            DateRangeType: 'AUTO',
            Format: 'TSV',
            IncludeVAT: 'YES',
            IncludeDiscount: 'YES'
          } })
        .to_return(body: fixture('errors/report_error_result.json'), headers: { content_type: 'application/json' },  status: 400)
    end

    it 'generated raise error' do
      expect do
        @client.report(
          SelectionCriteria: {
            Filter: [{
              Field: 'CampaignId',
              Operator: 'IN',
              Values: [34_216_599]
            }]
          },
          FieldNames: %w[AdId Ctr],
          ReportName: 'test report',
          ReportType: 'AD_PERFORMANCE_REPORT',
          DateRangeType: 'AUTO',
          Format: 'TSV',
          IncludeVAT: 'YES',
          IncludeDiscount: 'YES'
        )
      end.to raise_error(YandexDirect::Error)
    end
  end
end
