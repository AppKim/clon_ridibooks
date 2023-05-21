class BookPeople < ActiveRecord::Base
  belongs_to :book
  belongs_to :people
end
