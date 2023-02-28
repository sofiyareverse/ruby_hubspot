# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ErrorHandler do
  describe 'ErrorHandler' do
    let(:hubspot) { Hubspot.new(access_token: 'demo') }

    it 'returns error if there is no access_token' do
      hubspot.access_token = nil

      expect { hubspot.request(:get, 'crm/v3/objects/contacts') }.to raise_error(ArgumentError)
    end

    it 'returns error if there is no company id' do
      expect { hubspot.show_company(id: nil) }.to raise_error(ArgumentError)
    end

    it 'returns error if there is no contact email' do
      expect { hubspot.show_contact(email: nil) }.to raise_error(ArgumentError)
    end
  end
end
