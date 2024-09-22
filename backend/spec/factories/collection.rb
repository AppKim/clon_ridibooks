FactoryBot.define do
    factory :collection do
        title { "TestSelection" }
        collection_type { "COLLECTION" }

        trait :fixed_id do
            id { 1 }
        end

        trait :spotlight do
            collection_type { "SPOTLIGHT" }
        end
    end
end