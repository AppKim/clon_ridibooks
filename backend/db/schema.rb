# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_07_02_175007) do
  create_table "banners", charset: "utf8mb4", force: :cascade do |t|
    t.string "image_url", limit: 50, comment: "バナーリンク"
    t.string "link_url", limit: 50, comment: "セレクションリンク"
    t.string "title", null: false, comment: "イメージの説明"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book_categories", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_categories_on_book_id"
    t.index ["category_id"], name: "index_book_categories_on_category_id"
  end

  create_table "book_details", charset: "utf8mb4", force: :cascade do |t|
    t.string "format", null: false, comment: "ファイル形式"
    t.integer "size", null: false, comment: "電子版の容量"
    t.integer "letter_count", null: false, comment: "文字数"
    t.bigint "book_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_details_on_book_id"
  end

  create_table "book_people", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_people_on_book_id"
    t.index ["person_id"], name: "index_book_people_on_person_id"
  end

  create_table "book_selections", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "selection_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_selections_on_book_id"
    t.index ["selection_id"], name: "index_book_selections_on_selection_id"
  end

  create_table "books", charset: "utf8mb4", force: :cascade do |t|
    t.string "title", null: false
    t.string "content", comment: "目次"
    t.string "introduction", comment: "紹介文"
    t.string "thumnail"
    t.string "publisher_review", comment: "出版社レビュー"
    t.date "ebook_publish_date", comment: "電子版公開日"
    t.date "paper_book_publish_date", comment: "紙版公開日"
    t.bigint "publisher_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publisher_id"], name: "index_books_on_publisher_id"
    t.index ["title"], name: "index_books_on_title"
  end

  create_table "categories", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.integer "depth", default: 0
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", charset: "utf8mb4", force: :cascade do |t|
    t.integer "person_type", comment: "0: author 1: translator"
    t.string "name", limit: 50, null: false, comment: "人の名前"
    t.string "introduction", limit: 50, null: false, comment: "人についての紹介"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publishers", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "review_comments", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.string "reviewer", null: false
    t.integer "review_type", default: 0
    t.string "comment", null: false
    t.integer "spoiler", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_review_comments_on_book_id"
  end

  create_table "selections", charset: "utf8mb4", force: :cascade do |t|
    t.string "title", limit: 50, null: false, comment: "セレクションテーマ"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "book_categories", "books"
  add_foreign_key "book_categories", "categories"
  add_foreign_key "book_details", "books"
  add_foreign_key "book_people", "books"
  add_foreign_key "book_people", "people"
  add_foreign_key "book_selections", "books"
  add_foreign_key "book_selections", "selections"
  add_foreign_key "books", "publishers"
  add_foreign_key "review_comments", "books"
end
