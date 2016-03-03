class DeveloperProfile < ActiveRecord::Base
  validates :email, presence: true
end
