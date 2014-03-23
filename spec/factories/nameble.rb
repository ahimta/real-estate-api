# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  trait :with_name do
    sequence(:name) { |n| "name#{n}" }
  end

  trait :without_name do
    name ''
  end
end
