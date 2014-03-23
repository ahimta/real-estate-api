# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  trait :with_body do
    sequence(:body) { |n| "body#{n}" }
  end

  trait :without_body do
    body ''
  end
end
