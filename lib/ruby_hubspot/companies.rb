# frozen_string_literal: true

# Companies module
module Companies
  include Constants

  def all_companies
    validate_access_token

    response(GET, ALL_COMPANIES)
  end

  def create_company(**params)
    validate_access_token

    response(POST, INDIVIDUAL_COMPANY, params)
  end

  def show_company(**params)
    validate_access_token
    id_handler(params[:id])

    response(GET, individual_company_path(params[:id]))
  end

  def update_company(**params)
    validate_access_token
    id_handler(params[:id])

    params_to_update = params.dup
    params_to_update.delete(:id)

    response(PUT, individual_company_path(params[:id]), params_to_update)
  end

  def delete_company(**params)
    validate_access_token
    id_handler(params[:id])

    response(DELETE, individual_company_path(params[:id]))
  end

  def individual_company_path(id)
    INDIVIDUAL_COMPANY + id.to_s
  end
end
