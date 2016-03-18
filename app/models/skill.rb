class Skill < ActiveRecord::Base
  belongs_to :domain
  has_many :game_skills
  has_many :games, :through => :game_skills, :foreign_key => 'skill_id'
  has_many :students, :through => :student_skill_state, :foreign_key => 'skill_id'

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, :description, :grade, presence: true
end
