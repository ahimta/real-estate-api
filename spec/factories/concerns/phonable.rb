# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  trait :with_phone do
    sequence(:phone) { |n| "phone#{n}" }
  end

  trait :without_phone do
    phone ''
  end
end
