require 'faraday'

class Hubspot
  API_URL           = 'https://api.hubapi.com/'
  CONTENT_TYPE      = 'application/json'
  AUTHORIZATION_KEY = 'Bearer '

  class << self
    def config(access_token)
      @access_token = access_token
    end

    def request(http_method, path, **params)
      response(http_method, path, params)
    end

    private

    attr_reader :access_token

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
        'Content-Type':  CONTENT_TYPE
      }
    end

    def body(**params)
      {
        properties: properties(params)
      }.to_json if params
    end

    def properties(params)
      params.map do |key, value|
        { "property": key, "value": value }
      end
    end
  end
end
