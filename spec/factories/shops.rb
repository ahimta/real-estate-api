# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :shop, traits: [:with_name,:with_phone,:with_rating,:with_notes,:with_trade]
end
