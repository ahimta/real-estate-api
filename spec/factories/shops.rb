# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :shop, traits: [:with_name,:with_trade,:with_rating] do
    sequence(:phone) { |n| "phone#{n}" }
    sequence(:lower_price)
    sequence(:higher_price)
    sequence(:notes) { |n| "notes#{n}" }
  end
end
