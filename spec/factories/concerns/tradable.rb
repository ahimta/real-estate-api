# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  trait :with_trade do
    trade
  end

  trait :without_trade do
    trade_id nil
    trade    nil
  end

  trait :with_nonexistent_trade do
    trade_id 9999999
  end
end
