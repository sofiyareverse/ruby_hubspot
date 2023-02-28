# frozen_string_literal: true

# Constants module
module Constants
  API_URL            = 'https://api.hubapi.com/'
  CONTENT_TYPE       = 'application/json'
  AUTHORIZATION_KEY  = 'Bearer '
  GET                = :get
  POST               = :post
  PATCH              = :patch
  PUT                = :put
  DELETE             = :delete
  ALL_CONTACTS       = 'crm/v4/objects/contacts'
  ALL_COMPANIES      = 'crm/v3/properties/companies'
  ALL_DEALS          = 'crm/v4/objects/deals'
  ALL_SUBMITIONS     = 'crm/v4/objects/feedback_submissions'
  INDIVIDUAL_CONTACT = 'contacts/v1/contact'
  INDIVIDUAL_COMPANY = 'companies/v2/companies/'
  INDIVIDUAL_DEAL    = 'deals/v1/deal'
  INDIVIDUAL_SUB     = 'feedback_submissions/v1/feedback_submission'
  CREATE_OR_UPDATE   = '/createOrUpdate'
  VID                = '/vid/'
  EMAIL              = '/email/'
  PROFILE            = '/profile'
end
