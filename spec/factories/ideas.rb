# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :idea, traits: [:with_trade] do
    sequence(:body) { |n| "body#{n}" }

    trait :without_body do
      body ''
    end
  end
end
