class Course < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :domains
  has_many :skills
end
