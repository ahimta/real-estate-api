class Worker < ActiveRecord::Base
  props = ModelProps.new(Worker, [Namable,Shopable,Tradable, Identifyable],
    parents: [:Trade, :Shop])

  ATTRIBUTES     = props.attrs
  SAFE_PARAMS    = props.safe_params
  INVALID_TRAITS = props.invalid_traits
  VALID_TRAITS   = props.valid_traits
end
