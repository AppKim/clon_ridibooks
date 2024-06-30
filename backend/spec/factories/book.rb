FactoryBot.define do
    factory :book do
        sequence(:id) {|n| n}
        title { "TestBook" }
        content { "TestContent" }
        introduction { "TestIntrodction" }
        thumnail { "TestThumnail" }
        association :publisher
    end
end