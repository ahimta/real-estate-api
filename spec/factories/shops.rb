# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :shop do
    sequence(:name) { |n| "name#{n}"}
    sequence(:phone) { |n| "phone#{n}" }
    sequence(:lower_price) { |n| n }
    sequence(:higher_price) { |n| n }
    sequence(:rating) { |n| n % 6 }
    sequence(:type) { |n| "type#{n}" }
    sequence(:notes) { |n| "notes#{n}" }
    trade
  end
end
