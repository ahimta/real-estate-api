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

  trait :with_invalid_price do
    higher_price { lower_price - 1 }
  end

  trait :with_non_integer_price do
    higher_price 'Hi'
  end

  trait :with_negative_price do
    lower_price(-1)
  end
end
