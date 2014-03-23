# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  trait :with_rating do
    sequence(:rating) { |n| n % 6 }
  end

  trait :with_highest_rating do
    rating(5)
  end

  trait :with_lowest_rating do
    rating(0)
  end

  trait :with_invalid_low_rating do
    rating(-1)
  end

  trait :with_invalid_high_rating do
    rating(6)
  end
end
