# frozen_string_literal: true

# Companies module adds methods for Company objects
module Companies
  include Constants

  # returns all companies
  def all_companies
    validate_access_token

    response(GET, ALL_COMPANIES)
  end

  # creates a company
  def create_company(**params)
    validate_access_token

    response(POST, INDIVIDUAL_COMPANY, params)
  end

  # shows a company
  def show_company(**params)
    validate_access_token
    id_handler(params[:id])

    response(GET, individual_company_path(params[:id]))
  end

  # updates a company
  def update_company(**params)
    validate_access_token
    id_handler(params[:id])

    params_to_update = params.dup
    params_to_update.delete(:id)

    response(PUT, individual_company_path(params[:id]), params_to_update)
  end

  # deletes a company
  def delete_company(**params)
    validate_access_token
    id_handler(params[:id])

    response(DELETE, individual_company_path(params[:id]))
  end

  # creates an idintificator
  def individual_company_path(id)
    INDIVIDUAL_COMPANY + id.to_s
  end
end
