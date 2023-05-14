class BookPeople < ActiveRecord::Base
    belongs_to :books
    belongs_to :peoples
end
