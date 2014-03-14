# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :idea do
    sequence(:body) { |n| "body#{n}" }
    trade

    factory :valid_idea do
      body 'body'
    end
    factory :invalid_idea do
      body ''
    end
    factory :invalid_idea_without_trade do
      body ''
      trade nil
    end
  end
end
