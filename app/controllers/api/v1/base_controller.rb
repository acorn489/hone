class Api::V1::BaseController < ApplicationController

  protect_from_forgery with: :null_session, only: Proc.new { |c| c.request.format.json? }
  respond_to :json

  def authenticate_user
    current_user || not_authorized
  end

  def not_authorized
    render nothing: true, status: :unauthorized
  end

end
