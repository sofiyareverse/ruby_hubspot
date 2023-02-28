# frozen_string_literal: true

# Error module
module ErrorHandler
  ACCESS_TOKEN_ERROR  = 'Access Token should exist'
  EMAIL_ERROR         = 'Email should exist'
  IDENTIFICATOR_ERROR = 'Email or id should exist'
  ID_ERROR            = 'Id should exist'

  protected

  def access_token_handler(access_token)
    raise ArgumentError, ACCESS_TOKEN_ERROR unless access_token
  end

  def email_handler(email)
    raise ArgumentError, EMAIL_ERROR unless email
  end

  def id_handler(id)
    raise ArgumentError, ID_ERROR unless id
  end

  def identificator_handler(identificator)
    raise ArgumentError, IDENTIFICATOR_ERROR unless identificator
  end
end
