# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  trait :with_shop do
    shop
  end

  trait :without_shop do
    shop_id nil
    shop    nil
  end

  trait :with_nonexistent_shop do
    shop_id 9999999
  end
end
