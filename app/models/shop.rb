class Shop < ActiveRecord::Base
  include Phonable
  include Priceble
  include Tradable
  include Notable
  include Nameble
  include Rateble

  ATTRIBUTES     = [:id] + Tradable::ATTRIBUTES + Priceble::ATTRIBUTES + Nameble::ATTRIBUTES +
    Rateble::ATTRIBUTES + Phonable::ATTRIBUTES + Notable::ATTRIBUTES +
    [:workers_count,:materials_count]

  SAFE_PARAMS    = ATTRIBUTES - [:id,:workers_count,:materials_count]

  INVALID_TRAITS = Tradable::INVALID_TRAITS + Priceble::INVALID_TRAITS + Nameble::INVALID_TRAITS +
    Rateble::INVALID_TRAITS + Phonable::INVALID_TRAITS + Notable::INVALID_TRAITS

  VALID_TRAITS   = Tradable::VALID_TRAITS + Priceble::VALID_TRAITS + Nameble::VALID_TRAITS +
    Rateble::VALID_TRAITS + Phonable::VALID_TRAITS + Notable::VALID_TRAITS

  has_many :workers, dependent: :destroy
end
