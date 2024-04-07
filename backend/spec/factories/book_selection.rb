FactoryBot.define do
    factory :book_selection do
        sequence(:id, 1) {|n| n}
        association :book
        association :selection
    end
end