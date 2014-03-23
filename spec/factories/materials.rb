# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :material, traits: [:with_name,:with_price,:with_rating,:with_notes,:with_shop,:with_trade] do
    sequence(:material_type) { |n| "material_type#{n}" }
  end
end
