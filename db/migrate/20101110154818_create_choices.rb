class CreateChoices < ActiveRecord::Migration
  def self.up
    create_table :choices do |t|
      t.integer :step_id, :null=>false
      t.string :name, :null=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :choices
  end
end
