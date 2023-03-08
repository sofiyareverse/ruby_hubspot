# frozen_string_literal: true

require_relative 'lib/ruby_hubspot/version'

Gem::Specification.new do |spec|
  spec.name                  = 'ruby_hubspot'
  spec.version               = RubyHubspot::VERSION
  spec.authors               = ['sofiyareverse']
  spec.homepage              = 'https://github.com/sofiyareverse/ruby_hubspot'
  spec.require_paths         = ['lib']
  spec.files                 = ['lib/ruby_hubspot.rb']
  spec.files                += Dir['lib/**/*.rb']
  spec.licenses              = ['MIT']
  spec.required_ruby_version = '>= 2.7'
  spec.summary               = 'hubspot-ruby is a wrapper for the HubSpot REST API'

  # Add runtime dependencies here
  spec.add_runtime_dependency 'faraday'
  spec.add_runtime_dependency 'rake'

  # Add development-only dependencies here
  spec.add_development_dependency('byebug')
  spec.add_development_dependency('rspec')
  spec.add_development_dependency('rubocop')
  spec.add_development_dependency('vcr')
  spec.add_development_dependency('webmock')
  spec.add_development_dependency('rdoc')
end
