# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :idea do
    sequence(:body) { |n| "body#{n}" }
    idea_category

    factory :valid_idea do
      body 'body'
    end
    factory :invalid_idea do
      body ''
    end
  end
end
