class MissionToMars::Detector < MissionToMars::BaseData
  validates_numericality_of :cost, :only_integer => true 
end
