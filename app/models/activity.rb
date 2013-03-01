class Activity < ActiveRecord::Base
  has_many :usages
  has_many :users, :through => :usages
end
