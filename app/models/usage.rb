class Usage < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :activity
  
  # for mission_to_mars
  has_many :user_choices
  
end

