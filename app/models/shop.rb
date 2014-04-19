class Shop < ActiveRecord::Base

  def self.props
    @props ||= ModelProps.new(Shop, [Tradable,Namable,Identifyable],
      counter_caches: [:workers_count], parents: [:Trade])
  end

  ATTRIBUTES     = props.attrs
  SAFE_PARAMS    = props.safe_params
  INVALID_TRAITS = props.invalid_traits
  VALID_TRAITS   = props.valid_traits

  has_many :workers, dependent: :destroy
end
