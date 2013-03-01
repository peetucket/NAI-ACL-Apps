class CreateDependencies < ActiveRecord::Migration
  def self.up
    create_table :mtm_dependencies do |t|
      t.integer :equipment_id, :null=>false
      t.integer :dependent_on, :null=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :dependencies
  end
end
