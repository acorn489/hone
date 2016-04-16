class Skill < ActiveRecord::Base
  belongs_to :domain
  belongs_to :course

  has_many :completed_student_skills
  has_many :game_skills
  has_many :games, :through => :game_skills, :foreign_key => 'skill_id'
  has_many :students, :through => :student_skill_states

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, :description, :grade, presence: true
end
