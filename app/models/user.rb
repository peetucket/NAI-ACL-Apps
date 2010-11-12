class User < ActiveRecord::Base
  has_many :usages
  has_many :activities, :through => :usages
end
