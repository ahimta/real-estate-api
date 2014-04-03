module Priceble
  extend ActiveSupport::Concern

  ATTRIBUTES     = [:lower_price,:higher_price]
  INVALID_TRAITS = [:with_negative_price]
  VALID_TRAITS   = [:with_price,:without_price]

  included do
    validates :lower_price, :higher_price, numericality:
      { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  end
end