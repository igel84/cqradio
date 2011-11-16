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

ActiveRecord::Schema.define(:version => 20111105201154) do

  create_table "images", :force => true do |t|
    t.integer  "product_id"
    t.boolean  "main"
    t.boolean  "visible",            :default => true
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menus", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.boolean  "visible",    :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.text     "info"
    t.integer  "balance"
    t.float    "price"
    t.integer  "menu_id"
    t.integer  "position"
    t.boolean  "visible",                :default => true
    t.string   "datasheet_file_name"
    t.string   "datasheet_content_type"
    t.integer  "datasheet_file_size"
    t.datetime "datasheet_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
