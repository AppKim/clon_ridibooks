FactoryBot.define do
    factory :banner do
        image_url { "https://picsum.photos/200" }
        link_url { "http://localhost:8080/select" }
        title { "미리 보는 6월 업데이트" }

        trait :fixed_id do
            id { 1 }
        end
    end
end