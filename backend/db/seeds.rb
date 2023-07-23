# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
ActiveRecord::Base.establish_connection

ActiveRecord::Base.connection.disable_referential_integrity do
  ActiveRecord::Base.connection.tables.each do |table|
    next if table == 'schema_migrations'
    ActiveRecord::Base.connection.execute("TRUNCATE TABLE `#{table}`")
  end
end

SEED_DIR = Rails.root.join('db', 'seeds')
load "#{SEED_DIR}/category/category.rb"
load "#{SEED_DIR}/book_categories/book_categories.rb"
load "#{SEED_DIR}/review_comments/review_comments.rb"
load "#{SEED_DIR}/banner/banner.rb"
load "#{SEED_DIR}/publisher/publisher.rb"
load "#{SEED_DIR}/person/person.rb"
load "#{SEED_DIR}/book/book.rb"
load "#{SEED_DIR}/book/book_detail.rb"
load "#{SEED_DIR}/book/book_person.rb"
load "#{SEED_DIR}/banners/banners.rb"
load "#{SEED_DIR}/selection/selection.rb"
load "#{SEED_DIR}/book_selection/book_selection.rb"
