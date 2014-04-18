class Shop < ActiveRecord::Base
  props = ModelProps.new(Shop, [Phonable,Priceble,Tradable,Notable,Namable,Ratable],
    counter_caches: [:workers_count], parents: [:Trade])

  ATTRIBUTES     = props.attrs
  SAFE_PARAMS    = props.safe_params
  INVALID_TRAITS = props.invalid_traits
  VALID_TRAITS   = props.valid_traits

  has_many :workers, dependent: :destroy
end
