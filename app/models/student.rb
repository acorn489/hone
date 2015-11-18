class Student < ActiveRecord::Base

	has_secure_password

	has_many :scores, dependent: :destroy
	has_many :games, :through => :scores
	has_many :passes, dependent: :destroy
	has_many :skills, :through => :passes
	has_many :levels, dependent: :destroy
	has_many :courses, :through => :levels
	has_many :unlocks, dependent: :destroy
	has_many :games, :through => :unlocks

	validates :username, :password_digest, :email, presence: true

end
