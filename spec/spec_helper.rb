# frozen_string_literal: true

require 'rspec'
require 'byebug'
require 'ruby_hubspot'
require 'vcr'
require 'webmock/rspec'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into(:webmock)
  config.allow_http_connections_when_no_cassette = true
end
