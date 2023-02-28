# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Hubspot do # rubocop:disable Metrics/BlockLength
  let(:cassette) { 'contacts_' }
  let(:hubspot)  { Hubspot.new(access_token: 'demo') }

  around(:each) do |example|
    VCR.use_cassette(cassette + example.description, allow_playback_repeats: true, &example)
  end

  it 'creates a contact' do
    expect(hubspot.create_contact(email: 'test@test.co').status).to eq(200)
  end

  it 'creates or updates a contact' do
    expect(hubspot.create_or_update_contact(email: 'test@test.co',
                                            firstname: 'test').status).to eq(200)
  end

  it 'shows all contacts' do
    expect(hubspot.all_contacts.status).to eq(200)
  end

  it 'shows a contact by email' do
    expect(hubspot.show_contact(email: 'test@test.co').status).to eq(200)
  end

  it 'shows a contact by id' do
    expect(hubspot.show_contact(id: 9351).status).to eq(200)
  end

  it 'updates a contact by email' do
    expect(hubspot.update_contact(email: 'test@test.co',
                                  firstname: 'test1').status).to eq(204)
  end

  it 'updates a contact by id' do
    expect(hubspot.update_contact(id: 9401,
                                  firstname: 'test').status).to eq(204)
  end

  it 'deletes a contact by email' do
    expect(hubspot.delete_contact(email: 'test@test.co').status).to eq(200)
  end

  it 'deletes a contact by id' do
    expect(hubspot.delete_contact(id: 9351).status).to eq(200)
  end
end
