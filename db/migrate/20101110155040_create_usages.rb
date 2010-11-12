class CreateUsages < ActiveRecord::Migration
  def self.up
    create_table :usages do |t|
      t.integer :user_id, :null=>false
      t.integer :activity_id, :null=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :usages
  end
end
