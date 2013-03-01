class MissionToMars::BaseData < ActiveRecord::Base
  set_table_name 'mission_to_mars'
  validates_presence_of :name, :description
end
