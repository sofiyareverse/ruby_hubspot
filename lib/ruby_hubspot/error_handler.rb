# frozen_string_literal: true

# Error module
module ErrorHandler
  ACCESS_TOKEN_ERROR = 'Access Token should exist'

  protected

  def access_token_handler(access_token)
    raise ArgumentError, ACCESS_TOKEN_ERROR unless access_token
  end
end
