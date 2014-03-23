module Rateble
  extend ActiveSupport::Concern

  ATTRIBUTES     = [:rating]
  INVALID_TRAITS = [:with_invalid_low_rating,:with_invalid_high_rating]
  VALID_TRAITS   = [:without_rating,:with_rating,:with_highest_rating,:with_lowest_rating]

  included do
    validates(:rating,
      numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 })
  end
end