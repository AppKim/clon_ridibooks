FactoryBot.define do
    factory :book_collection do
        sequence(:id, 1) {|n| n}
        association :book
        association :collection
    end
end