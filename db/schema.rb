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

ActiveRecord::Schema.define(version: 2021_03_24_175300) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  
  create_table "bookstores", force: :cascade do |t|
    t.string "name"
    t.boolean "has_coffee_shop"
    t.integer "days_open_per_week"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", force: :cascade do |t|
    t.integer "bookstore_id"
    t.string "name"
    t.boolean "employee_of_the_month"
    t.integer "age"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "employees", "bookstores"

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.boolean "best_selling_author"
    t.integer "year_first_published"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.boolean "fiction"
    t.integer "number_of_pages"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "author_id"
    t.index ["author_id"], name: "index_books_on_author_id"
  end

  add_foreign_key "books", "authors"
end
