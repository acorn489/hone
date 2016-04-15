class Game < ActiveRecord::Base
  has_many :game_skills
  has_many :oauth_applications, class_name: 'Doorkeeper::Application', as: :owner
  has_many :skills, :through => :game_skills, :foreign_key => 'game_id'
  has_one :developer

  attr_accessor :redirect_uri
  attr_accessor :skills_list

  after_create :create_application_and_skills

  validates :title, presence: true

  def create_application_and_skills
    app = Doorkeeper::Application.create(:owner => self, :name => self.title, :redirect_uri => redirect_uri)
    unless app.valid?
      raise Exceptions::OAuthApplicationCreateFailed.new(app.errors.full_messages.to_sentence)
    end
    skills_list&.drop(1)&.each do |item|
      skill = GameSkill.create(:game_id => self.id, :skill_id => item)
      unless skill.valid?
        raise Exceptions::GameSkillCreateFailed.new(app.errors.full_messages.to_sentence)
      end
    end
  end
end
