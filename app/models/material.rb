class Material < ActiveRecord::Base
  props = ModelProps.new(Material, [Namable,Notable,Priceble,Ratable,Shopable,Tradable],
    attrs: [:material_type])

  ATTRIBUTES     = props.attrs
  SAFE_PARAMS    = props.safe_params
  INVALID_TRAITS = props.invalid_traits
  VALID_TRAITS   = props.valid_traits
end
