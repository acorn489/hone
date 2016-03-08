class SessionsController < Devise::SessionsController
	before_action :authenticate_user!

	def create
		rtn = super
		sign_in(resource.type.underscore, resource.type.constantize.send(:find, resource.id)) unless resource.type.nil?
		rtn
	end
end
