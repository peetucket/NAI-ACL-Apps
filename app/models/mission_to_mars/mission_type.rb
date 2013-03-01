class MissionToMars::MissionType < MissionToMars::BaseData
  validates_numericality_of :allowed_cost, :duration, :only_integer => true 
  validates_numericality_of :success_rate
end
