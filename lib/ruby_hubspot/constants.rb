# frozen_string_literal: true

# Constants module includes all constants
module Constants
  # hubspot api url
  API_URL            = 'https://api.hubapi.com/'
  # content type for request
  CONTENT_TYPE       = 'application/json'
  # authorization key for access
  AUTHORIZATION_KEY  = 'Bearer '
  # method get for request
  GET                = :get
  # method post for request
  POST               = :post
  # method patch for request
  PATCH              = :patch
  # method put for request
  PUT                = :put
  # method delete for request
  DELETE             = :delete
  # hubspot all contacts request path
  ALL_CONTACTS       = 'crm/v4/objects/contacts'
  # hubspot all companies request path
  ALL_COMPANIES      = 'crm/v3/properties/companies'
  # hubspot all deals request path
  ALL_DEALS          = 'crm/v4/objects/deals'
  # hubspot all submitions request path
  ALL_SUBMITIONS     = 'crm/v4/objects/feedback_submissions'
  # hubspot individual contact request path
  INDIVIDUAL_CONTACT = 'contacts/v1/contact'
  # hubspot individual company request path
  INDIVIDUAL_COMPANY = 'companies/v2/companies/'
  # hubspot individual deal request path
  INDIVIDUAL_DEAL    = 'deals/v1/deal'
  # hubspot individual sub request path
  INDIVIDUAL_SUB     = 'feedback_submissions/v1/feedback_submission'
  # hubspot create or update request path
  CREATE_OR_UPDATE   = '/createOrUpdate'
  # hubspot vid request path
  VID                = '/vid/'
  # hubspot email request path
  EMAIL              = '/email/'
  # hubspot profile request path
  PROFILE            = '/profile'
end
