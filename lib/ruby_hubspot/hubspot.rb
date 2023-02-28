# frozen_string_literal: true

require 'faraday'
require_relative 'error_handler'
require_relative 'constants'
require_relative 'contacts'
require_relative 'companies'

# Hubspot main
class Hubspot
  include ErrorHandler
  include Constants
  include Contacts
  include Companies

  attr_accessor :access_token

  def initialize(access_token:)
    @access_token = access_token
  end

  def request(http_method, path, **params)
    validate_access_token

    response(http_method, path, params)
  end

  private

  def response(http_method, path, **params)
    Faraday.send(http_method) do |request|
      request.url(API_URL + path)
      request.headers = headers
      request.body = body(path, params)
    end
  end

  def headers
    {
      'Authorization': AUTHORIZATION_KEY + access_token,
      'Content-Type': CONTENT_TYPE
    }
  end

  def body(path, **params)
    return unless params

    {
      properties: properties(path, params)
    }.to_json
  end

  def properties(path, params)
    return special_fields(params) if path.include? INDIVIDUAL_COMPANY

    usual_fields(params)
  end

  def special_fields(params)
    params.map do |key, value|
      { "name": key, "value": value }
    end
  end

  def usual_fields(params)
    params.map do |key, value|
      { "property": key, "value": value }
    end
  end

  def validate_access_token
    access_token_handler(@access_token)
  end
end
