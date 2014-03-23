# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :trade, traits: [:with_name] do
    sequence(:description) { |n| "description#{n}"}

    factory :trade_with_ideas do
      after(:create) do |trade, evaluator|
        create_list(:idea, 2, trade: trade)
      end
    end
  end
end
