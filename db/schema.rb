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

ActiveRecord::Schema.define(version: 2019_07_17_051120) do

  create_table "admin_product_images", force: :cascade do |t|
    t.integer "product_id"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
  end

  create_table "admin_users_stores", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "store_id"
    t.index ["store_id"], name: "index_admin_users_stores_on_store_id"
    t.index ["user_id"], name: "index_admin_users_stores_on_user_id"
  end

  create_table "order_products", force: :cascade do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.decimal "price", precision: 8, scale: 2
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_products_on_order_id"
    t.index ["product_id"], name: "index_order_products_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.decimal "total", precision: 8, scale: 2
    t.decimal "discount", precision: 8, scale: 2
    t.decimal "shipping_amount", precision: 8, scale: 2
    t.text "notes"
    t.integer "payment_status", default: 0
    t.integer "fulfillment_status", default: 0
    t.integer "status", default: 0
    t.integer "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_orders_on_store_id"
  end

  create_table "product_images", force: :cascade do |t|
    t.integer "product_id"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "type"
    t.decimal "price", precision: 8, scale: 2
    t.decimal "compare_at_price", precision: 8, scale: 2
    t.decimal "cost_per_item", precision: 8, scale: 2
    t.integer "quantity"
    t.boolean "allow_out_of_stock_purchase", default: false
    t.boolean "active", default: true
    t.integer "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_products_on_store_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "subdomain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.index ["subdomain"], name: "index_stores_on_subdomain"
  end

end
