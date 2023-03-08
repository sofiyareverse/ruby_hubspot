# frozen_string_literal: true

# Error module adds new error methods
module ErrorHandler
  # access token error
  ACCESS_TOKEN_ERROR  = 'Access Token should exist'
  # email error
  EMAIL_ERROR         = 'Email should exist'
  # identificator error
  IDENTIFICATOR_ERROR = 'Email or id should exist'
  # id error
  ID_ERROR            = 'Id should exist'

  protected

  # checks access token presence
  def access_token_handler(access_token)
    raise ArgumentError, ACCESS_TOKEN_ERROR unless access_token
  end

  # checks email presence
  def email_handler(email)
    raise ArgumentError, EMAIL_ERROR unless email
  end

  # checks id presence
  def id_handler(id)
    raise ArgumentError, ID_ERROR unless id
  end

  # checks identificator presence
  def identificator_handler(identificator)
    raise ArgumentError, IDENTIFICATOR_ERROR unless identificator
  end
end
