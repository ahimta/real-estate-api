module Priceble
  extend ActiveSupport::Concern

  ATTRIBUTES     = [:lower_price,:higher_price]
  INVALID_TRAITS = [:with_non_integer_price,:with_negative_price,:with_invalid_price]
  VALID_TRAITS   = [:with_price,:without_price]

  included do
    validates :lower_price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :higher_price, numericality: { only_integer: true,
      greater_than_or_equal_to: ->(priceble) { priceble.lower_price } }
  end
end