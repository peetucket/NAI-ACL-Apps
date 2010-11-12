class Step < ActiveRecord::Base
  belongs_to :activity
  has_many :choices
end
