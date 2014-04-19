# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  # phone
  trait :with_phone do
    sequence(:phone) { |n| "phone#{n}" }
  end

  trait :without_phone do
    phone ''
  end

  # rating
  trait :without_rating do
    rating nil
  end

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

  # notes
  trait :with_notes do
    sequence(:notes) { |n| "notes#{n}" }
  end

  trait :without_notes do
    notes ''
  end
end
