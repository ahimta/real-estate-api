# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :worker,
    traits: [:with_name,:with_phone,:with_notes,:with_rating,:with_trade,:with_shop]
end
