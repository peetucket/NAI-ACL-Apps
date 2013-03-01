require 'set'

class MissionToMars::YourMission < Usage

  def mission_type
    mission_choice=MissionToMars::UserChoice.find_by_usage_id_and_choice_class_name(self.id,"MissionToMars::MissionType")
    mission=MissionToMars::MissionType.find_by_id(mission_choice.choice_id) if mission_choice
  end
  
  def mission_name
    mission_type.name if mission_type
  end
  
  def equipment
    get_items "Equipment" 
  end

  def detectors
    get_items "Detector" 
  end  
  
  def all_items
    self.equipment+self.detectors
  end
  
  def over_weight?
    total_weight=ActiveRecord::Base.connection.select_value("select sum(cost) as total_weight from mission_to_mars as MTM JOIN mtm_user_choices as UC ON UC.choice_id=MTM.id where (MTM.type='MissionToMars::Detector' OR MTM.type='MissionToMars::Equipment') AND UC.usage_id="+self.id.to_s)
    total_weight.to_i > self.mission_type.allowed_cost
  end
  
  def dependency_missing?
    all_item_ids=self.all_items.map {|x| x.id}.to_set
    missing=false
    self.equipment.each do |item|
      dependencies=item.dependencies.map {|x| x.dependent_on}.to_set
      missing=(!dependencies.empty? && all_item_ids.intersection(dependencies).empty?) if !missing
    end
    return missing
  end

  private
  def get_items(item_type)
    items = []
    class_name="MissionToMars::" + item_type
    choices=MissionToMars::UserChoice.find_all_by_usage_id_and_choice_class_name(self.id,class_name)
    eval "choices.each {|choice| items << " + class_name + ".find_by_id(choice.choice_id)}" if choices
    return items
  end
  
end
