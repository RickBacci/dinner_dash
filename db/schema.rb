ActiveRecord::Schema.define(version: 20150615221847) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.decimal  "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email_address"
    t.string   "username"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
