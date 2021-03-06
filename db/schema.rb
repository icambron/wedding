# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20130513005805) do

  create_table "families", :force => true do |t|
    t.string  "name"
    t.boolean "responded", :default => false, :null => false
    t.boolean "admin",     :default => false, :null => false
    t.boolean "visited",   :default => false, :null => false
    t.string  "token"
  end

  create_table "gifts", :force => true do |t|
    t.integer "family_id", :null => false
    t.integer "amount"
    t.string  "stripe_id"
  end

  create_table "people", :force => true do |t|
    t.string  "name",                             :null => false
    t.boolean "attending",                        :null => false
    t.string  "email"
    t.integer "family_id"
    t.boolean "user_editable", :default => false, :null => false
    t.string  "fb_uid"
    t.string  "fb_image"
    t.string  "food"
  end

end
