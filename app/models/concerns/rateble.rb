module Rateble
  extend ActiveSupport::Concern

  included do
    validates :rating, numericality: { only_integer: true, greater_than: -1, less_than: 6 }
  end
end