class MissionToMars::UserChoice < ActiveRecord::Base
 
  set_table_name 'mtm_user_choices'
  belongs_to :usage
  
end
