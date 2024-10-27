FactoryBot.define do
    factory :category do
      name { "Default Category" }
      depth { 0 }
      parent_id { nil }
  
      transient do
        children { [] }
      end
  
      after(:create) do |category, evaluator|
        evaluator.children.each do |child_name|
          create(:category, name: child_name, depth: 1, parent_id: category.id)
        end
      end
    end
  end