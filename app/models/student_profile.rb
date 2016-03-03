class StudentProfile < ActiveRecord::Base
  validates :email, presence: true
end
