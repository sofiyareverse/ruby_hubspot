# frozen_string_literal: true

require 'faraday'
require_relative 'error_handler'
require_relative 'constants'

# Hubspot main
class Hubspot
  include ErrorHandler
  include Constants

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
      request.body = body(params)
    end
  end

  def headers
    {
      'Authorization': AUTHORIZATION_KEY + access_token,
      'Content-Type': CONTENT_TYPE
    }
  end

  def body(**params)
    return unless params

    {
      properties: properties(params)
    }.to_json
  end

  def properties(params)
    params.map do |key, value|
      { "property": key, "value": value }
    end
  end

  def validate_access_token
    access_token_handler(@access_token)
  end
end
