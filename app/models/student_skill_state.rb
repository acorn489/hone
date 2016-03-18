class StudentSkillState < ActiveRecord::Base
  belongs_to :student, dependent: :destroy
  belongs_to :skill, dependent: :destroy
end
