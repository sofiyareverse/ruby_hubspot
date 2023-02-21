require 'spec_helper'

RSpec.describe Hubspot do
  describe 'Hubspot endpoints' do
    let(:cassette) { 'candidates_' }
    let!(:config)  { Hubspot.config('demo') }

    around(:each) do |example|
      VCR.use_cassette(cassette + example.description, allow_playback_repeats: true, &example)
    end

    it 'creates a contact' do
      expect(Hubspot.request(:post, 'contacts/v1/contact/createOrUpdate/email/test@test.com', email: 'test@test.com').status).to eq(200)
    end

    it 'updates a contact' do
      expect(Hubspot.request(:post, 'contacts/v1/contact/createOrUpdate/email/jordy@corkery.com', firstname: 'jordy').status).to eq(200)
    end

    it 'returns all contacts' do
      expect(Hubspot.request(:get, 'crm/v3/objects/contacts').status).to eq(200)
    end

    it 'does not create a contact' do
      #  with existing email when path contains another email
      expect(Hubspot.request(:post, 'contacts/v1/contact/createOrUpdate/email/test@test.com', email: 'jordy@corkery.com').status).to eq(409)
    end

    it 'does not update a contact' do
      #  when param does not exist on HubSpot
      expect(Hubspot.request(:post, 'contacts/v1/contact/createOrUpdate/email/jordy@corkery.com', first_name: 'jordy').status).to eq(400)
    end
  end
end
