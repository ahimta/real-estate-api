# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :idea, traits: [:with_body,:with_trade]
end
