class Game < ActiveRecord::Base
  has_many :game_skills
  has_many :oauth_applications, class_name: 'Doorkeeper::Application', as: :owner
  has_many :skills, :through => :game_skills, :foreign_key => 'game_id'

  validates :title, presence: true
end
