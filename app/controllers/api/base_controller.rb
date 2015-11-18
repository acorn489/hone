class Api::BaseController < ApplicationController

	protect_from_forgery with: :null_session, only: Proc.new { |c| c.request.format.json? }
	respond_to :json

	private

	def confirm_logged_in
		unless session[:user_id]
			render :json => "Please log in"
		end
	end
end