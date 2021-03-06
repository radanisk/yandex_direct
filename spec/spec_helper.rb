# frozen_string_literal: true

require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end

require 'bundler/setup'
require 'webmock/rspec'
require 'yandex_direct'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def a_post(path)
  a_request(:post, URI.join(YandexDirect::V5::Request::SANDBOX_BASE_URL, path))
end

def stub_post(path)
  stub_request(:post, URI.join(YandexDirect::V5::Request::SANDBOX_BASE_URL, path))
end

def report_post
  a_request(:post, URI.join(YandexDirect::V5::ReportRequest::SANDBOX_BASE_URL))
end

def report_stub_post
  stub_request(:post, URI.join(YandexDirect::V5::ReportRequest::SANDBOX_BASE_URL))
end

def fixture(file)
  File.new(File.join(File.expand_path('fixtures', __dir__), file))
end
