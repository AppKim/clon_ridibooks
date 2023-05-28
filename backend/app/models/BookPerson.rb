class BookPeople < ActiveRecord::Base
  belongs_to :book
  belongs_to :person
end
