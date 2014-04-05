class Trade < ActiveRecord::Base
  props = ModelProps.new(Trade, [Namable],
    counter_caches: [:ideas_count,:shops_count,:workers_count,:materials_count])

  ATTRIBUTES     = props.attrs
  SAFE_PARAMS    = props.safe_params
  INVALID_TRAITS = props.invalid_traits
  VALID_TRAITS   = props.valid_traits

  has_many :ideas, dependent: :destroy
  has_many :shops, dependent: :destroy
  has_many :workers, dependent: :destroy
end
