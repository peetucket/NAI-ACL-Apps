class MissionToMarsController < ApplicationController
  
  @@activity=Activity.find_by_name('Mission To Mars')
  
  def index
    
    @activity=@@activity
    
    user_id=params[:user_id] || "1" # TODO: this will be replaced with the facebook ID later
        
    session[:user_id] = user_id
    
    @user=User.find(session[:user_id],:include=>:usages)
        
    usage=@user.usages[0] || Usage.create(:user_id=>user_id,:activity_id=>@activity.id)
    @mission_types=MissionToMars::MissionType.find(:all, :order=>:sort_order)
    @equipment=MissionToMars::Equipment.find(:all, :order=>:sort_order)
    @detectors=MissionToMars::Detector.find(:all, :order=>:sort_order)

    @your_mission=MissionToMars::YourMission.find(usage.id)
    
    @your_equipment=@your_mission.equipment
    @your_detectors=@your_mission.detectors
    
  end
  
  # ajax only request
  def save_user_choice
    
    return if not request.xhr?
   
    @user=User.find(session[:user_id],:include=>:usages)
    
    choice_class_name="MissionToMars::" + params[:choice_class_name]
    choice_id=params[:choice_id]
    checked=params[:checked]

    @your_mission=MissionToMars::YourMission.find(@user.usages[0]) # just get the first usage (mission) for now...the database does support multiple missions for a given user, but not the UI currently
    
    user_choice_type=MissionToMars::UserChoice.find_by_usage_id_and_choice_class_name(@your_mission.id,choice_class_name) # see if a user has made a choice of this type before
    user_choice=MissionToMars::UserChoice.find_by_usage_id_and_choice_class_name_and_choice_id(@your_mission.id,choice_class_name,choice_id) # see if a user has made this exact choice before
    
    if user_choice_type && user_choice_type.choice_class_name.index("MissionType") # if the choice type exists and it's a mission type, we can only have one, so just update it    
      user_choice_type.update_attribute(:choice_id,choice_id)
    elsif user_choice && checked.to_s == "false" # user has unchecked their choice, so delete it
      user_choice.delete
    elsif not user_choice # user has never made this choice before
      new_user_choice=MissionToMars::UserChoice.create(:usage_id=>@your_mission.id,:choice_class_name=>choice_class_name,:choice_id=>choice_id)      # add it
    end 
    
    @your_mission.reload
        
    render :partial=>'your_mission'
  
  end
      
end
