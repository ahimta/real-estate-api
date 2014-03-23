class Worker < ActiveRecord::Base
  include Phonable
  include Priceble
  include Shopable
  include Tradable
  include Notable
  include Nameble
  include Rateble

  ATTRIBUTES     = [:id] + Tradable::ATTRIBUTES + Shopable::ATTRIBUTES + Priceble::ATTRIBUTES +
    Nameble::ATTRIBUTES + Rateble::ATTRIBUTES + Phonable::ATTRIBUTES + Notable::ATTRIBUTES

  INVALID_TRAITS = Tradable::INVALID_TRAITS + Shopable::INVALID_TRAITS + Priceble::INVALID_TRAITS +
    Nameble::INVALID_TRAITS + Rateble::INVALID_TRAITS + Phonable::INVALID_TRAITS + Notable::INVALID_TRAITS

  VALID_TRAITS   = Tradable::VALID_TRAITS + Shopable::VALID_TRAITS + Priceble::VALID_TRAITS +
    Nameble::VALID_TRAITS + Rateble::VALID_TRAITS + Phonable::VALID_TRAITS + Notable::VALID_TRAITS
end
