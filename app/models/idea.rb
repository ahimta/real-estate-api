class Idea < ActiveRecord::Base
  include Tradable
  include Bodyable

  ATTRIBUTES     = [:id] + Tradable::ATTRIBUTES + Bodyable::ATTRIBUTES
  SAFE_PARAMS    = ATTRIBUTES - [:id]
  INVALID_TRAITS = Tradable::INVALID_TRAITS + Bodyable::INVALID_TRAITS
  VALID_TRAITS   = Tradable::VALID_TRAITS + Bodyable::VALID_TRAITS
end
