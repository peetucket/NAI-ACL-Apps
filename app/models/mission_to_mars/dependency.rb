class MissionToMars::Dependency < ActiveRecord::Base
  
  set_table_name 'mtm_dependencies'
  
  belongs_to :equipment
  
  def item
    MissionToMars::Equipment.find_by_id(self.dependent_on) || MissionToMars::Detector.find_by_id(self.dependent_on)
  end
  
end
