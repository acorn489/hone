class Domain < ActiveRecord::Base
	belongs_to :course
	has_many :skills
	has_many :games, :through => :skills

	extend FriendlyId
	friendly_id :title, use: :slugged
end
