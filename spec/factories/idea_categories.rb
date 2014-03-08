# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :idea_category do
    sequence(:name) { |n| "name#{n}"}
    sequence(:description) { |n| "description#{n}"}

    factory :valid_idea_category do
      name 'name'
      description 'description'
    end
    factory :invalid_idea_category do
      name ''
    end
  end
end
