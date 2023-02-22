# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ErrorHandler do
  describe 'ErrorHandler' do
    let(:hubspot) { Hubspot.new(access_token: 'demo') }

    it 'returns error if there is no access_token' do
      hubspot.access_token = nil

      expect { hubspot.request(:get, 'crm/v3/objects/contacts') }.to raise_error(ArgumentError)
    end
  end
end
