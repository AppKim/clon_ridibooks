FactoryBot.define do
    factory :selection do
        title { "TestSelection" }
        selection_type { "COLLECTION" }

        trait :fixed_id do
            id { 1 }
        end

        trait :spotlight do
            selection_type { "SPOTLIGHT" }
        end
    end
end