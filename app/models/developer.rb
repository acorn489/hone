class Developer < ActiveRecord::Base
	has_secure_password

	validates :username, :password_digest, :email, presence: true

end
