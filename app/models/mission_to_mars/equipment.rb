class MissionToMars::Equipment < MissionToMars::BaseData
  validates_numericality_of :cost, :only_integer => true
  has_many :dependencies
end
