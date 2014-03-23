# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  trait :with_price do
    sequence(:lower_price)
    higher_price { lower_price + 1 }
  end

  trait :without_price do
    lower_price nil
    higher_price nil
  end
end
