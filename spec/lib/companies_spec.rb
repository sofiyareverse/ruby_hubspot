# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Hubspot do
  let(:cassette) { 'companies_' }
  let(:hubspot)  { Hubspot.new(access_token: 'demo') }

  around(:each) do |example|
    VCR.use_cassette(cassette + example.description, allow_playback_repeats: true, &example)
  end

  it 'creates a company' do
    expect(hubspot.create_company(domain: 'test.test.com',
                                  name: 'test').status).to eq(200)
  end

  it 'shows a company' do
    expect(hubspot.show_company(id: '7107010539').status).to eq(200)
  end

  it 'updates a company' do
    expect(hubspot.update_company(id: '7107010539', name: 'test1').status).to eq(200)
  end

  it 'deletes a company' do
    expect(hubspot.delete_company(id: '7107010539').status).to eq(200)
  end

  it 'shows all companies' do
    expect(hubspot.all_companies.status).to eq(200)
  end
end
