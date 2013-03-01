class User < ActiveRecord::Base
  has_many :usages
  has_many :activities, :through => :usages
  
  def first_name
    self.id  # this will be replaed with the actual username from Facebook
  end
  
end
