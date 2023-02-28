# frozen_string_literal: true

# Contacts module
module Contacts
  include Constants

  def all_contacts
    validate_access_token

    response(GET, ALL_CONTACTS)
  end

  def create_contact(**params)
    validate_access_token

    response(POST, INDIVIDUAL_CONTACT, params)
  end

  def create_or_update_contact(**params)
    validate_access_token
    email_handler(params[:email])

    response(POST, INDIVIDUAL_CONTACT + CREATE_OR_UPDATE + EMAIL + params[:email].to_s, params)
  end

  def show_contact(**params)
    validate_access_token

    response(GET, INDIVIDUAL_CONTACT + find_idintificator(params) + PROFILE)
  end

  def update_contact(**params)
    validate_access_token

    params_to_update = params.dup
    params_to_update.delete(:id)

    response(POST, INDIVIDUAL_CONTACT + find_idintificator(params) + PROFILE, params_to_update)
  end

  def delete_contact(**params)
    validate_access_token

    response(DELETE, INDIVIDUAL_CONTACT + find_idintificator(params))
  end

  def find_idintificator(params)
    identificator_handler(
      %i[email id].any? do |key|
        if params.key?(key)
          identificator_handler(params[key])

          return key == :email ? EMAIL + params[key].to_s : VID + params[key].to_s
        end
      end
    )
  end
end
