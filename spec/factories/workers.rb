# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :worker do
    sequence(:name) { |n| "name#{n}" }
    sequence(:phone) { |n| "phone#{n}" }
    sequence(:lower_price)
    sequence(:higher_price)
    sequence(:rating) { |n| n % 6 }
    sequence(:notes) { |n| "notes#{n}" }

    shop
    trade
  end
end
