class CreateUserChoices < ActiveRecord::Migration
  def self.up
    create_table :mtm_user_choices do |t|
      t.integer :usage_id, :null=>false
      t.string :choice_class_name, :null=>false
      t.integer :choice_id, :null=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :user_choices
  end
end
