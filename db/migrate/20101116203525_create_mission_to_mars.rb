class CreateMissionToMars < ActiveRecord::Migration
  def self.up
    create_table :mission_to_mars do |t|

      # allows inheritance
      t.string :type
      
      # common to all classes
      t.string :name, :null=>false
      t.text :description, :null=>false
      t.integer :sort_order
      
      # mission type class
      t.float :success_rate
      t.integer :duration
      t.integer :allowed_cost
      
      # equipment class
      t.integer :cost
      
      t.timestamps

    end
  end

  def self.down
    drop_table :mission_to_mars
  end
end
