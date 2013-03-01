# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101130202408) do

  create_table "activities", :force => true do |t|
    t.string   "name",        :null => false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mission_to_mars", :force => true do |t|
    t.string   "type"
    t.string   "name",         :null => false
    t.text     "description",  :null => false
    t.integer  "sort_order"
    t.float    "success_rate"
    t.integer  "duration"
    t.integer  "allowed_cost"
    t.integer  "cost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mtm_dependencies", :force => true do |t|
    t.integer  "equipment_id", :null => false
    t.integer  "dependent_on", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mtm_user_choices", :force => true do |t|
    t.integer  "usage_id",          :null => false
    t.string   "choice_class_name", :null => false
    t.integer  "choice_id",         :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usages", :force => true do |t|
    t.integer  "user_id",     :null => false
    t.integer  "activity_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "facebook_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
