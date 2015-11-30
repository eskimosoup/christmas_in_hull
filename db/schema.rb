# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121120093941) do

  create_table "administrators", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "last_login_at"
    t.integer  "login_count",        :default => 0
    t.boolean  "super_admin",        :default => false
    t.integer  "failed_login_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "css"
    t.string   "perishable_token",   :default => "",    :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "image_alt"
  end

  add_index "administrators", ["perishable_token"], :name => "index_administrators_on_perishable_token"

  create_table "administrators_roles", :id => false, :force => true do |t|
    t.integer "administrator_id"
    t.integer "role_id"
  end

  create_table "articles", :force => true do |t|
    t.string   "headline"
    t.text     "summary"
    t.text     "main_content"
    t.date     "date"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "image_alt"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.boolean  "recycled",           :default => false
    t.datetime "recycled_at"
    t.boolean  "display",            :default => true
    t.integer  "position",           :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "banners", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.integer  "article_id"
    t.integer  "event_id"
    t.integer  "page_id"
    t.integer  "venue_id"
    t.string   "external_link"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "image_alt"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.boolean  "recycled",           :default => false
    t.datetime "recycled_at"
    t.boolean  "display",            :default => true
    t.integer  "position",           :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.string   "document_content_type"
    t.string   "document_file_name"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.integer  "venue_id"
    t.text     "summary"
    t.text     "main_content"
    t.text     "booking_information"
    t.date     "start_date"
    t.time     "start_time",                                        :default => '2000-01-01 00:00:00'
    t.date     "end_date"
    t.time     "end_time",                                          :default => '2000-01-01 23:59:00'
    t.decimal  "price",               :precision => 5, :scale => 2, :default => 0.0
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "image_alt"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.boolean  "recycled",                                          :default => false
    t.datetime "recycled_at"
    t.boolean  "display",                                           :default => true
    t.integer  "position",                                          :default => 0
    t.boolean  "highlight",                                         :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hide_price",                                        :default => false
  end

  create_table "features", :force => true do |t|
    t.string   "name"
    t.string   "controller"
    t.string   "action"
    t.integer  "position",         :default => 0
    t.boolean  "super_admin_only", :default => false
    t.string   "css_class"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "menu",             :default => true
    t.boolean  "permission",       :default => true
    t.string   "location"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.boolean  "recycled",         :default => false
    t.datetime "recycled_at"
    t.boolean  "display",          :default => true
  end

  create_table "features_roles", :id => false, :force => true do |t|
    t.integer "feature_id"
    t.integer "role_id"
  end

  create_table "glossary_items", :force => true do |t|
    t.string   "word"
    t.text     "definition"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.string   "image_content_type"
    t.string   "image_file_name"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "newsletter_subscribers", :force => true do |t|
    t.string   "email"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.boolean  "recycled",    :default => false
    t.datetime "recycled_at"
    t.boolean  "display",     :default => true
    t.integer  "position",    :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offers", :force => true do |t|
    t.string   "company_name"
    t.text     "summary"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "logo_alt"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "image_alt"
    t.text     "description"
    t.string   "website"
    t.text     "address"
    t.string   "postcode"
    t.boolean  "display",            :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "page_contents", :force => true do |t|
    t.string   "navigation_title"
    t.string   "url_title"
    t.string   "title"
    t.integer  "page_node_id"
    t.boolean  "completed",        :default => false
    t.boolean  "published",        :default => false
    t.boolean  "active",           :default => false
    t.datetime "last_updated_at",  :default => '2010-04-29 08:55:42'
    t.text     "main_content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "meta_description"
    t.text     "meta_tags"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.boolean  "recycled",         :default => false
    t.datetime "recycled_at"
    t.boolean  "display",          :default => true
    t.integer  "position",         :default => 0
    t.string   "link"
  end

  create_table "page_nodes", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "position",              :default => 0
    t.string   "action"
    t.string   "controller"
    t.string   "model"
    t.string   "layout"
    t.boolean  "display",               :default => true
    t.boolean  "display_in_navigation", :default => true
    t.boolean  "can_be_moved",          :default => true
    t.boolean  "can_be_edited",         :default => true
    t.boolean  "can_be_deleted",        :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "access_key"
    t.string   "stylesheet"
    t.boolean  "can_have_children",     :default => true
    t.boolean  "special_menu",          :default => false
    t.integer  "created_by"
    t.integer  "updated_by"
    t.boolean  "recycled",              :default => false
    t.datetime "recycled_at"
    t.string   "ancestry"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.boolean  "all_features", :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.boolean  "recycled",     :default => false
    t.datetime "recycled_at"
    t.boolean  "display",      :default => true
  end

  create_table "site_settings", :force => true do |t|
    t.string   "name"
    t.text     "value"
    t.boolean  "super_admin_only", :default => true
    t.integer  "created_by"
    t.integer  "updated_by"
    t.boolean  "recycled",         :default => false
    t.datetime "recycled_at"
    t.boolean  "display",          :default => true
    t.string   "input_type",       :default => "text_area"
  end

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "taggable_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "image_alt"
    t.text     "address"
    t.string   "postcode"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.boolean  "recycled",           :default => false
    t.datetime "recycled_at"
    t.boolean  "display",            :default => true
    t.integer  "position",           :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
