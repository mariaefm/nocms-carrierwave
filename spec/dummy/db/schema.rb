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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140320090716) do

  create_table "no_cms_carrierwave_attachment_translations", force: true do |t|
    t.integer "no_cms_carrierwave_attachment_id"
    t.string  "locale"
    t.string  "attachment"
    t.string  "name"
    t.text    "description"
  end

  add_index "no_cms_carrierwave_attachment_translations", ["no_cms_carrierwave_attachment_id"], name: "no_cms_carr_img_on_translations"

  create_table "no_cms_carrierwave_attachments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
