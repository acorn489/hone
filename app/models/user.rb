class User < ActiveRecord::Base
	class NotAuthorized < StandardError
	end

	has_secure_password

	def authorize_role(role)
		raise NotAuthorized unless is_a?role
	end

	validates :username, :password_digest, presence: true
end
