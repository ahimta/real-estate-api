# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  trait :with_notes do
    sequence(:notes) { |n| "notes#{n}" }
  end

  trait :without_notes do
    notes ''
  end
end
